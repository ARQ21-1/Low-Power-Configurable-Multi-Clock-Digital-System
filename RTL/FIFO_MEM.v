module FIFO_BUFFER # (
    parameter ADDR_WIDTH = 3,
    parameter BUFFER_DEPTH = 8,
    parameter BUFFER_WIDTH = 8)
(
    input  wire                   w_clk_en,
    input  wire                   w_clk, 
    input  wire			  w_rst,
    input  wire  [ADDR_WIDTH-1:0] w_address,
    input  wire  [ADDR_WIDTH-1:0] r_address,
   
    input  wire  [BUFFER_WIDTH-1:0]  w_data, 
    output wire   [BUFFER_WIDTH-1:0]  r_data

);

   integer j;
    reg [BUFFER_WIDTH-1:0] memory [BUFFER_DEPTH-1:0];        



    always @(posedge w_clk or negedge w_rst) 
	  begin
if(!w_rst)
begin

 for (j=0; j < BUFFER_DEPTH; j=j+1)  memory[j] <= {BUFFER_WIDTH{1'b0}}; //reset array
end
else begin
        if (w_clk_en) memory[w_address] <= w_data;
		 
		else memory[w_address] <= memory[w_address];
     end
	 end
assign r_data =  memory[r_address];
endmodule