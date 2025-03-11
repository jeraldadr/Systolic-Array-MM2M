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
        outp_south <= inp_north;  
        outp_east <= inp_west;    
        result <= result + (inp_north * inp_west);
    end
end

endmodule