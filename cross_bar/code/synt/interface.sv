
interface m_s_ifc ;
	
	logic 				master_slave_req;	//однобитный сигнал, запрос на выполнение транзакции (master-> slave)
	logic 	[31:0]		master_slave_addr;	//32-битный шина, содержит адрес запроса (master->slave)
	logic				master_slave_cmd;	//однобитный сигнал Ц признак операции: 0 - read, 1 Цwrite (master->slave)
	logic	[31:0]		master_slave_wdata;	//- 32-битный шина, содержит записываемые данные. передаютс€ в том же такте , что и адрес (master-> slave)
	logic  				slave_master_ack;	//однобитный сигнал-подтверждение, что в данном такте slave прин€л запрос к исполнению (slave->master).
	logic 	[31:0]		slave_master_rdata;
    logic               slave_master_resp;
	
	modport master_port
	(
		output  master_slave_req,    
		output  master_slave_addr, 
		output  master_slave_cmd,
		output  master_slave_wdata,
		input  	slave_master_ack,
		input  	slave_master_rdata,
		input  	slave_master_resp
	);   
	
	modport slave_port
	(
		input  		master_slave_req,    
		input  		master_slave_addr, 
		input 		master_slave_cmd,
		input  		master_slave_wdata,
		output  	slave_master_ack,
		output  	slave_master_rdata,
		output		slave_master_resp
	);   
endinterface  