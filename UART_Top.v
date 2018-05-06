module UART_Top(
				Clk,
				Rst_n,
				Rx,
				Tx
					);
	input Clk;
	input Rst_n;
	input Rx;
	output Tx;
	
	wire clk_out;
	wire [7:0] data_out;
	wire re_wrsig;
	
//------------时钟模块例化-------------------------------//
clkdiv clkdiv0(
				.clk50(Clk), 
				.rst_n(Rst_n), 
				.clkout(clk_out)
			);
			
//------------接收模块例化-------------------------------//
uartrx uartrx0(
				.clk(clk_out), 
				.rst_n(Rst_n), 
				.rx(Rx), 
				.dataout(data_out), 
				.rdsig(re_wrsig), 
				.dataerror(), 
				.frameerror()
			);

//------------接收模块例化-------------------------------//
uarttx uarttx0(
				.clk(clk_out),
				.rst_n(Rst_n), 
				.datain(data_out), 
				.wrsig(re_wrsig), 
				.idle(), 
				.tx(Tx)
			);

endmodule