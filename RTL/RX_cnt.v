module EDGE_BIT_COUNTER (
input wire			cnt_en,
input wire			CLK,
input wire	[5:0]		PRESCALE,
input wire			deser_en,
//input wire			RST,// NO NEED FOR RESET HERE I THINK

output reg 	[3:0]		bit_cnt,
output reg	[4:0]		edge_cnt,
output reg			bit_done,
output reg			bit_over,
output reg			data_done
);

//_________________________________________   
always @(posedge CLK)
 begin
   if (cnt_en) 
      edge_cnt  = edge_cnt + 5'b00001 ;   
   else
      edge_cnt  = 5'b00000; 
 end 
//_________________________________________
always@(*)
begin 
case(PRESCALE)
6'b000100://oversampling by 4
bit_done = (edge_cnt[1:0]==2'b11);
6'b001000://oversampling by 8
bit_done = (edge_cnt[2:0]==3'b110);
6'b010000://oversampling by 16
bit_done = (edge_cnt[3:0]==4'b1011);
6'b100000://oversampling by 32
bit_done = (edge_cnt[4:0]==5'b10100);
default: bit_done = 0;
endcase
end
//_________________________________________
always@(*)
begin 
case(PRESCALE)
6'b000100://oversampling by 4
bit_over = &(edge_cnt[1:0]);
6'b001000://oversampling by 8
bit_over = &(edge_cnt[2:0]);
6'b010000://oversampling by 16
bit_over = &(edge_cnt[3:0]);
6'b100000://oversampling by 32
bit_over = &(edge_cnt[4:0]);
default: bit_over = 0;
endcase
end
//_________________________________________
always @(posedge CLK)
 begin
   if(~cnt_en)
      bit_cnt  = 4'b0000;
   else if (cnt_en & bit_over) 
      bit_cnt  = bit_cnt + 4'b0001 ;   
   else bit_cnt  = bit_cnt;
 end 

//_________________________________________
 
//_________________________________________   

//_________________________________________

//_________________________________________



//_________________________________________
endmodule