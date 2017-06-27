////////////////////////////////////////////////////////////////////////////////////////////////
////	Author:	Petruk A																	////
////	Data:	22/06/2017																	////
////																						////
////	Description: master for verification		 										////
////																						////
////////////////////////////////////////////////////////////////////////////////////////////////

module master 
#(
	parameter LOAD
)
(	
	input				clk,
	input 				reset_n,
	/*
	input 				master_req,	//однобитный сигнал, запрос на выполнение транзакции (master-> slave)
	input 	[31:0]		master_addr,	//32-битный шина, содержит адрес запроса (master->slave)
	input				master_cmd,	//однобитный сигнал Ц признак операции: 0 - read, 1 Цwrite (master->slave)
	input	[31:0]		master_wdata,	//- 32-битный шина, содержит записываемые данные. передаютс€ в том же такте , что и адрес (master-> slave)
	input				master_ack,	//однобитный сигнал-подтверждение, что в данном такте slave прин€л запрос к исполнению (slave->master).
	input 	[31:0]		master_rdata,	//- 32-битна€ шина, содержит считываемые данные. передаютс€ на следующем такте после подтверждени€ транзакции(_ack = 1)(slave-> master)
*/
	m_s_ifc.master_port     master_ifc 
);



	logic 				master_req;	//однобитный сигнал, запрос на выполнение транзакции (master-> slave)
	logic 	[31:0]		master_addr;	//32-битный шина, содержит адрес запроса (master->slave)
	logic				master_cmd;	//однобитный сигнал Ц признак операции: 0 - read, 1 Цwrite (master->slave)
	logic	[31:0]		master_wdata;	//- 32-битный шина, содержит записываемые данные. передаютс€ в том же такте , что и адрес (master-> slave)
	logic  				master_ack;	//однобитный сигнал-подтверждение, что в данном такте slave прин€л запрос к исполнению (slave->master).
	logic 	[31:0]		master_rdata;
	logic				master_resp;
	
	
	reg		[7:0]		delay_cnt; // задержка 
	int i;
	assign		master_ifc.master_slave_req = master_req;
	assign		master_ifc.master_slave_addr = master_addr;
	assign		master_ifc.master_slave_cmd = master_cmd;
	assign		master_ifc.master_slave_wdata = master_wdata;
	assign		master_ack = master_ifc.slave_master_ack;
	assign		master_rdata = master_ifc.slave_master_rdata;
	assign		master_resp = master_ifc.slave_master_resp;
	
	initial
		begin
				$srandom(LOAD);
				i=0;
		end
always @( posedge clk or negedge reset_n )
	begin
		if ( !reset_n )
			begin
				master_req = 0;
				delay_cnt = 0;
				master_addr = 0;
				master_cmd = 0;
				master_wdata = 0;
			end
		else 
			begin
				if ( master_ack )
					begin
						master_req = 0;
					end
				else if ( /*master_ack ||*/ !master_req )
					begin
						master_req = $urandom(LOAD+i)%2;//						$urandom_range(1, 0);
						$display("\t @%0dns Master %d   random req = %d", $time, LOAD, $urandom(LOAD+i)%2);		
						if ( master_req )
							begin
								master_addr [29:0] = $urandom_range(200, 0);
								master_addr [31:30] = $urandom_range(3, 0);
								master_cmd = $urandom_range(1, 0);
								if ( master_cmd )
									begin
										master_wdata = $urandom_range(25000, 0);
									end
								else
									begin
										master_wdata = '0;
									end
							end
						
						i++;
					end
				if ( master_req == 0 )
							begin
								master_addr = 0;
								master_cmd = 0;
							end	
			end
	end

endmodule	
