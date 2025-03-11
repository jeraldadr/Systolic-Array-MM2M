module systolic_array(
    input wire[7:0] inp_west0,
    input wire[7:0] inp_west4,
    input wire[7:0] inp_west8,
    input wire[7:0] inp_west12,
    input wire[7:0] inp_north0,
    input wire[7:0] inp_north1,
    input wire[7:0] inp_north2,
    input wire[7:0] inp_north3,
    output reg [15:0] out00,
    output reg [15:0] out01,
    output reg [15:0] out02,
    output reg [15:0] out03,
    output reg [15:0] out04,
    output reg [15:0] out05,
    output reg [15:0] out06,
    output reg [15:0] out07,
    output reg [15:0] out08,
    output reg [15:0] out09,
    output reg [15:0] out10,
    output reg [15:0] out11,
    output reg [15:0] out12,
    output reg [15:0] out13,
    output reg [15:0] out14,
    output reg [15:0] out15,
	input wire clk, 
    input wire rst, 
    output reg done);

// Your design is here
reg [3:0] cycle_counter;
wire [7:0] out_south[3:0][3:0]; // Connects PE outputs to next row
wire [7:0] out_east[3:0][3:0];  // Connects PE outputs to next column
wire [15:0] res[3:0][3:0];

PE pe00 (.inp_north(inp_north0), .inp_west(inp_west0), .clk(clk), .rst(rst), .outp_south(out_south[0][0]), .outp_east(out_east[0][0]), .result(res[0][0]));
PE pe01 (.inp_north(inp_north1), .inp_west(out_east[0][0]), .clk(clk), .rst(rst), .outp_south(out_south[0][1]), .outp_east(out_east[0][1]), .result(res[0][1]));
PE pe02 (.inp_north(inp_north2), .inp_west(out_east[0][1]), .clk(clk), .rst(rst), .outp_south(out_south[0][2]), .outp_east(out_east[0][2]), .result(res[0][2]));
PE pe03 (.inp_north(inp_north3), .inp_west(out_east[0][2]), .clk(clk), .rst(rst), .outp_south(out_south[0][3]), .outp_east(out_east[0][3]), .result(res[0][3]));

PE pe04 (.inp_north(out_south[0][0]), .inp_west(inp_west4), .clk(clk), .rst(rst), .outp_south(out_south[1][0]), .outp_east(out_east[1][0]), .result(res[1][0]));
PE pe05 (.inp_north(out_south[0][1]), .inp_west(out_east[1][0]), .clk(clk), .rst(rst), .outp_south(out_south[1][1]), .outp_east(out_east[1][1]), .result(res[1][1]));
PE pe06 (.inp_north(out_south[0][2]), .inp_west(out_east[1][1]), .clk(clk), .rst(rst), .outp_south(out_south[1][2]), .outp_east(out_east[1][2]), .result(res[1][2]));
PE pe07 (.inp_north(out_south[0][3]), .inp_west(out_east[1][2]), .clk(clk), .rst(rst), .outp_south(out_south[1][3]), .outp_east(out_east[1][3]), .result(res[1][3]));

PE pe08 (.inp_north(out_south[1][0]), .inp_west(inp_west8), .clk(clk), .rst(rst), .outp_south(out_south[2][0]), .outp_east(out_east[2][0]), .result(res[2][0]));
PE pe09 (.inp_north(out_south[1][1]), .inp_west(out_east[2][0]), .clk(clk), .rst(rst), .outp_south(out_south[2][1]), .outp_east(out_east[2][1]), .result(res[2][1]));
PE pe10 (.inp_north(out_south[1][2]), .inp_west(out_east[2][1]), .clk(clk), .rst(rst), .outp_south(out_south[2][2]), .outp_east(out_east[2][2]), .result(res[2][2]));
PE pe11 (.inp_north(out_south[1][3]), .inp_west(out_east[2][2]), .clk(clk), .rst(rst), .outp_south(out_south[2][3]), .outp_east(out_east[2][3]), .result(res[2][3]));

PE pe12 (.inp_north(out_south[2][0]), .inp_west(inp_west12), .clk(clk), .rst(rst), .outp_south(out_south[3][0]), .outp_east(out_east[3][0]), .result(res[3][0]));
PE pe13 (.inp_north(out_south[2][1]), .inp_west(out_east[3][0]), .clk(clk), .rst(rst), .outp_south(out_south[3][1]), .outp_east(out_east[3][1]), .result(res[3][1]));
PE pe14 (.inp_north(out_south[2][2]), .inp_west(out_east[3][1]), .clk(clk), .rst(rst), .outp_south(out_south[3][2]), .outp_east(out_east[3][2]), .result(res[3][2]));
PE pe15 (.inp_north(out_south[2][3]), .inp_west(out_east[3][2]), .clk(clk), .rst(rst), .outp_south(out_south[3][3]), .outp_east(out_east[3][3]), .result(res[3][3]));

  always @(posedge clk or posedge rst) begin
    if (rst ) begin
      	out00 = 0; 
      out01 = 0; 
      out02 = 0; 
      out03 = 0;
      out04 = 0; 
      out05 = 0; 
      out06 = 0; 
      out07 = 0;
      out08 = 0; 
      out09 = 0; 
      out10 = 0; 
      out11 = 0;
      out12 = 0; 
      out13 = 0; 
      out14 = 0; 
      out15 = 0;
        done <= 0;
        cycle_counter <= 0;
    end else if (!done) begin
      	out00 = res[0][3]; 
        out01 = res[0][2]; 
        out02 = res[0][1]; 
        out03 = res[0][0];
        out04 = res[1][3]; 
        out05 = res[1][2]; 
        out06 = res[1][1]; 
        out07 = res[1][0];
        out08 = res[2][3]; 
        out09 = res[2][2]; 
        out10 = res[2][1]; 
        out11 = res[2][0];
        out12 = res[3][3]; 
        out13 = res[3][2]; 
        out14 = res[3][1]; 
        out15 = res[3][0];
        if (cycle_counter < 7) begin
            cycle_counter <= cycle_counter + 1;
        end else begin
            done <= 1;  // Indicate computation is complete
        end
    end
end



endmodule