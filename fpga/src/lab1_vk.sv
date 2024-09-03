/*
* File Author: Vikram Krishna (vkrishna@hmc.edu)
* File Created: August 31, 2024
* Summary: SystemVerilog for the first E155 lab, controlling 3 LEDs and a 7-segment display with four switch inputs
*/
module lab1_vk (
    input  logic [3:0] s,
    output logic [2:0] led,
    output logic [6:0] seg
);

  // Internal high-speed oscillator
  logic clk;

  HSOSC #(
      .CLKHF_DIV(2'b00)
  )  // ensures 48MHz clock
      hf_osc (
      .CLKHFPU(1'b1),
      .CLKHFEN(1'b1),
      .CLKHF  (clk)
  );

  sevenSegmentDecoder segDecoder (
      .inputHex(s),
      .segments(seg)
  );
  ledDecoder ledDecoder (
      .clk(clk),
      .switches(s),
      .led(led)
  );
endmodule

module sevenSegmentDecoder (
    input  logic [3:0] inputHex,
    output logic [6:0] segments
);
  /*
  segments:
       0
     5 6 1
     4   2
       3
  */ 

  always_comb begin
    case (inputHex)
      4'h0: segments = 7'b1000000;
      4'h1: segments = 7'b1111001;
      4'h2: segments = 7'b0100100;
      4'h3: segments = 7'b0110000;
      4'h4: segments = 7'b0011001;
      4'h5: segments = 7'b0010010;
      4'h6: segments = 7'b0000010;
      4'h7: segments = 7'b1111000;
      4'h8: segments = 7'b0000000;
      4'h9: segments = 7'b0011000;
      4'hA: segments = 7'b0001000;
      4'hB: segments = 7'b0000011;
      4'hC: segments = 7'b1000110;
      4'hD: segments = 7'b0100001;
      4'hE: segments = 7'b0000110;
      4'hF: segments = 7'b0001110;
      default: segments = 7'b1111111;
    endcase
  end
endmodule

module ledDecoder (
    input logic clk,
    input logic [3:0] switches,
    output logic [2:0] led
);
  logic [24:0] counter;
  logic ledStatus;

  assign led[0] = switches[0] ^ switches[1];
  assign led[1] = switches[2] & switches[3];
  assign led[2] = ledStatus;

  always_ff @(posedge clk) begin
    if (counter > 'd10000000) begin
      ledStatus <= !ledStatus;
      counter   <= 0;
    end else counter <= counter + 1;
  end

endmodule
