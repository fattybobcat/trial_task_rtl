////////////////////////////////////////////////////////////////////////////////////////////////
////	Author:	Petruk A																	////
////	Data:	23/06/2017																	////
////																						////
////	Description: round_robin_4					 										////
////																						////
////////////////////////////////////////////////////////////////////////////////////////////////
module round_robin_4 
#(
	parameter SLAVE = 0
)
(	
	input 					clk,
	input 					reset_n,
	input 					master_1_req,
	input 					master_2_req,
	input 					master_3_req,
	input 					master_4_req,
	input 			[1:0]	master_1_addr,
	input 			[1:0]	master_2_addr,
	input 			[1:0]	master_3_addr,
	input 			[1:0]	master_4_addr,
	input 					slave_ack,
	
	output logic 	[2:0] 	number_master_en,
	output logic 			slave_req

);

	logic [3:0]				enable;
	logic 					master_1_en_req;
	logic 					master_2_en_req;
	logic 					master_3_en_req;
	logic 					master_4_en_req;
	
	logic 	[3:0]			mask_en;
	
	logic	[3:0]			req_now;

	logic	[2:0]			cnt_nen_master_1;
	logic	[2:0]			cnt_nen_master_2;
	logic	[2:0]			cnt_nen_master_3;
	logic	[2:0]			cnt_nen_master_4;
	
//смотрим какие сигналы поступают на конкретный слэйв	
	
assign enable[0] = (master_1_req && (master_1_addr == SLAVE[1:0] ))? 1'b1 : 1'b0;
assign enable[1] = (master_2_req && (master_2_addr == SLAVE[1:0] ))? 1'b1 : 1'b0;
assign enable[2] = (master_3_req && (master_3_addr == SLAVE[1:0] ))? 1'b1 : 1'b0;
assign enable[3] = (master_4_req && (master_4_addr == SLAVE[1:0] ))? 1'b1 : 1'b0;

assign master_1_en_req = (enable[0])? master_1_req : 1'b0;
assign master_2_en_req = (enable[1])? master_2_req : 1'b0;
assign master_3_en_req = (enable[2])? master_3_req : 1'b0;
assign master_4_en_req = (enable[3])? master_4_req : 1'b0;

// знать какие мастера требуют слэйв в настоящий момент времени
assign req_now = {master_4_en_req,master_3_en_req,master_2_en_req,master_1_en_req};
	

	
enum {IDLE, MASTER0, MASTER1, MASTER2, MASTER3} State, NextState;

always @(posedge clk or negedge reset_n)
	begin
		if( !reset_n )
			begin
				State <= IDLE;
			end
		else 
			begin
				State <= NextState;
			end
	end

	
	
always @(*)
	begin
		number_master_en = 0;
		slave_req = 0;
		if ( slave_ack )
			begin
			

			end
		NextState = State;
		if (( master_1_addr == SLAVE ) || ( master_2_addr == SLAVE ) || ( master_3_addr == SLAVE ) || ( master_4_addr == SLAVE ) )
			begin
		case (State)
		
		IDLE:		begin	//если нет запросов на слэйв
						if ( !master_1_en_req && !master_2_en_req && !master_3_en_req && !master_4_en_req)
							begin
								slave_req = 0;
								NextState = State;
							end
							//запросов на слэйв 1
						else if ( master_1_en_req && !master_2_en_req && !master_3_en_req && !master_4_en_req)
							begin
								NextState = MASTER0;
								number_master_en = 1;
								slave_req = 1;
							end
							//запросов на слэйв 2
						else if ( !master_1_en_req && master_2_en_req && !master_3_en_req && !master_4_en_req)
							begin
								NextState = MASTER1;
								number_master_en = 2;
								slave_req = 1;
							end
							//запросов на слэйв 3
						else if ( !master_1_en_req && !master_2_en_req && master_3_en_req && !master_4_en_req)
							begin
								NextState = MASTER2;
								number_master_en = 3;
								slave_req = 1;
							end
							//запросов на слэйв 4
						else if ( !master_1_en_req && !master_2_en_req && !master_3_en_req && master_4_en_req)
							begin
								NextState = MASTER3;
								number_master_en = 4;
								slave_req = 1;
							end	
							//множество запросов 
						else 
							begin
								if ( !mask_en[0] && req_now[0] )
									begin
										NextState = MASTER0;
										number_master_en = 1;
										slave_req = 1;
									end
								else if ( !mask_en[1] && req_now[1] )
									begin
										NextState = MASTER1;
										number_master_en = 2;
										slave_req = 1;
									end
								else if ( !mask_en[2] && req_now[2] )
									begin
										NextState = MASTER2;
										number_master_en = 3;
										slave_req = 1;
									end
								else if ( !mask_en[3] && req_now[3] )
									begin
										NextState = MASTER3;
										number_master_en = 4;
										slave_req = 1;
									end
								
							end
						
		
					end
					
		MASTER0:	begin
						number_master_en = 1;
						slave_req = 1;
						
						if ( slave_ack )
							begin
								number_master_en = 1;
								slave_req = 0;
								if( !mask_en[1] && req_now[1] )
									begin
										NextState = MASTER1;
										slave_req = 1;
									end
								else if ( !mask_en[2] && req_now[2] )
									begin
										NextState = MASTER2;
										slave_req = 1;
									end
								else if ( !mask_en[3] && req_now[3] )
									begin
										NextState = MASTER3;
										slave_req = 1;
									end		
								else 
									begin
										NextState = IDLE;
										slave_req = 1;
									end
							end
						
					end
					
		MASTER1:	begin
						number_master_en = 2;	
						slave_req = 1;
						if ( slave_ack )
							begin
								number_master_en = 2;
								slave_req = 0;
								if( !mask_en[0] && req_now[0] )
									begin
										NextState = MASTER0;
										slave_req = 1;
									end
								else if ( !mask_en[2] && req_now[2] )
									begin
										NextState = MASTER2;
										slave_req = 1;
									end
								else if ( !mask_en[3] && req_now[3] )
									begin
										NextState = MASTER3;
										slave_req = 1;
									end		
								else 
									begin
										NextState = IDLE;
										slave_req = 1;
									end
							end
							
					end
					
		MASTER2:	begin
						number_master_en = 3;
						slave_req = 1;
						if ( slave_ack )
							begin
								number_master_en = 3;
								slave_req = 0;
								if( !mask_en[0] && req_now[0] )
									begin
										NextState = MASTER0;
										slave_req = 1;
									end
								else if ( !mask_en[1] && req_now[1] )
									begin
										NextState = MASTER1;
										slave_req = 1;
									end
								else if ( !mask_en[3] && req_now[3] )
									begin
										NextState = MASTER3;
										slave_req = 1;
									end		
								else 
									begin
										NextState = IDLE;
										slave_req = 1;
									end
							end
					end
			
		MASTER3:	begin
						number_master_en = 4;
						slave_req = 1;
							
						if ( slave_ack )
							begin
								number_master_en = 4;
								slave_req = 0;
								if( !mask_en[0] && req_now[0] )
									begin
										NextState = MASTER0;
										slave_req = 1;
									end
								else if ( !mask_en[1] && req_now[1] )
									begin
										NextState = MASTER1;
										slave_req = 1;
									end
								else if ( !mask_en[2] && req_now[2] )
									begin
										NextState = MASTER2;
										slave_req = 1;
									end		
								else 
									begin
										NextState = IDLE;
										slave_req = 1;
									end
							end
					end	
		
		endcase;
		end
	end

always @( posedge clk or negedge reset_n )
	begin
		if ( !reset_n )
			begin
				cnt_nen_master_1 <= 0;
				cnt_nen_master_2 <= 0;
				cnt_nen_master_3 <= 0;
				cnt_nen_master_4 <= 0;
			end
		else
			if ( slave_ack )
				begin
					if ( cnt_nen_master_1 + 1'b1 == 3'd3)
						begin
							cnt_nen_master_1 <= 3'd0;
						end
					else	if ( mask_en[0] == 1'b1 )
						begin
							cnt_nen_master_1<= cnt_nen_master_1 + 1'b1;
						end
						
					if ( cnt_nen_master_2 + 1'b1 == 3'd3)
						begin
							cnt_nen_master_2 <= 3'd0;
						end
					else if ( mask_en[1] == 1'b1)
						begin
							cnt_nen_master_2<= cnt_nen_master_2 + 1'b1;
						end
						
					if ( cnt_nen_master_3 + 1'b1 == 3'd3)
						begin
							cnt_nen_master_3 <= 3'd0;
						end
					else if ( mask_en[2] == 1'b1)
						begin
							cnt_nen_master_3<= cnt_nen_master_3 + 1'b1;
						end
					else if ( mask_en[2] == 1'b0)
						begin
							cnt_nen_master_3 <= 3'd0;
						end
					if ( cnt_nen_master_4 + 1'b1 == 3'd3)
						begin
							cnt_nen_master_4 <= 3'd0;
						end
					else if ( mask_en[3] == 1'b1 )
						begin
							cnt_nen_master_4<= cnt_nen_master_4 + 1'b1;
						end
				end
	end
	
always @(*)
	begin
		if ( !reset_n )
			begin
				mask_en = 0;
			end
		if (cnt_nen_master_1 == 3'd0 )
			begin
				mask_en[0] = 1'b0;
			end
		if (cnt_nen_master_2 == 3'd0 )
			begin
				mask_en[1] = 1'b0;
			end
		if (cnt_nen_master_3 == 3'd0 )
			begin
				mask_en[2] = 1'b0;
			end
		if (cnt_nen_master_4 == 3'd0 )
			begin
				mask_en[3] = 1'b0;
			end

		case (State)
		
		IDLE:		begin
						if ( (cnt_nen_master_1 >= cnt_nen_master_2) && (cnt_nen_master_1 >= cnt_nen_master_3) && (cnt_nen_master_1 >= cnt_nen_master_4 ))
							begin
								mask_en[0] = 1'b0;
							end
						else if ( (cnt_nen_master_2 >= cnt_nen_master_1) && (cnt_nen_master_2 >= cnt_nen_master_3) && (cnt_nen_master_2 >= cnt_nen_master_4 ))
							begin
								mask_en[1] = 1'b0;
							end
						else if ( (cnt_nen_master_3 >= cnt_nen_master_1) && (cnt_nen_master_3 >= cnt_nen_master_2) && (cnt_nen_master_3 >= cnt_nen_master_4 ))
							begin
								mask_en[2] = 1'b0;
							end	
						else //if ( (cnt_nen_master_4 >= cnt_nen_master_1) && (cnt_nen_master_4 >= cnt_nen_master_2) && (cnt_nen_master_4 >= cnt_nen_master_3 ))
							begin
								mask_en[3] = 1'b0;
							end
					end
		
		MASTER0:	begin
						mask_en[0]= 1'b1;
					end
					
		MASTER1:	begin
						mask_en[1]= 1'b1;
					end
		
		MASTER2:	begin
						mask_en[2]= 1'b1;
					end
					
		MASTER3:	begin
						mask_en[3]= 1'b1;
					end	
		
		endcase
	end
	
endmodule