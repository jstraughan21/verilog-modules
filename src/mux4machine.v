//--------------------------------------------------------------------
//
//  Company:    University of Wyoming
//  Engineer:   Jake Straughan
//  Module:     mux4machine.v
//  Version:    1.0.0
//  Date        04/29/2021
//
//--------------------------------------------------------------------

module mux4machine(muxd, adrive, A, B, C, D, clk, reset, blank);
	output reg [3:0] muxd;
	output reg [3:0] adrive;
	input [3:0] A, B, C, D, blank;
	input clk, reset;
	
	parameter NUMSVAR=20;
	
	reg [NUMSVAR:1] nS, S;
	
	always @(posedge clk) begin
		if (reset) S <= 0;
		else S <= nS;
		end
		
	always @(S) begin
		nS = S + 1;
		end
		
	always @(S[NUMSVAR:NUMSVAR-1], A, B, C, D, blank) begin
		case(S[NUMSVAR:NUMSVAR-1])
			2'b11: begin muxd=A; adrive=(!blank[3] ? 4'b0111: 4'b1111); end
			2'b10: begin muxd=B; adrive=(!blank[2] ? 4'b1011: 4'b1111); end
			2'b01: begin muxd=C; adrive=(!blank[1] ? 4'b1101: 4'b1111); end
			2'b00: begin muxd=D; adrive=(!blank[0] ? 4'b1110: 4'b1111); end
			default: begin muxd=A; adrive=4'b1111; end
		endcase
		end
endmodule