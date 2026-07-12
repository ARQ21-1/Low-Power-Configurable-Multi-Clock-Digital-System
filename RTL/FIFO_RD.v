module FIFO_RD # (
    parameter ADDR_WIDTH = 3) 
( 
input wire 		     r_CLK,
input wire 		     r_RST,
input wire 		     r_inc,
input wire  [ADDR_WIDTH:0]   w_ptr,

output wire 		     r_empty,
output wire [ADDR_WIDTH:0]   r_ptr_grey,
output wire [ADDR_WIDTH-1:0] r_addr
);
//______________________________________________________________________
reg [ADDR_WIDTH:0] r_ptr;
//______________________________________________________________________
always@(posedge r_CLK or negedge r_RST)
begin//
if(!r_RST)
r_ptr <= 0;
else begin
if(r_inc)
r_ptr <= r_ptr+1;
else r_ptr <= r_ptr;
end
end//
assign r_addr = r_ptr[ADDR_WIDTH-1:0];
//______________________________________________________________________
//GRAY coding for ANY num of bits
assign r_ptr_grey[ADDR_WIDTH] = r_ptr[ADDR_WIDTH];
genvar i;
generate
for(i = 0;i<ADDR_WIDTH;i=i+1) begin
assign r_ptr_grey[i] = r_ptr[i] ^ r_ptr[i+1]; 
end
endgenerate
//______________________________________________________________________
// empty flag calc
assign r_empty = (w_ptr == r_ptr_grey) ? 1'b1:1'b0;
//______________________________________________________________________
endmodule
