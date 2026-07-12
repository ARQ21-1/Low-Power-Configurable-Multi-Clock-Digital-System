module FIFO_WR # (
    parameter ADDR_WIDTH = 3) 
( 
input wire 		     w_CLK,
input wire 		     w_RST,
input wire 		     w_inc,
input wire  [ADDR_WIDTH:0]   r_ptr,

output wire 		     w_full,
output wire [ADDR_WIDTH:0]   w_ptr_grey,
output wire [ADDR_WIDTH-1:0] w_addr,
output wire                  w_clk_en
);
//______________________________________________________________________
assign w_clk_en = ((w_inc)&(!w_full));
//______________________________________________________________________
reg [ADDR_WIDTH:0] w_ptr;
//______________________________________________________________________
always@(posedge w_CLK or negedge w_RST)
begin//
if(!w_RST)
w_ptr <= 0;
else begin
if(w_clk_en)
w_ptr <= w_ptr+1;
else w_ptr <= w_ptr;
end
end//
assign w_addr = w_ptr[ADDR_WIDTH-1:0];
//______________________________________________________________________
//GRAY coding for ANY num of bits
assign w_ptr_grey[ADDR_WIDTH] = w_ptr[ADDR_WIDTH];
genvar i;
generate
for(i = 0;i<ADDR_WIDTH;i=i+1) begin
assign w_ptr_grey[i] = w_ptr[i] ^ w_ptr[i+1]; 
end
endgenerate
//______________________________________________________________________
// full flag calc
assign w_full =(w_ptr_grey[ADDR_WIDTH]!=r_ptr[ADDR_WIDTH])&&(w_ptr_grey[ADDR_WIDTH-1]!=r_ptr[ADDR_WIDTH-1])&&(w_ptr_grey[ADDR_WIDTH-2:0]==r_ptr[ADDR_WIDTH-2:0]) ;
//______________________________________________________________________
endmodule