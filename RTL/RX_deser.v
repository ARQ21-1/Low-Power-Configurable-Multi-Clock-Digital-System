module DESERIALIZER (
input wire 		CLK,
input wire		RST,
input wire		sampled_bit,
input wire		deser_en,
input wire 		bit_done,
input wire 		PARITY_EN,
input wire	[3:0]	bit_cnt,
output reg	[7:0]	P_DATA,
output wire		even_parity,odd_parity
);
wire	[7:0]	P_DATA_C;
reg [10:0] all_frame;


always @ (posedge CLK or negedge RST)
 begin
if(!RST) all_frame <= 11'b0; 
else if(	bit_done 	&& 	((PARITY_EN&(bit_cnt < 4'b1011))||(~PARITY_EN&(bit_cnt < 4'b1010)) ))
        all_frame <= {sampled_bit , all_frame[10:1]} ;         // shift register
else
	all_frame <= all_frame;
 end


assign even_parity =((bit_cnt == 4'b1001)&bit_done )? (^all_frame[10:3]):0;
assign odd_parity =((bit_cnt == 4'b1001)&bit_done )? (~^all_frame[10:3]):0;


assign P_DATA_C = (PARITY_EN==1) ? all_frame[9:2]:all_frame[10:3];

always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    P_DATA <= 'b0 ;
   end
  else if(deser_en) P_DATA <= P_DATA_C ;
  else P_DATA <= P_DATA ;
 end 

endmodule
