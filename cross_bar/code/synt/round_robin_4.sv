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
/*	output logic			master_1_ack_1,
	output logic			master_2_ack_2,
	output logic			master_3_ack_3,
	output logic			master_4_ack_4*/
);

	logic [3:0]				enable;
	logic 					master_1_en_req;
	logic 					master_2_en_req;
	logic 					master_3_en_req;
	logic 					master_4_en_req;
	
	logic 	[3:0]			mask_en;
	
	logic	[3:0]			req_now;
	/*
	logic			master_1_ack_1;
	logic			master_2_ack_2;
	logic			master_3_ack_3;
	logic			master_4_ack_4;
	*/
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
	//	if ( !reset_n )
	//		begin
				number_master_en = 0;
				slave_req = 0;
				mask_en = 0;
	//		end
	//	mask_en = mask_en;
	//	slave_req = 0;	
		NextState = State;
		if (( master_1_addr == SLAVE ) || ( master_2_addr == SLAVE ) || ( master_3_addr == SLAVE ) || ( master_4_addr == SLAVE ) )
			begin
		case (State)
		
		IDLE:		begin	//если нет запросов на слэйв
						if ( !master_1_en_req && !master_2_en_req && !master_3_en_req && !master_4_en_req)
							begin
								slave_req = 0;
								NextState = State;
								mask_en = 0;
							end
							//запросов на слэйв 1
						else if ( master_1_en_req && !master_2_en_req && !master_3_en_req && !master_4_en_req)
							begin
								NextState = MASTER0;
								number_master_en = 1;
								slave_req = 1;
								mask_en[0]= 1;
							end
							//запросов на слэйв 2
						else if ( !master_1_en_req && master_2_en_req && !master_3_en_req && !master_4_en_req)
							begin
								NextState = MASTER1;
								number_master_en = 2;
								slave_req = 1;
								mask_en[1]= 1;
							end
							//запросов на слэйв 3
						else if ( !master_1_en_req && !master_2_en_req && master_3_en_req && !master_4_en_req)
							begin
								NextState = MASTER2;
								number_master_en = 3;
								slave_req = 1;
								mask_en[2]= 1;
							end
							//запросов на слэйв 4
						else if ( !master_1_en_req && !master_2_en_req && !master_3_en_req && master_4_en_req)
							begin
								NextState = MASTER3;
								number_master_en = 4;
								slave_req = 1;
								mask_en[3]= 1;
							end	
							//множество запросов 
						else 
							begin
								if ( !mask_en[0] && req_now[0] )
									begin
										NextState = MASTER0;
										number_master_en = 1;
										slave_req = 1;
										mask_en[0]= 1;
									end
								else if ( !mask_en[1] && req_now[1] )
									begin
										NextState = MASTER1;
										number_master_en = 2;
										slave_req = 1;
										mask_en[1]= 1;
									end
								else if ( !mask_en[2] && req_now[2] )
									begin
										NextState = MASTER2;
										number_master_en = 3;
										slave_req = 1;
										mask_en[2]= 1;
									end
								else if ( !mask_en[3] && req_now[3] )
									begin
										NextState = MASTER3;
										number_master_en = 4;
										slave_req = 1;
										mask_en[3]= 1;
									end
								
							end
						
		
					end
					
		MASTER0:	begin
						number_master_en = 1;
						slave_req = 1;
						if ( slave_ack )
							begin
								mask_en[0]= 1;
								number_master_en = 1;
								slave_req = 0;
								if( !mask_en[1] && req_now[1] )
									begin
										NextState = MASTER1;
								//		number_master_en = 2;
										slave_req = 1;
									//	mask_en[1]= 1;
									end
								else if ( !mask_en[2] && req_now[2] )
									begin
										NextState = MASTER2;
								//		number_master_en = 3;
										slave_req = 1;
									//	mask_en[2]= 1;
									end
								else if ( !mask_en[3] && req_now[3] )
									begin
										NextState = MASTER3;
								//		number_master_en = 4;
										slave_req = 1;
									//	mask_en[3]= 1;
									end		
								else 
									begin
										NextState = IDLE;
								//		number_master_en = 1;
										slave_req = 1;
										mask_en= 0;
									end
							end
						
					end
					
		MASTER1:	begin
						number_master_en = 2;	
						slave_req = 1;
						if ( slave_ack )
							begin
								mask_en[1]= 1;
								number_master_en = 2;
								slave_req = 0;
								if( !mask_en[0] && req_now[0] )
									begin
										NextState = MASTER0;
								//		number_master_en = 1;
										slave_req = 1;
									//	mask_en[1]= 1;
									end
								else if ( !mask_en[2] && req_now[2] )
									begin
										NextState = MASTER2;
								//		number_master_en = 3;
										slave_req = 1;
									//	mask_en[2]= 1;
									end
								else if ( !mask_en[3] && req_now[3] )
									begin
										NextState = MASTER3;
								//		number_master_en = 4;
										slave_req = 1;
									//	mask_en[3]= 1;
									end		
								else 
									begin
										NextState = IDLE;
								//		number_master_en = 2;
										slave_req = 1;
										mask_en= 0;
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
								mask_en[2]= 1;
								if( !mask_en[0] && req_now[0] )
									begin
										NextState = MASTER0;
								//		number_master_en = 1;
										slave_req = 1;
								//		mask_en[1]= 1;
									end
								else if ( !mask_en[1] && req_now[1] )
									begin
										NextState = MASTER1;
								//		number_master_en = 2;
										slave_req = 1;
								//		mask_en[1]= 1;
									end
								else if ( !mask_en[3] && req_now[3] )
									begin
										NextState = MASTER3;
								//		number_master_en = 4;
										slave_req = 1;
								//		mask_en[3]= 1;
									end		
								else 
									begin
										NextState = IDLE;
								//		number_master_en = 3;
										slave_req = 1;
										mask_en= 0;
									end
							end
					end
			
		MASTER3:	begin
						number_master_en = 4;
						slave_req = 1;
						if ( slave_ack )
							begin
								mask_en[3]= 1;
								number_master_en = 4;
								slave_req = 0;
								if( !mask_en[0] && req_now[0] )
									begin
										NextState = MASTER0;
								//		number_master_en = 1;
										slave_req = 1;
								//		mask_en[1]= 1;
									end
								else if ( !mask_en[1] && req_now[1] )
									begin
										NextState = MASTER1;
								//		number_master_en = 2;
										slave_req = 1;
								//		mask_en[1]= 1;
									end
								else if ( !mask_en[2] && req_now[2] )
									begin
										NextState = MASTER2;
								//		number_master_en = 3;
										slave_req = 1;
								//		mask_en[2]= 1;
									end		
								else 
									begin
										NextState = IDLE;
								//		number_master_en = 4;
										slave_req = 1;
										mask_en= 0;
									end
							end
					end	
		
		endcase;
		end
	end
	
	/*
always @(*)
	begin
		if ( !reset_n )
			begin
				master_1_ack_1 = 0;
				master_2_ack_2 = 0;
				master_3_ack_3 = 0;
				master_4_ack_4 = 0;
			end
				master_1_ack_1 = 0;
				master_2_ack_2 = 0;
				master_3_ack_3 = 0;
				master_4_ack_4 = 0;
		case (State)
		
		IDLE:		begin
						master_1_ack_1 = 0;
						master_2_ack_2 = 0;
						master_3_ack_3 = 0;
						master_4_ack_4 = 0;
					end
		
		MASTER0:	begin
						if ( slave_ack )
						master_1_ack_1 = 1;
					end
					
		MASTER1:	begin
						if ( slave_ack )
						master_2_ack_2 = 1;
					end
		
		MASTER2:	begin
						if ( slave_ack )
						master_3_ack_3 = 1;
					end
					
		MASTER3:	begin
						if ( slave_ack )
						master_4_ack_4 = 1;
					end	
		
		endcase
	end
	
	*/
endmodule