module testbench ();
  logic clk;

  always begin
    clk = 1;
    #5;
    clk = 0;
    #5;
  end

  logic [6:0] segOutput;
  logic [3:0] switches;
  logic [2:0] leds;
  sevenSegmentDecoder display (
      .inputHex(switches),
      .segments(segOutput)
  );
  ledDecoder ledOut (
      .clk(clk),
      .switches(switches),
      .led(leds)
  );

  int testCounter;
  int errors;

  logic [6:0] segExpected;
  logic [1:0] ledsExpected;

  logic [12:0] testVectors [1000:0]; // format will be switches [3:0], segExpected [6:0], ledsExpected[1:0]


  initial begin
    $display("reading test vectors");
    $readmemb("testbench.tv", testVectors);
    $display(testVectors);
    testCounter = 0;
    errors = 0;
    #2;
  end

  always @(posedge clk) begin
    #1;
    {switches[3:0], segExpected[6:0], ledsExpected[1:0]} = testVectors[testCounter];
  end

  always @(negedge clk) begin
    if (segOutput !== segExpected || leds[1:0] !== ledsExpected) begin
      $display("Error (test %d): inputs = %b ", errors, switches);
      $display("outputs = %b segment, %b leds, Expected: (%b segment, %b ledsExpected)", segOutput,
               leds, segExpected, ledsExpected);
      errors = errors + 1;
    end
    testCounter = testCounter + 1;
    if (testVectors[testCounter] === 13'bx) begin
      $display("%d tests completed with %d errors", testCounter, errors);
      $finish;
    end
  end
endmodule
