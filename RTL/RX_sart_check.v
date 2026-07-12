module START_CHECKER (
input wire 	CLK,
input wire	RST,
input wire	strt_chk_en,
input wire	sampled_bit,
input wire	bit_done,
output wire	strt_err
);
assign strt_err = ((strt_chk_en & (sampled_bit ^ 0)&bit_done)) ?  1:0;


endmodule