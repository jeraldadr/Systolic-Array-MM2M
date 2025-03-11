module tb_systolic_array;

  // Input signals
  reg [7:0] inp_west0; 
  reg [7:0] inp_west4; 
  reg [7:0] inp_west8; 
  reg [7:0] inp_west12;
  reg [7:0] inp_north0; 
  reg [7:0] inp_north1; 
  reg [7:0] inp_north2; 
  reg [7:0] inp_north3;
  reg clk, rst;
    
  // Output signals
  wire [15:0] out00; 
  wire [15:0] out01; 
  wire [15:0] out02; 
  wire [15:0] out03; 
  wire [15:0] out04; 
  wire [15:0] out05; 
  wire [15:0] out06; 
  wire [15:0] out07;
  wire [15:0] out08; 
  wire [15:0] out09; 
  wire [15:0] out10; 
  wire [15:0] out11; 
  wire [15:0] out12; 
  wire [15:0] out13; 
  wire [15:0] out14; 
  wire [15:0] out15;
  wire done;
    
  // Instantiate the Systolic Array
  systolic_array uut (
    .inp_west0(inp_west0),
    .inp_west4(inp_west4),
    .inp_west8(inp_west8),
    .inp_west12(inp_west12),
    .inp_north0(inp_north0),
    .inp_north1(inp_north1),
    .inp_north2(inp_north2),
    .inp_north3(inp_north3),
    .out00(out00),
    .out01(out01),
    .out02(out02),
    .out03(out03),
    .out04(out04),
    .out05(out05),
    .out06(out06),
    .out07(out07),
    .out08(out08),
    .out09(out09),
    .out10(out10),
    .out11(out11),
    .out12(out12),
    .out13(out13),
    .out14(out14),
    .out15(out15),
    .clk(clk),
    .rst(rst),
    .done(done)
  );
    
  // Clock generator
  always begin
   #5;
   clk <= 1;
   #5;
   clk <= 0;
   end


  // Test procedure
  initial begin
    // Initial values
    clk = 0;
    rst = 0;
    inp_west0 = 0;
    inp_west4 = 0;
    inp_west8 = 0;
    inp_west12 = 0;
    inp_north0 = 0;
    inp_north1 = 0;
    inp_north2 = 0;
    inp_north3 = 0;
        
    // Apply reset
    rst = 1;
    #10;
    rst = 0;
    #10;
        
    // stage 1
    inp_west0 = 8'h01;
    inp_north0 = 8'h01;
    #5
    //stage 2
    inp_west0 = 0;
    inp_north 0 = ;
    inp_west4 = 8'h02;
    inp_north1 = 8'h02;
    #5
    inp_west8 = 8'h03;
    
    #5
    inp_west12 = 8'h04;
    inp_north2 = 8'h03;
    inp_north3 = 8'h04;
        
    // Wait for the output to stabilize
    #100;
        
    // Apply different stimulus (you can uncomment and modify for further tests)
    // inp_west0 = 8'hFF;
    // inp_west4 = 8'hAA;
    // inp_west8 = 8'hBB;
    // inp_west12 = 8'hCC;
    // inp_north0 = 8'hDD;
    // inp_north1 = 8'hEE;
    // inp_north2 = 8'hFF;
    // inp_north3 = 8'h00;
        
    // Wait and observe output
    #100;
        
    // End simulation
    $finish;
  end

  // Monitor outputs for debugging (continuously display output values)
  initial begin
    // Start monitoring at time 0
    $monitor("Time: %0t, inp_west0: %h, inp_west4: %h, inp_west8: %h, inp_west12: %h, inp_north0: %h, inp_north1: %h, inp_north2: %h, inp_north3: %h, out00: %h, out01: %h, out02: %h, out03: %h, out04: %h, out05: %h, out06: %h, out07: %h, out08: %h, out09: %h, out10: %h, out11: %h, out12: %h, out13: %h, out14: %h, out15: %h, done: %b", 
    $time, inp_west0, inp_west4, inp_west8, inp_west12, inp_north0, inp_north1, inp_north2, inp_north3, 
    out00, out01, out02, out03, out04, out05, out06, out07, 
    out08, out09, out10, out11, out12, out13, out14, out15, done);
  
  $dumpfile("dump.vcd");    // Specifies the name of the VCD file
  $dumpvars(0, tb_systolic_array);  // Dumps all signals in the testbench
  end

endmodule
