module DATA_SAMPLER(
input wire			CLK,
input wire			RST,
input wire 	[4:0]		edge_cnt,	
input wire			sampler_en,
input wire			RX_IN,
input wire	[5:0]		PRESCALE,

output reg			sampled_bit

);
reg sampled_bit_c;
reg   [6:0]   samples;
//_________________________________________
reg bit_done;
always@(*)
begin 
case(PRESCALE)
6'b000100://oversampling by 4
bit_done = &edge_cnt[1:0];
6'b001000://oversampling by 8
bit_done = &edge_cnt[2:0];
6'b010000://oversampling by 16
bit_done = &edge_cnt[3:0];
6'b100000://oversampling by 32
bit_done = &edge_cnt[4:0];
default: bit_done = &edge_cnt;
endcase
end
//_________________________________________
always@(posedge CLK or negedge RST)
begin
if (!RST) samples<=0;
else begin
if(sampler_en)
begin
case(PRESCALE)





6'b000100://oversampling by 4
begin 
if (edge_cnt[1:0]==2'b10)
	samples[0]<=RX_IN;
else samples[0]<=samples[0];
end


6'b001000://oversampling by 8
begin 
	case(edge_cnt[2:0])
3'b011:
	samples[0]<=RX_IN;
3'b100:
	samples[1]<=RX_IN;
3'b101:
	samples[2]<=RX_IN;
default: samples[2:0] <= samples[2:0] ;
endcase
end




6'b010000://oversampling by 16
begin 
	case(edge_cnt[3:0])
4'b0110:
	samples[0]<=RX_IN;
4'b0111:
	samples[1]<=RX_IN;
4'b1000:
	samples[2]<=RX_IN;
4'b1001:
	samples[3]<=RX_IN;
4'b1010:
	samples[4]<=RX_IN;
default:samples[4:0] <= samples[4:0] ;
endcase
end




6'b100000://oversampling by 32
begin 
	case(edge_cnt[4:0])
5'b01101:
	samples[0]<=RX_IN;
5'b01110:
	samples[1]<=RX_IN;
5'b01111:
	samples[2]<=RX_IN;
5'b10000:
	samples[3]<=RX_IN;
5'b10001:
	samples[4]<=RX_IN;
5'b10010:
	samples[5]<=RX_IN;
5'b10011:
	samples[6]<=RX_IN;
default samples[6:0] <= samples[6:0] ;
endcase
end



default: samples<=7'b1111111;
endcase








end
end


end
//_________________________________________
assign majority_3 = (samples[0]&samples[1]) | (samples[0]&samples[2]) | (samples[1]&samples[2]);
assign majority_5 = (majority_3&samples[3]) | (majority_3&samples[4]) | (samples[3]&samples[4]);
assign majority_7 = (majority_5&samples[5]) | (majority_5&samples[6]) | (samples[5]&samples[6]);
//_________________________________________
always@(*)
begin 
sampled_bit_c = 0;
case(PRESCALE)
6'b000100://oversampling by 4
begin
if((edge_cnt[1:0]==2'b11)&sampler_en)
sampled_bit_c = samples[0];
end
6'b001000://oversampling by 8
begin
if((edge_cnt[2:0]==3'b101)&sampler_en)
sampled_bit_c = majority_3;
end
6'b010000://oversampling by 16
begin
if((edge_cnt[3:0]==4'b1010)&sampler_en)
sampled_bit_c = majority_5;
end
6'b100000://oversampling by 32
begin
if((edge_cnt[4:0]==5'b10011)&sampler_en)
sampled_bit_c = majority_7;
end
default: sampled_bit_c = 0;
endcase
end
//_________________________________________
always@(posedge CLK or negedge RST)
begin
if(!RST) sampled_bit<=0;
else sampled_bit<=sampled_bit_c;
end
//_________________________________________
endmodule