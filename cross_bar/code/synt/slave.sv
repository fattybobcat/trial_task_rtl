////////////////////////////////////////////////////////////////////////////////////////////////
////	Author:	Petruk A																	////
////	Data:	22/06/2017																	////
////																						////
////	Description: slave for verification		 											////
////																						////
////////////////////////////////////////////////////////////////////////////////////////////////

module slave 
#(
	parameter	WIEGHT_MEMORY = 65536,  // объем памяти
	parameter	NUMBER_SLAVE = 2	// количество пар SLAVE = нужно для определиния значащих бит адрессов
)
(	
	input					clk,
	input 					reset_n,
	
	m_s_ifc.slave_port     	slave_ifc 
);



	logic 				slave_req;		//однобитный сигнал, запрос на выполнение транзакции (master-> slave)
	logic 	[31:0]		slave_addr;		//32-битный шина, содержит адрес запроса (master->slave)
	logic				slave_cmd;		//однобитный сигнал Ц признак операции: 0 - read, 1 Цwrite (master->slave)
	logic	[31:0]		slave_wdata;	//- 32-битный шина, содержит записываемые данные. передаютс¤ в том же такте , что и адрес (master-> slave)
	logic  				slave_ack;		//однобитный сигнал-подтверждение, что в данном такте slave прин¤л запрос к исполнению (slave->master).
	logic 	[31:0]		slave_rdata;
	logic				slave_resp;
	
	logic	[31:0]		slave_mem	[WIEGHT_MEMORY-1:0];
	

assign		slave_ifc.slave_master_ack = slave_ack;
assign		slave_ifc.slave_master_rdata = slave_rdata;
assign		slave_ifc.slave_master_resp = slave_resp;
assign		slave_req = slave_ifc.master_slave_req;
assign		slave_cmd = slave_ifc.master_slave_cmd;
assign		slave_wdata = slave_ifc.master_slave_wdata;
assign		slave_addr = slave_ifc.master_slave_addr;


logic 				req;	//однобитный сигнал, запрос на выполнение транзакции (master-> slave)
logic 	[31:0]		addr;	//32-битный шина, содержит адрес запроса (master->slave)
logic				cmd;	//однобитный сигнал Ц признак операции: 0 - read, 1 Цwrite (master->slave)
logic	[31:0]		wdata;
logic	[31:0]		rdata;
logic 				resp;
initial
	begin
		for (int i = 0;  i <= WIEGHT_MEMORY-1; i++)
			begin
				slave_mem[i] = i*'h1;
			end
	
	end

	
	
always @( posedge clk or negedge reset_n)
	begin
		if ( !reset_n)
			begin
				addr <= 0;
				wdata <= 0;
				cmd <= 0;
				slave_ack <= 1'b0;
				req <= 0;
				resp <= 0;
			end
		else 
			begin
				if ( slave_req && !slave_ack)
					begin
						addr <= slave_addr[31-NUMBER_SLAVE/2:0];
						cmd	 <= slave_cmd;
						wdata <= slave_wdata;
						req <= slave_req;
						slave_ack <= 1'b1;
					end
				else
					begin
						req <= slave_req;
						cmd	 <= slave_cmd;
						slave_ack <= 1'b0;
					end
			end
	end


always @( posedge clk or negedge reset_n )
	begin
		if ( !reset_n )
			begin
				rdata <= 0;
				slave_rdata <= 0;	
			end
		else 
			begin
				if ( slave_cmd && slave_req )
					begin
						slave_mem[slave_addr[31-NUMBER_SLAVE/2:0]]<= wdata;
						slave_resp <= 1'b0;
					end
				else if ( slave_ack  )
					begin
						slave_rdata <= slave_mem[addr];
						slave_resp <= 1'b1;
						resp <= 1'b1;
				//		$display(" \t @%0dns SLAVE    read_data[%d] = %d ", $time, addr, slave_mem[addr] );		
					end
				else
					begin
						resp <= 1'b0;
						slave_resp <= 1'b0;
					end
			end
	end
endmodule	
