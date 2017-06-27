////////////////////////////////////////////////////////////////////////////////////////////////
////	Author:	Petruk A																	////
////	Data:	23/05/2017																	////
////																						////
////	Description: emulator cross_bar 4 master 4 slave device 							////
////																						////
////////////////////////////////////////////////////////////////////////////////////////////////


module top_q
( 	
	input 						clk,
	input						reset_n,
	input						master_1_req,	//однобитный сигнал, запрос на выполнение транзакции (master-> slave)
	input 		[10:0]			master_1_addr,	//32-битный шина, содержит адрес запроса (master->slave)
	input						master_1_cmd,	//однобитный сигнал – признак операции: 0 - read, 1 –write (master->slave)
	input		[10:0]			master_1_wdata,	//- 32-битный шина, содержит записываемые данные. передаются в том же такте , что и адрес (master-> slave)
	output  reg					master_1_ack,	//однобитный сигнал-подтверждение, что в данном такте slave принял запрос к исполнению (slave->master).
	output 	reg	[10:0]			master_1_rdata, //- 32-битная шина, содержит считываемые данные. передаются на следующем такте после подтверждения транзакции(_ack = 1)(slave-> master)
	output	reg					master_1_resp,
	
	
	
	
	input 						master_2_req,
	input 		[10:0]			master_2_addr,
	input						master_2_cmd,
	input		[10:0]			master_2_wdata,
	output  reg					master_2_ack,
	output 	reg	[10:0]			master_2_rdata,
	output	reg					master_2_resp,
	
	output	reg					slave_1_req,
	output 	reg	[10:0]			slave_1_addr,
	output	reg					slave_1_cmd,
	output	reg	[10:0]			slave_1_wdata,
	input  						slave_1_ack,
	input 		[10:0]			slave_1_rdata,
	input						slave_1_resp,
	
	output	reg					slave_2_req,
	output 	reg	[10:0]			slave_2_addr,
	output	reg					slave_2_cmd,
	output	reg	[10:0]			slave_2_wdata,
	input  						slave_2_ack,
	input 		[10:0]			slave_2_rdata,
	input						slave_2_resp,
//-------------------------------------------------------------------------
	input						master_3_req,	//однобитный сигнал, запрос на выполнение транзакции (master-> slave)
	input 		[10:0]			master_3_addr,	//32-битный шина, содержит адрес запроса (master->slave)
	input						master_3_cmd,	//однобитный сигнал – признак операции: 0 - read, 1 –write (master->slave)
	input		[10:0]			master_3_wdata,	//- 32-битный шина, содержит записываемые данные. передаются в том же такте , что и адрес (master-> slave)
	output  reg					master_3_ack,	//однобитный сигнал-подтверждение, что в данном такте slave принял запрос к исполнению (slave->master).
	output 	reg	[10:0]			master_3_rdata, 	//- 32-битная шина, содержит считываемые данные. передаются на следующем такте после подтверждения транзакции(_ack = 1)(slave-> master)
	output	reg					master_3_resp,
	
	
	input 		[10:0]			master_4_req,
	input 						master_4_addr,
	input						master_4_cmd,
	input		[10:0]			master_4_wdata,
	output  reg					master_4_ack,
	output 	reg	[10:0]			master_4_rdata,
	output	reg					master_4_resp,
	
	output	reg					slave_3_req,
	output 	reg	[10:0]			slave_3_addr,
	output	reg					slave_3_cmd,
	output	reg	[10:0]			slave_3_wdata,
	input  						slave_3_ack,
	input 		[10:0]			slave_3_rdata,
	input						slave_3_resp,
	
	output	reg					slave_4_req,
	output 	reg	[10:0]			slave_4_addr,
	output	reg					slave_4_cmd,
	output	reg	[10:0]			slave_4_wdata,
	input  						slave_4_ack,
	input 		[10:0]			slave_4_rdata,
	input						slave_4_resp	


	
);
	


m_s_ifc/*.master_port*/     master_ifc_1();
m_s_ifc/*.master_port*/     master_ifc_2();
m_s_ifc/*.master_port*/     master_ifc_3();
m_s_ifc/*.master_port*/     master_ifc_4();
m_s_ifc/*.slave_port*/     	slave_ifc_1();
m_s_ifc/*.slave_port*/     	slave_ifc_2();
m_s_ifc/*.slave_port*/     	slave_ifc_3();
m_s_ifc/*.slave_port*/     	slave_ifc_4();

//-------------------------------------------------------------------------
//-----------------назначение для первого мастера--------------------------	
	assign	master_ifc_1.master_slave_req=master_1_req;
	assign	master_ifc_1.master_slave_addr[10:0]=master_1_addr;
	assign	master_ifc_1.master_slave_cmd = master_1_cmd;
	assign	master_ifc_1.master_slave_wdata[10:0]=master_1_wdata;
	assign	master_1_ack = master_ifc_1.slave_master_ack 	;
	assign	master_1_rdata = master_ifc_1.slave_master_rdata[10:0];
	assign	master_1_resp = master_ifc_1.slave_master_resp;
//-------------------------------------------------------------------------
//-----------------назначение для второго мастера--------------------------	
	assign	master_ifc_2.master_slave_req=master_2_req;
	assign	master_ifc_2.master_slave_addr[10:0]=master_2_addr;
	assign	master_ifc_2.master_slave_cmd = master_2_cmd;
	assign	master_ifc_2.master_slave_wdata[10:0]=master_2_wdata;
	assign	master_2_ack = master_ifc_2.slave_master_ack 	;
	assign	master_2_rdata = master_ifc_2.slave_master_rdata[10:0];
	assign	master_2_resp = master_ifc_2.slave_master_resp;
//-------------------------------------------------------------------------
//-----------------назначение для третьего мастера--------------------------	
	assign	master_ifc_3.master_slave_req=master_3_req;
	assign	master_ifc_3.master_slave_addr[10:0]=master_3_addr;
	assign	master_ifc_3.master_slave_cmd = master_3_cmd;
	assign	master_ifc_3.master_slave_wdata[10:0]=master_3_wdata;
	assign	master_3_ack = master_ifc_3.slave_master_ack 	;
	assign	master_3_rdata = master_ifc_3.slave_master_rdata[10:0];
	assign	master_3_resp = master_ifc_3.slave_master_resp;
//-------------------------------------------------------------------------
//-----------------назначение для четвертого мастера--------------------------	
	assign	master_ifc_4.master_slave_req=master_4_req;
	assign	master_ifc_4.master_slave_addr[10:0]=master_4_addr;
	assign	master_ifc_4.master_slave_cmd = master_4_cmd;
	assign	master_ifc_4.master_slave_wdata[10:0]=master_4_wdata;
	assign	master_4_ack = master_ifc_4.slave_master_ack 	;
	assign	master_4_rdata = master_ifc_4.slave_master_rdata[10:0];
	assign	master_4_resp = master_ifc_4.slave_master_resp;
//-------------------------------------------------------------------------
//-----------------назначение для первого слэйва--------------------------	
	assign	slave_ifc_1.slave_master_ack = slave_1_ack;
	assign	slave_ifc_1.slave_master_rdata[10:0] = slave_1_rdata ;
	assign	slave_ifc_1.slave_master_resp = slave_1_resp;
	assign	slave_1_req = slave_ifc_1.master_slave_req;
	assign	slave_1_addr = slave_ifc_1.master_slave_addr[10:0] ;
	assign	slave_1_cmd = slave_ifc_1.master_slave_cmd;
	assign	slave_1_wdata = slave_ifc_1.master_slave_wdata[10:0];
//-------------------------------------------------------------------------
//-----------------назначение для второго слэйва--------------------------	
	assign	slave_ifc_2.slave_master_ack = slave_2_ack;
	assign	slave_ifc_2.slave_master_rdata[10:0] = slave_2_rdata ;
	assign	slave_ifc_2.slave_master_resp = slave_2_resp;
	assign	slave_2_req = slave_ifc_2.master_slave_req;
	assign	slave_2_addr = slave_ifc_2.master_slave_addr[10:0] ;
	assign	slave_2_cmd = slave_ifc_2.master_slave_cmd;
	assign	slave_2_wdata = slave_ifc_2.master_slave_wdata[10:0];
//-------------------------------------------------------------------------
//-----------------назначение для третьего слэйва--------------------------	
	assign	slave_ifc_3.slave_master_ack = slave_3_ack;
	assign	slave_ifc_3.slave_master_rdata[10:0] = slave_3_rdata ;
	assign	slave_ifc_3.slave_master_resp = slave_3_resp;
	assign	slave_3_req = slave_ifc_3.master_slave_req;
	assign	slave_3_addr = slave_ifc_3.master_slave_addr[10:0] ;
	assign	slave_3_cmd = slave_ifc_3.master_slave_cmd;
	assign	slave_3_wdata = slave_ifc_3.master_slave_wdata[10:0];
//-------------------------------------------------------------------------
//-----------------назначение для четвертого слэйва--------------------------	
	assign	slave_ifc_4.slave_master_ack = slave_4_ack;
	assign	slave_ifc_4.slave_master_rdata[10:0] = slave_4_rdata ;
	assign	slave_ifc_4.slave_master_resp = slave_4_resp;
	assign	slave_4_req = slave_ifc_4.master_slave_req;
	assign	slave_4_addr = slave_ifc_4.master_slave_addr[10:0] ;
	assign	slave_4_cmd = slave_ifc_4.master_slave_cmd;
	assign	slave_4_wdata = slave_ifc_4.master_slave_wdata[10:0];
	






cross_bar  cross_bar_i1
(	.clk(clk),
	.reset_n(reset_n),
	// объявление интерфейсов
	.master_slave_ifc_1(master_ifc_1.slave_port),
	.master_slave_ifc_2(master_ifc_2.slave_port),
	.master_slave_ifc_3(master_ifc_3.slave_port),
	.master_slave_ifc_4(master_ifc_4.slave_port),
	.slave_master_ifc_1(slave_ifc_1.master_port),
	.slave_master_ifc_2(slave_ifc_2.master_port),
	.slave_master_ifc_3(slave_ifc_3.master_port),
	.slave_master_ifc_4(slave_ifc_4.master_port)

);

always @( posedge clk )
	begin
		
	
	end





endmodule