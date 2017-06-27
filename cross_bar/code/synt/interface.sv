
interface m_s_ifc ;
	
	logic 				master_slave_req;	//���������� ������, ������ �� ���������� ���������� (master-> slave)
	logic 	[31:0]		master_slave_addr;	//32-������ ����, �������� ����� ������� (master->slave)
	logic				master_slave_cmd;	//���������� ������ � ������� ��������: 0 - read, 1 �write (master->slave)
	logic	[31:0]		master_slave_wdata;	//- 32-������ ����, �������� ������������ ������. ���������� � ��� �� ����� , ��� � ����� (master-> slave)
	logic  				slave_master_ack;	//���������� ������-�������������, ��� � ������ ����� slave ������ ������ � ���������� (slave->master).
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