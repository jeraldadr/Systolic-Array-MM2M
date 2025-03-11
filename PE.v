module PE(
    input wire [7:0] inp_north, 
    input wire [7:0] inp_west,   
    input wire clk,              
    input wire rst,              
    output reg [7:0] outp_south, 
    output reg [7:0] outp_east,  
    output reg [15:0] result      
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        outp_south <= 0;
        outp_east <= 0;
        result <= 0;
    end
    else begin
        outp_south <= inp_north;  // Pass inp_north to outp_south
        outp_east <= inp_west;    // Pass inp_west to outp_east
        result <= result + (inp_north * inp_west);  // Add the product of inp_north and inp_west to result
    end
end

endmodule