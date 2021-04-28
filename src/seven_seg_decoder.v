//--------------------------------------------------------------------
//
//  Company:    University of Wyoming
//  Engineer:   Jake Straughan
//  Module:     seven_seg_decoder.v
//  Version:    1.0.0
//  Date        04/27/2021
//
//--------------------------------------------------------------------

module seven_seg_decoder(seg, digit);
    output [6:0] seg;
    input  [3:0] digit;

	reg [6:0] seg;

    // Determine the segments on/off for the given digit (active-low)
    always @(digit) begin
        case (digit)
            4'h0: seg = 7'b000_0001;
			4'h1: seg = 7'b100_1111;
			4'h2: seg = 7'b001_0010;
			4'h3: seg = 7'b000_0110;
			4'h4: seg = 7'b100_1100;
			4'h5: seg = 7'b010_0100;
			4'h6: seg = 7'b010_0000;
			4'h7: seg = 7'b000_1111;
			4'h8: seg = 7'b000_0000;
			4'h9: seg = 7'b000_0100;
			4'hA: seg = 7'b000_1000;
			4'hB: seg = 7'b110_0000;
			4'hC: seg = 7'b011_0001;
			4'hD: seg = 7'b100_0010;
			4'hE: seg = 7'b011_0000;
			4'hF: seg = 7'b011_1000;
            default: seg = 7'b111_1111;
        endcase
    end
endmodule