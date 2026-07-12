module STOP_CHECKER (
input wire 	CLK,
input wire	RST,
input wire	stop_chk_en,
input wire	sampled_bit,
input wire	bit_done,
output wire	stop_err,
output reg	STOP_err
);
always@(posedge CLK or negedge RST)begin
if(!RST)STOP_err<=0;
else STOP_err<=stop_err;
end

assign stop_err = (stop_chk_en & (sampled_bit ^ 1'b1)&bit_done)? 1:0;


endmodule
