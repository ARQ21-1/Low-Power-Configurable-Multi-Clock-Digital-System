module PARITY_CHECKER (
input wire 	CLK,
input wire	RST,
input wire [3:0]bit_cnt,
input wire	par_chk_en,
input wire	sampled_bit,
input wire	PARITY_TYPE,
input wire	odd_parity,
input wire	even_parity,
input wire 	bit_done,
output wire	par_err,
output reg	PAR_err
);
always@(posedge CLK or negedge RST)begin
if(!RST)PAR_err<=0;
else PAR_err<=par_err;
end

assign par_err = (~par_chk_en) ? 0 : 
                 ((PARITY_TYPE & (odd_parity ^ sampled_bit) & bit_done) || 
                 ((~PARITY_TYPE) & (even_parity ^ sampled_bit) & bit_done)) ? 1 : 0;

endmodule
