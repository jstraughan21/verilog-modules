//--------------------------------------------------------------------
//
//  Company:    University of Wyoming
//  Engineer:   Jake Straughan
//  Module:     t_mux4machine.v
//  Version:    1.0.0
//  Date        04/29/2021
//
//--------------------------------------------------------------------

`timescale 1ns/100ps

module t_mux4machine;
	wire [3:0] t_muxd;
	wire [3:0] t_adrive;
	reg [3:0] t_A, t_B, t_C, t_D, t_blank;
	reg t_clk, t_reset;
	
	Mux4Machine		uut(t_muxd, t_adrive, t_A, t_B, t_C, t_D, t_clk, t_reset, t_blank);
	
	initial #1000 $finish;
	
	initial begin
		t_clk = 0;
		forever #5 t_clk = ~t_clk;
		end
		
	initial begin
		$dumpfile("wavedata.vcd");
		$dumpvars(0, t_Mux4Machine);
		end
		
	initial begin
			 t_A = 4'b0000;
			 t_B = 4'b0001;
			 t_C = 4'b0010;
			 t_D = 4'b0011;
			 t_blank = 0000;
			 t_reset = 0;
		#10  t_reset = 1;
		#10  t_reset = 0;
		#300 t_blank = 4'b1100;
		end
endmodule