////////////////////////////////////////////////////////////////////////////////////////////////
////	Author:	Petruk A																	////
////	Data:	23/05/2017																	////
////																						////
////	Description: emulator cross_bar 4 master 4 slave device 							////
////																						////
////////////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
//`include "interface.sv"



module top_tb;


logic		clk;
logic	reset_n;

/*logic			master_1_req;
logic			master_2_req;
logic	[31:0]	master_1_addr;
logic	[31:0]	master_2_addr;
logic			master_1_cmd;
logic			master_2_cmd;
logic	[31:0]	master_1_wdata;
logic	[31:0]	master_2_wdata;
logic			slave_1_ack;
logic			slave_2_ack;
logic	[31:0]	slave_1_rdata;
logic	[31:0]	slave_2_rdata;
logic			slave_1_req;
logic			slave_2_req;
logic	[31:0]	slave_1_addr;
logic	[31:0]	slave_2_addr;
logic			slave_1_cmd;
logic			slave_2_cmd;
logic	[31:0]	slave_1_wdata;
logic	[31:0]	slave_2_wdata;
logic			master_1_ack;
logic			master_2_ack;
logic	[31:0]	master_1_rdata;
logic	[31:0]	master_2_rdata;

logic 	dalay;*/
m_s_ifc/*.master_port*/     master_ifc_1();
m_s_ifc/*.master_port*/     master_ifc_2();
m_s_ifc/*.master_port*/     master_ifc_3();
m_s_ifc/*.master_port*/     master_ifc_4();
m_s_ifc/*.slave_port*/     	slave_ifc_1();
m_s_ifc/*.slave_port*/     	slave_ifc_2();
m_s_ifc/*.slave_port*/     	slave_ifc_3();
m_s_ifc/*.slave_port*/     	slave_ifc_4();


//m_s_ifc/*.slave_port*/     	slave_ifc_3();
master 
#(11)
master_i1
(
	.clk		(clk),
	.reset_n	(reset_n),
	.master_ifc	(master_ifc_1.master_port)
);

master 
#(232)
master_i2
(
	.clk		(clk),
	.reset_n	(reset_n),
	.master_ifc	(master_ifc_2.master_port)
);

master 
#(321)
master_i3
(
	.clk		(clk),
	.reset_n	(reset_n),
	.master_ifc	(master_ifc_3.master_port)
);

master 
#(401)
master_i4
(
	.clk		(clk),
	.reset_n	(reset_n),
	.master_ifc	(master_ifc_4.master_port)
);

slave
#(
	.NUMBER_SLAVE (4)
)
slave_i1
(
	.clk		(clk),
	.reset_n	(reset_n),
	.slave_ifc	(slave_ifc_1.slave_port)		
);

slave
#(
	.NUMBER_SLAVE (4)
)
slave_i2
(
	.clk		(clk),
	.reset_n	(reset_n),
	.slave_ifc	(slave_ifc_2.slave_port)		
);

slave
#(
	.NUMBER_SLAVE (4)
)
slave_i3
(
	.clk		(clk),
	.reset_n	(reset_n),
	.slave_ifc	(slave_ifc_3.slave_port)		
);

slave
#(
	.NUMBER_SLAVE (4)
)
slave_i4
(
	.clk		(clk),
	.reset_n	(reset_n),
	.slave_ifc	(slave_ifc_4.slave_port)		
);

cross_bar
#()
cross_bar_i1
(
	.clk(clk),
	.reset_n(reset_n),
	.master_slave_ifc_1(master_ifc_1.slave_port),
	.master_slave_ifc_2(master_ifc_2.slave_port),
	.master_slave_ifc_3(master_ifc_3.slave_port),
	.master_slave_ifc_4(master_ifc_4.slave_port),
	.slave_master_ifc_1(slave_ifc_1.master_port),
	.slave_master_ifc_2(slave_ifc_2.master_port),
	.slave_master_ifc_3(slave_ifc_3.master_port),
	.slave_master_ifc_4(slave_ifc_4.master_port)
	
	/*.master_1_req(master_ifc_1.master_req),	//однобитный сигнал, запрос на выполнение транзакции (master-> slave)
	.master_1_addr(master_ifc_1.master_1_addr),	//32-битный шина, содержит адрес запроса (master->slave)
	.master_1_cmd(master_1_cmd),	//однобитный сигнал – признак операции: 0 - read, 1 –write (master->slave)
	.master_1_wdata(master_1_wdata),	//- 32-битный шина, содержит записываемые данные. передаются в том же такте , что и адрес (master-> slave)
	.slave_1_ack(slave_1_ack),	//однобитный сигнал-подтверждение, что в данном такте slave принял запрос к исполнению (slave->master).
	.slave_1_rdata(slave_1_rdata), 	//- 32-битная шина, содержит считываемые данные. передаются на следующем такте после подтверждения транзакции(_ack = 1)(slave-> master)

	
	.master_2_req(master_2_req),
	.master_2_addr(master_2_addr),
	.master_2_cmd(master_2_cmd),
	.master_2_wdata(master_2_wdata),
	.slave_2_ack(slave_2_ack),
	.slave_2_rdata(slave_2_rdata),
	
	.slave_1_req(slave_1_req),
	.slave_1_addr(slave_1_addr),
	.slave_1_cmd(slave_1_cmd),
	.slave_1_wdata(slave_1_wdata),
	.master_1_ack(master_1_ack),
	.master_1_rdata(master_1_rdata),
	
	.slave_2_req(slave_2_req),
	.slave_2_addr(slave_2_addr),
	.slave_2_cmd(slave_2_cmd),
	.slave_2_wdata(slave_2_wdata),
	.master_2_ack(master_2_ack),
	.master_2_rdata(master_2_rdata)
	*/
	
);

initial begin
	
	clk=0;
	reset_n=0;
/*	master_1_req=0;
	master_2_req=0;
	master_1_addr=0;
	master_2_addr=0;
	master_1_cmd=0;
	master_2_cmd=0;
	master_1_wdata=0;
	master_2_wdata=0;
	slave_1_ack=0;
	slave_2_ack=0;
	slave_1_rdata=0;
	slave_2_rdata=0;
	slave_1_req=0;
	slave_2_req=0;
	slave_1_addr=0;
	slave_2_addr=0;
	slave_1_cmd=0;
	slave_2_cmd=0;
	slave_1_wdata=0;
	slave_2_wdata=0;
	master_1_ack=0;
	master_2_ack=0;
	master_1_rdata=0;
	master_2_rdata=0;*/
	#30
	
	reset_n=1;
/*	repeat (100)
		begin
			 @ (posedge clk);
			 if (master_1_ack ||  !master_1_req )
				begin
					master_1_req = $urandom_range(1, 0);
				end
			if ( master_2_ack || !master_2_req )
				begin
					master_2_req = $urandom_range(1, 0);
				end
			if ( master_1_req )
				begin
					master_1_addr [30:0] = $urandom_range(200, 0);
					master_1_addr [31] = $urandom_range(1, 0);
					master_1_wdata = $urandom_range(25000, 0);
					master_1_cmd = $urandom_range(1, 0);
				end
				
			if ( master_2_req )
				begin
					master_2_addr [30:0] = $urandom_range(200, 0);
					master_2_addr [31] = $urandom_range(1, 0);
					master_2_wdata = $urandom_range(25000, 0);
					master_2_cmd = $urandom_range(1, 0);
				end	
			
			dalay = $urandom_range(5, 0);
			for ( int i = 0; i<= dalay ; i++ )//if ( dalay )
				begin
					 @ (posedge clk);
				end
		end
*/
	#250000
	$stop();
end

//запуск CLK
initial forever #10 clk=!clk;	
/*
always @(*)
	begin
		if ( slave_1_req )
			begin
				slave_1_ack = 1;
				 @ (posedge clk);
			end
		else
			begin
				slave_1_ack = 0;
				 @ (posedge clk);
			end
	end	

always @(*)
	begin
		if ( slave_2_req )
			begin
				slave_2_ack = 1;
				 @ (posedge clk);
			end
		else
			begin
				slave_2_ack = 0;
				 @ (posedge clk);
			end
	end	
	*/

endmodule



