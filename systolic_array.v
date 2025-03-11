module systolic_array(
    input wire[7:0] inp_west0,
    input wire[7:0] inp_west4,
    input wire[7:0] inp_west8,
    input wire[7:0] inp_west12,
    input wire[7:0] inp_north0,
    input wire[7:0] inp_north1,
    input wire[7:0] inp_north2,
    input wire[7:0] inp_north3,
    output wire [15:0] out00,
    output wire [15:0] out01,
    output wire [15:0] out02,
    output wire [15:0] out03,
    output wire [15:0] out04,
    output wire [15:0] out05,
    output wire [15:0] out06,
    output wire [15:0] out07,
    output wire [15:0] out08,
    output wire [15:0] out09,
    output wire [15:0] out10,
    output wire [15:0] out11,
    output wire [15:0] out12,
    output wire [15:0] out13,
    output wire [15:0] out14,
    output wire [15:0] out15,
	input wire clk, 
    input wire rst, 
    output wire done);

// Your design is here
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

PE pe12 (.inp_north(out_south[2][0]), .inp_west(inp_west12), .clk(clk), .rst(rst), .outp_south(), .outp_east(out_east[3][0]), .result(res[3][0]));
PE pe13 (.inp_north(out_south[2][1]), .inp_west(out_east[3][0]), .clk(clk), .rst(rst), .outp_south(), .outp_east(out_east[3][1]), .result(res[3][1]));
PE pe14 (.inp_north(out_south[2][2]), .inp_west(out_east[3][1]), .clk(clk), .rst(rst), .outp_south(), .outp_east(out_east[3][2]), .result(res[3][2]));
PE pe15 (.inp_north(out_south[2][3]), .inp_west(out_east[3][2]), .clk(clk), .rst(rst), .outp_south(), .outp_east(out_east[3][3]), .result(res[3][3]));

assign out00 = res[0][3]; 
assign out01 = res[0][2]; 
assign out02 = res[0][1]; 
assign out03 = res[0][0];
assign out04 = res[1][3]; 
assign out05 = res[1][2]; 
assign out06 = res[1][1]; 
assign out07 = res[1][0];
assign out08 = res[2][3]; 
assign out09 = res[2][2]; 
assign out10 = res[2][1]; 
assign out11 = res[2][0];
assign out12 = res[3][3]; 
assign out13 = res[3][2]; 
assign out14 = res[3][1]; 
assign out15 = res[3][0];

assign done = 1'b1; 

endmodule