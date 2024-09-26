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


/*
* Module to abstract away the LED logic, including the XOR and AND gates, as well as the frequency counter
*/
module ledDecoder (
    input logic clk,
    input logic [3:0] switches,
    output logic [2:0] led
);
      
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
