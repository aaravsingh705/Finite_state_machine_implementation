module tb_seq_101010;

  reg x, clk, reset;
  wire z;

  // Instantiate the detector module
  seq_101010_detector uut (
    .x(x),
    .clk(clk),
    .reset(reset),
    .z(z)
  );

  reg [15:0] pattern = 16'b1010101010100000; // Example input sequence
  integer i;

  // Generate clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Apply test stimulus
  initial begin
    reset = 1;
    #10 reset = 0;

    for (i = 0; i < 16; i = i + 1) begin
      x = pattern[15 - i];
      #10; // Wait for one clock cycle
    end

    $display("Simulation completed.");
    $finish;
  end

  // Monitor output
  initial begin
    $monitor("Time = %2d, x = %b, z = %b", $time, x, z);
  end

endmodule
