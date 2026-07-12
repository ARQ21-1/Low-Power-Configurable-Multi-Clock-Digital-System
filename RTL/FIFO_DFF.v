// number of stages is not parameterized and assumed to be 2

module FIFO_DFF #(parameter ptr_width=4)(
input wire [ptr_width-1:0] ptr,
input wire CLK,
input wire RST,

output wire [ptr_width-1:0] sync_ptr
);

reg [ptr_width-1:0]  R0;
reg [ptr_width-1:0]  R1;

always@(posedge CLK or negedge RST)
begin
if (!RST)
 R0 <=0;
else 
 R0 <= ptr;
end

always@(posedge CLK or negedge RST)
begin
if (!RST)
 R1 <=0;
else 
 R1 <= R0;
end

assign sync_ptr = R1;

endmodule
