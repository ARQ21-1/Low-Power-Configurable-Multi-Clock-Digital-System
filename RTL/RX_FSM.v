module UART_RX_FSM (
input wire			CLK, 	
input wire			RST,

input wire			RX_IN,
input wire			PARITY_EN,
input wire			par_err,
input wire			strt_err,
input wire			bit_done,
input wire			bit_over,
input wire			stop_err,
input wire			data_done,
input wire	[4:0]		edge_cnt,
input wire	[3:0]		bit_cnt,

output reg			par_chk_en,
output reg			strt_chk_en,
output reg			stop_chk_en,	
output reg			deser_en,
output reg			DATA_VALID,
output reg			cnt_en,
output reg			sampler_en
);
//___________________________________________________________________________________________
// gray state encoding
parameter   [2:0]      			   IDLE  	 = 3'b000,
                    			   START 	 = 3'b001,
					   DATA	         = 3'b011,
					   PARITY	 = 3'b010,
					   STOP          = 3'b110;
reg 	    [2:0] 		           current_state,	next_state;

reg    					   DATA_VALID_C,DATA_VALID_delay;//DATA_VALID_delay is just so the data is ready 1 clock cycle before the data valid flag is up
//___________________________________________________________________________________________
//state transiton 
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    current_state <= IDLE ;
   end
  else
   begin
    current_state <= next_state ;
   end
 end
//___________________________________________________________________________________________
//next state logic
always @(*)
begin
case(current_state)
IDLE:begin
		if(!RX_IN)begin
				 next_state=START;
			  end
		else
			next_state=IDLE;
		end
			

START:
begin
if(bit_done)
begin
if(strt_err)
next_state=IDLE;
else next_state=DATA;
end
else next_state=START;
end 


DATA:begin
		if(bit_cnt < 4'b1000)
			next_state=DATA;
		else if (bit_done)
begin
if (PARITY_EN)
next_state=PARITY;
else next_state=STOP;
end
		else 
			next_state=DATA;
		end

PARITY:
begin
if(bit_done)
begin
if(par_err)
next_state=IDLE;
else next_state=STOP;
end
else next_state=PARITY;
end 

STOP:begin
if(bit_done)
begin
if(stop_err)
next_state=IDLE;
else next_state=IDLE;
end
else next_state=STOP;
end 



default:begin
		next_state=IDLE;
	end 
endcase
end
//___________________________________________________________________________________________
//output logic
always @(*)
begin
strt_chk_en	 = 0;
par_chk_en	 = 0;
stop_chk_en	 = 0;
cnt_en 		 = 0;
sampler_en	 = 0;
deser_en	 = 0;
DATA_VALID_C	 = 0;
//____________________
case(current_state)
IDLE:
begin 
strt_chk_en	 = 0;
par_chk_en	 = 0;
stop_chk_en	 = 0;
cnt_en 		 = 0;
sampler_en	 = 0;
deser_en	 = 0;

DATA_VALID_C=0;

end
//____________________
START:
begin 
strt_chk_en	 = 1;
par_chk_en	 = 0;
stop_chk_en	 = 0;

cnt_en 		 = 1;
sampler_en	 = 1;

deser_en	 = 0;

DATA_VALID_C=0;

end

//____________________
DATA:
begin 
strt_chk_en	 = 0;
par_chk_en	 = 0;
stop_chk_en	 = 0;
cnt_en 		 = 1;
sampler_en	 = 1;

deser_en	 = 0;

DATA_VALID_C=0;

end
//____________________
PARITY:
begin 
strt_chk_en	 = 0;
par_chk_en	 = 1;
stop_chk_en	 = 0;
cnt_en 		 = 1;
sampler_en	 = 1;

deser_en	 = 0;
end

//____________________
STOP:
begin 
strt_chk_en	 = 0;
par_chk_en	 = 0;
stop_chk_en	 = 1;
cnt_en 		 = 1;
sampler_en	 = 1;
if(bit_done&&(!stop_err))
begin
DATA_VALID_C	 = 1;
deser_en	 = 1;
end
else
begin
DATA_VALID_C	 = 0;
deser_en	 = 0;
end
end
//____________________
default:
begin
strt_chk_en	 = 0;
par_chk_en	 = 0;
stop_chk_en	 = 0;
cnt_en 		 = 0;
sampler_en	 = 0;
deser_en	 = 0;
DATA_VALID_C	 = 0;
end
endcase
end
//___________________________________________________________________________________________
//DATA VALID register to delay 1 clock cycle so the data is ready 1 clock cycle before data valid flag is up 
always @ (posedge CLK )
 begin
 
    DATA_VALID_delay <= DATA_VALID_C ;

 end

//___________________________________________________________________________________________
// DATA VALID OUTPUT registered
always @ (posedge CLK or negedge RST)

 begin
  if(!RST)
   begin
    DATA_VALID <= 0 ;
   end
  else
   begin
    DATA_VALID <= DATA_VALID_delay ;
   end
 end

//___________________________________________________________________________________________

endmodule














