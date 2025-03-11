module test;

  reg [7:0] inp_west0; 
  reg [7:0] inp_west4; 
  reg [7:0] inp_west8; 
  reg [7:0] inp_west12;
  reg [7:0] inp_north0; 
  reg [7:0] inp_north1; 
  reg [7:0] inp_north2; 
  reg [7:0] inp_north3;
  reg clk, rst;
    
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
    
      always begin
    #5 clk = 1;
    #5 clk = 0;
  end

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
        
    rst = 1;
    #5;
    rst = 0;
    #5;
    
    /*
    HERE ARE MY VALUES:
	x1 = 1, x2 = 2, x3 = 3, x4 = 4, etc.
    y1 = 1, y2 = 2, y3 = 3, y4 = 4, etc.
    */
    
    // stage 1
    inp_west0 = 8'h01;
    inp_north0 = 8'h01;
    #10
    //stage 2
    inp_west0 = 8'd2;
    inp_west4 = 8'd5;
    inp_north0 = 8'd5;
    inp_north1 = 8'd2;
    #10
    //stage 3
    inp_west0 = 8'd3;
    inp_west4 = 8'd6;
    inp_west8 = 8'd9;
    inp_north0 = 8'd9;
    inp_north1 = 8'd6;
    inp_north2 = 8'd3;
  	#10
    //stage 4
    inp_west0 = 8'd4;
    inp_west4 = 8'd7;
    inp_west8 = 8'd10;
    inp_west12 = 8'd13;
    inp_north0 = 8'd13;
    inp_north1 = 8'd10;
    inp_north2 = 8'd7;
    inp_north3 = 8'd4;
    #10
    //stage 5
    inp_west0 = 0;
    inp_west4 = 8;
    inp_west8 = 11;
    inp_west12 = 14;
    inp_north0 = 0;
    inp_north1 = 14;
    inp_north2 = 11;
    inp_north3 = 8;
    #10
    //stage 6
    inp_west4 = 0;
    inp_west8 = 12;
    inp_west12 = 15;
    inp_north1 = 0;
    inp_north2 = 15;
    inp_north3 = 12;
    #10
    //stage 7
    inp_west8 = 0;
    inp_west12 = 16;
    inp_north2 = 0;
    inp_north3 = 16;
    
    //wait
    #500
        
    $finish;
  end

  initial begin
    // Start monitoring at time 0
    $monitor("Time: %0t,\n out00: %d, out01: %d, out02: %d, out03: %d,\n out04: %d, out05: %d, out06: %d, out07: %d,\n out08: %d, out09: %d, out10: %d, out11: %d,\n out12: %d, out13: %d, out14: %d, out15: %d,\n done: %b", 
    $time, 
    out00, out01, out02, out03, out04, out05, out06, out07, 
    out08, out09, out10, out11, out12, out13, out14, out15, done);
  
  $dumpfile("dump.vcd");    
  $dumpvars(0, test); 
  end

endmodule
