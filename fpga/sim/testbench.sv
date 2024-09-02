module testbench ();
  logic clk

  always begin
    clk = 0;
    # 1;
    clk = 1;
    # 1;
  end

  
  typedef enum logic[6:0] {
    ZERO = 7'b1000000,
    ONE = 7'b1111001,
    TWO = 7'b0100100,
    THREE = 7'b0110000,
    FOUR = 7'b0011001,
    FIVE = 7'b0010010,
    SIX = 7'b0000010,
    SEVEN = 7'b1111000,
    EIGHT = 7'b0000000,
    NINE = 7'b0011000,
    A = 7'b0001000,
    B = 7'b0000011,
    C = 7'b1000110,
    D = 7'b0100001,
    E = 7'b0000110,
    F = 7'b0001110
    } inputHex;

  inputHex seg;
  logic [3:0] switches;
  logic [2:0] leds;
  sevenSegmentDecoder display(.inputHex(switches), .segments(seg));


  initial begin
    switches = 4'h0;
    switches = 4'h1;
    switches = 4'h2;
    switches = 4'h3;
    switches = 4'h4;
    switches = 4'h5;
    switches = 4'h6;
    switches = 4'h7;
    switches = 4'h8;
    switches = 4'h9;
    switches = 4'hA;
    switches = 4'hB;
    switches = 4'hC;
    switches = 4'hD;
    switches = 4'hE;
    switches = 4'hF;
  end
endmodule