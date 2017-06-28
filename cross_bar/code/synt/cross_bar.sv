////////////////////////////////////////////////////////////////////////////////////////////////
////	Author:	Petruk A																	////
////	Data:	20/06/2017																	////
////																						////
////	Description: cross-bar						 										////
////																						////
////////////////////////////////////////////////////////////////////////////////////////////////

module cross_bar

(	input 				clk,
	input 				reset_n,
	// объявление интерфейсов
	m_s_ifc.slave_port     	master_slave_ifc_1,
	m_s_ifc.slave_port    	master_slave_ifc_2,
	m_s_ifc.master_port    	slave_master_ifc_1,
	m_s_ifc.master_port    	slave_master_ifc_2, 
	
	m_s_ifc.slave_port     	master_slave_ifc_3,
	m_s_ifc.slave_port    	master_slave_ifc_4,
	m_s_ifc.master_port    	slave_master_ifc_3,
	m_s_ifc.master_port    	slave_master_ifc_4 

);
	reg					master_1_req;	//однобитный сигнал, запрос на выполнение транзакции (master-> slave)
	reg 	[31:0]		master_1_addr;	//32-битный шина, содержит адрес запроса (master->slave)
	reg					master_1_cmd;	//однобитный сигнал – признак операции: 0 - read, 1 –write (master->slave)
	reg		[31:0]		master_1_wdata;	//- 32-битный шина, содержит записываемые данные. передаются в том же такте , что и адрес (master-> slave)
	reg  				master_1_ack;	//однобитный сигнал-подтверждение, что в данном такте slave принял запрос к исполнению (slave->master).
	reg 	[31:0]		master_1_rdata; //- 32-битная шина, содержит считываемые данные. передаются на следующем такте после подтверждения транзакции(_ack = 1)(slave-> master)
	reg					master_1_resp;
	
	
	
	
	reg 				master_2_req;
	reg 	[31:0]		master_2_addr;
	reg					master_2_cmd;
	reg		[31:0]		master_2_wdata;
	reg  				master_2_ack;
	reg 	[31:0]		master_2_rdata;
	reg					master_2_resp;
	
	reg					slave_1_req;
	reg 	[31:0]		slave_1_addr;
	reg					slave_1_cmd;
	reg		[31:0]		slave_1_wdata;
	reg  				slave_1_ack;
	reg 	[31:0]		slave_1_rdata;
	reg					slave_1_resp;
	
	reg					slave_2_req;
	reg 	[31:0]		slave_2_addr;
	reg					slave_2_cmd;
	reg		[31:0]		slave_2_wdata;
	reg  				slave_2_ack;
	reg 	[31:0]		slave_2_rdata;
	reg					slave_2_resp;
//-------------------------------------------------------------------------
	reg					master_3_req;	//однобитный сигнал, запрос на выполнение транзакции (master-> slave)
	reg 	[31:0]		master_3_addr;	//32-битный шина, содержит адрес запроса (master->slave)
	reg					master_3_cmd;	//однобитный сигнал – признак операции: 0 - read, 1 –write (master->slave)
	reg		[31:0]		master_3_wdata;	//- 32-битный шина, содержит записываемые данные. передаются в том же такте , что и адрес (master-> slave)
	reg  				master_3_ack;	//однобитный сигнал-подтверждение, что в данном такте slave принял запрос к исполнению (slave->master).
	reg 	[31:0]		master_3_rdata; 	//- 32-битная шина, содержит считываемые данные. передаются на следующем такте после подтверждения транзакции(_ack = 1)(slave-> master)
	reg					master_3_resp;
	
	
	reg 				master_4_req;
	reg 	[31:0]		master_4_addr;
	reg					master_4_cmd;
	reg		[31:0]		master_4_wdata;
	reg  				master_4_ack;
	reg 	[31:0]		master_4_rdata;
	reg					master_4_resp;
	
	reg					slave_3_req;
	reg 	[31:0]		slave_3_addr;
	reg					slave_3_cmd;
	reg		[31:0]		slave_3_wdata;
	reg  				slave_3_ack;
	reg 	[31:0]		slave_3_rdata;
	reg					slave_3_resp;
	
	reg					slave_4_req;
	reg 	[31:0]		slave_4_addr;
	reg					slave_4_cmd;
	reg		[31:0]		slave_4_wdata;
	reg  				slave_4_ack;
	reg 	[31:0]		slave_4_rdata;
	reg					slave_4_resp;	
	
	logic				slave_req_1;
	logic				slave_req_2;
	logic				slave_req_3;
	logic				slave_req_4;
	
	logic	[2:0]		number_master1;
	logic	[2:0]		number_master2;
	logic	[2:0]		number_master3;
	logic	[2:0]		number_master4;
	
	logic   [2:0]		number_master1_l;
	logic   [2:0]		number_master2_l;
	logic   [2:0]		number_master3_l;
	logic   [2:0]		number_master4_l;

	
	logic				slave_1_rr_ack_resp;
	logic				slave_2_rr_ack_resp;
	logic				slave_3_rr_ack_resp;
	logic				slave_4_rr_ack_resp;
	
	
//-------------------------------------------------------------------------
//-----------------назначение для первого мастера--------------------------	
	assign	master_1_req	= master_slave_ifc_1.master_slave_req;
	assign	master_1_addr 	= master_slave_ifc_1.master_slave_addr;
	assign	master_1_cmd 	= master_slave_ifc_1.master_slave_cmd;
	assign	master_1_wdata 	= master_slave_ifc_1.master_slave_wdata;
	assign	master_slave_ifc_1.slave_master_ack 	= master_1_ack;
	assign	master_slave_ifc_1.slave_master_rdata 	= master_1_rdata;
	assign	master_slave_ifc_1.slave_master_resp 	= master_1_resp;
//-------------------------------------------------------------------------
//-----------------назначение для второго мастера--------------------------	
	assign	master_2_req 	= master_slave_ifc_2.master_slave_req;
	assign	master_2_addr 	= master_slave_ifc_2.master_slave_addr;
	assign	master_2_cmd 	= master_slave_ifc_2.master_slave_cmd;
	assign	master_2_wdata 	= master_slave_ifc_2.master_slave_wdata;
	assign	master_slave_ifc_2.slave_master_ack 	= master_2_ack;
	assign	master_slave_ifc_2.slave_master_rdata 	= master_2_rdata;
	assign	master_slave_ifc_2.slave_master_resp 	= master_2_resp;
//-------------------------------------------------------------------------
//-----------------назначение для третьего мастера--------------------------	
	assign	master_3_req 	= master_slave_ifc_3.master_slave_req;
	assign	master_3_addr 	= master_slave_ifc_3.master_slave_addr;
	assign	master_3_cmd 	= master_slave_ifc_3.master_slave_cmd;
	assign	master_3_wdata 	= master_slave_ifc_3.master_slave_wdata;
	assign	master_slave_ifc_3.slave_master_ack 	= master_3_ack;
	assign	master_slave_ifc_3.slave_master_rdata 	= master_3_rdata;
	assign	master_slave_ifc_3.slave_master_resp 	= master_3_resp;
//-------------------------------------------------------------------------
//-----------------назначение для четвертого мастера--------------------------	
	assign	master_4_req 	= master_slave_ifc_4.master_slave_req;
	assign	master_4_addr 	= master_slave_ifc_4.master_slave_addr;
	assign	master_4_cmd 	= master_slave_ifc_4.master_slave_cmd;
	assign	master_4_wdata 	= master_slave_ifc_4.master_slave_wdata;
	assign	master_slave_ifc_4.slave_master_ack 	= master_4_ack;
	assign	master_slave_ifc_4.slave_master_rdata 	= master_4_rdata;
	assign	master_slave_ifc_4.slave_master_resp 	= master_4_resp;
//-------------------------------------------------------------------------
//-----------------назначение для первого слэйва--------------------------	
	assign	slave_1_ack 	= slave_master_ifc_1.slave_master_ack;
	assign	slave_1_rdata 	= slave_master_ifc_1.slave_master_rdata;
	assign	slave_1_resp 	= slave_master_ifc_1.slave_master_resp;
	assign	slave_master_ifc_1.master_slave_req 	= slave_1_req;
	assign	slave_master_ifc_1.master_slave_addr 	= slave_1_addr;
	assign	slave_master_ifc_1.master_slave_cmd 	= slave_1_cmd;
	assign	slave_master_ifc_1.master_slave_wdata	= slave_1_wdata;
//-------------------------------------------------------------------------
//-----------------назначение для второго слэйва--------------------------	
	assign	slave_2_ack 	= slave_master_ifc_2.slave_master_ack;
	assign	slave_2_rdata 	= slave_master_ifc_2.slave_master_rdata;
	assign	slave_2_resp 	= slave_master_ifc_2.slave_master_resp;
	assign	slave_master_ifc_2.master_slave_req 	= slave_2_req;
	assign	slave_master_ifc_2.master_slave_addr 	= slave_2_addr;
	assign	slave_master_ifc_2.master_slave_cmd 	= slave_2_cmd;
	assign	slave_master_ifc_2.master_slave_wdata	= slave_2_wdata;	
//-------------------------------------------------------------------------
//-----------------назначение для третьего слэйва--------------------------	
	assign	slave_3_ack 	= slave_master_ifc_3.slave_master_ack;
	assign	slave_3_rdata 	= slave_master_ifc_3.slave_master_rdata;
	assign	slave_3_resp 	= slave_master_ifc_3.slave_master_resp;
	assign	slave_master_ifc_3.master_slave_req 	= slave_3_req;
	assign	slave_master_ifc_3.master_slave_addr 	= slave_3_addr;
	assign	slave_master_ifc_3.master_slave_cmd 	= slave_3_cmd;
	assign	slave_master_ifc_3.master_slave_wdata	= slave_3_wdata;
//-------------------------------------------------------------------------
//-----------------назначение для четвертого слэйва--------------------------	
	assign	slave_4_ack 	= slave_master_ifc_4.slave_master_ack;
	assign	slave_4_rdata 	= slave_master_ifc_4.slave_master_rdata;
	assign	slave_4_resp 	= slave_master_ifc_4.slave_master_resp;
	assign	slave_master_ifc_4.master_slave_req 	= slave_4_req;
	assign	slave_master_ifc_4.master_slave_addr 	= slave_4_addr;
	assign	slave_master_ifc_4.master_slave_cmd 	= slave_4_cmd;
	assign	slave_master_ifc_4.master_slave_wdata	= slave_4_wdata;
	

assign	slave_1_rr_ack_resp = ( slave_1_ack && slave_1_cmd )? 1'b1: ( slave_1_resp && !slave_1_cmd )? 1'b1: 1'b0;	
//-----------------------------------------------------------------------------
//-----------------round_robin для 1-го slave-------------------------------------	
	
	round_robin_4
	#(
		0
	)
	round_robin_4_i1
	(	
		.clk(clk),
		.reset_n(reset_n),
		.master_1_req(master_1_req),
		.master_2_req(master_2_req),
		.master_3_req(master_3_req),
		.master_4_req(master_4_req),
		.master_1_addr(master_1_addr[31:30]),
		.master_2_addr(master_2_addr[31:30]),
		.master_3_addr(master_3_addr[31:30]),
		.master_4_addr(master_4_addr[31:30]),
		.slave_ack(slave_1_rr_ack_resp),
		
		.number_master_en(number_master1),
		.slave_req(slave_req_1)
	);

//-----------------------------------------------------------------------------
//-----------------round_robin для 2-го slave-------------------------------------	
	round_robin_4
	#(
		1
	)
	round_robin_4_i2
	(	
		.clk(clk),
		.reset_n(reset_n),
		.master_1_req(master_1_req),
		.master_2_req(master_2_req),
		.master_3_req(master_3_req),
		.master_4_req(master_4_req),
		.master_1_addr(master_1_addr[31:30]),
		.master_2_addr(master_2_addr[31:30]),
		.master_3_addr(master_3_addr[31:30]),
		.master_4_addr(master_4_addr[31:30]),
		.slave_ack(slave_2_ack),
		
		.number_master_en(number_master2),
		.slave_req(slave_req_2)
	);

//-----------------------------------------------------------------------------
//-----------------round_robin для 3-го slave-------------------------------------		
	round_robin_4
	#(
		2
	)
	round_robin_4_i3
	(	
		.clk(clk),
		.reset_n(reset_n),
		.master_1_req(master_1_req),
		.master_2_req(master_2_req),
		.master_3_req(master_3_req),
		.master_4_req(master_4_req),
		.master_1_addr(master_1_addr[31:30]),
		.master_2_addr(master_2_addr[31:30]),
		.master_3_addr(master_3_addr[31:30]),
		.master_4_addr(master_4_addr[31:30]),
		.slave_ack(slave_3_ack),
		
		.number_master_en(number_master3),
		.slave_req(slave_req_3)
	);

//-----------------------------------------------------------------------------
//-----------------round_robin для 4-го slave-------------------------------------		
		round_robin_4
	#(
		3
	)
	round_robin_4_i4
	(	
		.clk(clk),
		.reset_n(reset_n),
		.master_1_req(master_1_req),
		.master_2_req(master_2_req),
		.master_3_req(master_3_req),
		.master_4_req(master_4_req),
		.master_1_addr(master_1_addr[31:30]),
		.master_2_addr(master_2_addr[31:30]),
		.master_3_addr(master_3_addr[31:30]),
		.master_4_addr(master_4_addr[31:30]),
		.slave_ack(slave_4_ack),
		
		.number_master_en(number_master4),
		.slave_req(slave_req_4)
	);
	
//Передача сигнала первому слэйву. Зависит от какого мастера-------------------	
	
assign slave_1_req 		= ((number_master1 == 3'd1) && slave_req_1 )? master_1_req		:((number_master1 == 3'd2) && slave_req_1)?master_2_req	:
								((number_master1 == 3'd3) && slave_req_1)?master_3_req	:((number_master1 == 3'd4) && slave_req_1)?master_4_req	:1'b0;
								
assign slave_1_addr 	= ((number_master1 == 3'd1) && slave_req_1 )? master_1_addr		:((number_master1 == 3'd2) && slave_req_1)?master_2_addr :
								((number_master1 == 3'd3) && slave_req_1)?master_3_addr	:((number_master1 == 3'd4) && slave_req_1)?master_4_addr :32'd0;
								
assign slave_1_cmd 		= ((number_master1 == 3'd1) && slave_req_1 )? master_1_cmd		:((number_master1 == 3'd2) && slave_req_1)?master_2_cmd	:
								((number_master1 == 3'd3) && slave_req_1)?master_3_cmd	:((number_master1 == 3'd4) && slave_req_1)?master_4_cmd	:1'b0;
								
assign slave_1_wdata 	= ((number_master1 == 3'd1) && slave_req_1 )? master_1_wdata	:((number_master1 == 3'd2) && slave_req_1)?master_2_wdata:
								((number_master1 == 3'd3) && slave_req_1)?master_3_wdata:((number_master1 == 3'd4) && slave_req_1)?master_4_wdata: 32'd0;

//Передача сигнала второму слэйву. Зависит от какого мастера-------------------							
assign slave_2_req 		= ((number_master2 == 3'd1) && slave_req_2 )? master_1_req		:((number_master2 == 3'd2) && slave_req_2)?master_2_req	:
								((number_master2 == 3'd3) && slave_req_2)?master_3_req	:((number_master2 == 3'd4) && slave_req_2)?master_4_req	:1'b0;
								
assign slave_2_addr 	= ((number_master2 == 3'd1) && slave_req_2 )? master_1_addr		:((number_master2 == 3'd2) && slave_req_2)?master_2_addr :
								((number_master2 == 3'd3) && slave_req_2)?master_3_addr	:((number_master2 == 3'd4) && slave_req_2)?master_4_addr :32'd0;
								
assign slave_2_cmd 		= ((number_master2 == 3'd1) && slave_req_2 )? master_1_cmd		:((number_master2 == 3'd2) && slave_req_2)?master_2_cmd	:
								((number_master2 == 3'd3) && slave_req_2)?master_3_cmd	:((number_master2 == 3'd4) && slave_req_2)?master_4_cmd	:1'b0;
								
assign slave_2_wdata 	= ((number_master2 == 3'd1) && slave_req_2 )? master_1_wdata	:((number_master2 == 3'd2) && slave_req_2)?master_2_wdata :
								((number_master2 == 3'd3) && slave_req_2)?master_3_wdata:((number_master2 == 3'd4) && slave_req_2)?master_4_wdata :32'd0;

//Передача сигнала третьему слэйву. Зависит от какого мастера-------------------								
assign slave_3_req 		= ((number_master3 == 3'd1) && slave_req_3 )? master_1_req		:((number_master3 == 3'd2) && slave_req_3)?master_2_req	:
								((number_master3 == 3'd3) && slave_req_3)?master_3_req	:((number_master3 == 3'd4) && slave_req_3)?master_4_req	:1'b0;
								
assign slave_3_addr 	= ((number_master3 == 3'd1) && slave_req_3 )? master_1_addr		:((number_master3 == 3'd2) && slave_req_3)?master_2_addr:
								((number_master3 == 3'd3) && slave_req_3)?master_3_addr	:((number_master3 == 3'd4) && slave_req_3)?master_4_addr:32'd0;
								
assign slave_3_cmd 		= ((number_master3 == 3'd1) && slave_req_3 )? master_1_cmd		:((number_master3 == 3'd2) && slave_req_3)?master_2_cmd	 :
								((number_master3 == 3'd3) && slave_req_3)?master_3_cmd	:((number_master3 == 3'd4) && slave_req_3)?master_4_cmd	 :1'b0;

assign slave_3_wdata 	= ((number_master3 == 3'd1) && slave_req_3 )? master_1_wdata	:((number_master3 == 3'd2) && slave_req_3)?master_2_wdata:
								((number_master3 == 3'd3) && slave_req_3)?master_3_wdata:((number_master3 == 3'd4) && slave_req_3)?master_4_wdata:	32'd0;

//Передача сигнала четвертому слэйву. Зависит от какого мастера-------------------
assign slave_4_req 		= ((number_master4 == 3'd1) && slave_req_4 )? master_1_req		:((number_master4 == 3'd2) && slave_req_4)?master_2_req	:
								((number_master4 == 3'd3) && slave_req_4)?master_3_req	:((number_master4 == 3'd4) && slave_req_4)?master_4_req	:1'b0;
								
assign slave_4_addr 	= ((number_master4 == 3'd1) && slave_req_4 )? master_1_addr		:((number_master4 == 3'd2) && slave_req_4)?master_2_addr:
								((number_master4 == 3'd3) && slave_req_4)?master_3_addr	:((number_master4 == 3'd4) && slave_req_4)?master_4_addr:32'd0;
								
assign slave_4_cmd 		= ((number_master4 == 3'd1) && slave_req_4 )? master_1_cmd		:((number_master4 == 3'd2) && slave_req_4)?master_2_cmd	:
								((number_master4 == 3'd3) && slave_req_4)?master_3_cmd	:((number_master4 == 3'd4) && slave_req_4)?master_4_cmd	:1'b0;
								
assign slave_4_wdata 	= ((number_master4 == 3'd1) && slave_req_4 )? master_1_wdata	:((number_master4 == 3'd2) && slave_req_4)?master_2_wdata:
								((number_master4 == 3'd3) && slave_req_4)?master_3_wdata:((number_master4 == 3'd4) && slave_req_4)?master_4_wdata:32'd0;

//задержка номера мастера  и ответа от слэйва на такт, для передачи прочитанных данных
always @( posedge clk or negedge reset_n )
	begin
		if ( !reset_n )
			begin
				number_master1_l <= 3'd0;
				number_master2_l <= 3'd0;
				number_master3_l <= 3'd0;
				number_master4_l <= 3'd0;

			end
		else
			begin
				number_master1_l <=	number_master1;
				number_master2_l <=	number_master2;
				number_master3_l <=	number_master3;
				number_master4_l <=	number_master4;

			end
	end
								
//Передача сигнала первому мастеру. В зависимости от того, к какому слэйву было обращение-------------------
assign master_1_rdata 	= ((number_master1_l == 3'd1) && slave_1_resp )? slave_1_rdata	:((number_master2_l == 3'd1) && slave_2_resp)?slave_2_rdata:
							((number_master3_l == 3'd1) && slave_3_resp )? slave_3_rdata	:((number_master4_l == 3'd1) && slave_4_resp)?slave_4_rdata:32'd0;

assign master_1_resp 	= ((number_master1_l == 3'd1) && slave_1_resp )? slave_1_resp		:((number_master2_l == 3'd1) && slave_2_resp)?slave_2_resp:
							((number_master3_l == 3'd1) && slave_3_resp )? slave_3_resp	:((number_master4_l == 3'd1) && slave_4_resp)?slave_4_resp:1'b0;

//Передача сигнала второму мастеру. В зависимости от того, к какому слэйву было обращение-------------------							
assign master_2_rdata 	= ((number_master1_l == 3'd2) && slave_1_resp )? slave_1_rdata	:((number_master2_l == 3'd2) && slave_2_resp)?slave_2_rdata:
							((number_master3_l == 3'd2) && slave_3_resp )? slave_3_rdata	:((number_master4_l == 3'd2) && slave_4_resp)?slave_4_rdata:32'd0;
	
assign master_2_resp 	= ((number_master1_l == 3'd2) && slave_1_resp )? slave_1_resp		:((number_master2_l == 3'd2) && slave_2_resp)?slave_2_resp:
							((number_master3_l == 3'd2) && slave_3_resp )? slave_3_resp	:((number_master4 == 3'd2) && slave_4_resp)?slave_4_resp:1'b0;
														
//Передача сигнала первому мастеру. В зависимости от того, к какому слэйву было обращение-------------------
assign master_3_rdata 	= ((number_master1_l == 3'd3) && slave_1_resp )? slave_1_rdata	:((number_master2_l == 3'd3) && slave_2_resp)?slave_2_rdata:
							((number_master3_l == 3'd3) && slave_3_resp )? slave_3_rdata	:((number_master4_l == 3'd3) && slave_4_resp)?slave_4_rdata:32'd0;

assign master_3_resp 	= ((number_master1_l == 3'd3) && slave_1_resp )? slave_1_resp		:((number_master2_l == 3'd3) && slave_2_resp)?slave_2_resp:
							((number_master3_l == 3'd3) && slave_3_resp )? slave_3_resp	:((number_master4_l == 3'd3) && slave_4_resp)?slave_4_resp:1'b0;

//Передача сигнала третьему мастеру. В зависимости от того, к какому слэйву было обращение-------------------							
assign master_4_rdata 	= ((number_master1_l == 3'd4) && slave_1_resp )? slave_1_rdata	:((number_master2_l == 3'd4) && slave_2_resp)?slave_2_rdata:
							((number_master3_l == 3'd4) && slave_3_resp )? slave_3_rdata	:((number_master4_l == 3'd4) && slave_4_resp)?slave_4_rdata:32'd0;
						
assign master_4_resp 	= ((number_master1_l == 3'd4) && slave_1_resp )? slave_1_resp		:((number_master2_l == 3'd4) && slave_2_resp)?slave_2_resp:
							((number_master3_l == 3'd4) && slave_3_resp )? slave_3_resp	:((number_master4_l == 3'd4) && slave_4_resp)?slave_4_resp:1'b0;
		
		
assign master_1_ack 	= ((number_master1 == 3'd1) && slave_1_ack )? slave_1_ack	:((number_master2 == 3'd1) && slave_2_ack)?slave_2_ack:
							((number_master3 == 3'd1) && slave_3_ack )? slave_3_ack	:((number_master4 == 3'd1) && slave_4_ack)?slave_4_ack: 1'b0;

assign master_2_ack 	= ((number_master1 == 3'd2) && slave_1_ack )? slave_1_ack	:((number_master2 == 3'd2) && slave_2_ack)?slave_2_ack:
							((number_master3 == 3'd2) && slave_3_ack )? slave_3_ack	:((number_master4 == 3'd2) && slave_4_ack)?slave_4_ack: 1'b0;

assign master_3_ack 	= ((number_master1 == 3'd3) && slave_1_ack )? slave_1_ack	:((number_master2 == 3'd3) && slave_2_ack)?slave_2_ack:
							((number_master3 == 3'd3) && slave_3_ack )? slave_3_ack	:((number_master4 == 3'd3) && slave_4_ack)?slave_4_ack: 1'b0;

assign master_4_ack 	= ((number_master1 == 3'd4) && slave_1_ack )? slave_1_ack	:((number_master2 == 3'd4) && slave_2_ack)?slave_2_ack:
							((number_master3 == 3'd4) && slave_3_ack )? slave_3_ack	:((number_master4 == 3'd4) && slave_4_ack)?slave_4_ack: 1'b0;							

endmodule

