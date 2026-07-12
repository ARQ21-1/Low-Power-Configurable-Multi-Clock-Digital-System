module UART_TX #(parameter DATA_WIDTH=8)(


//IOs

input wire [DATA_WIDTH-1:0] P_DATA,
input wire DATA_VALID,
input wire PAR_EN,
input wire PAR_TYP,
input wire CLK,
input wire RST,
output reg TX_OUT,
output reg BUSY
);
reg BUSY_comb;
reg TX_OUT_comb;
reg [DATA_WIDTH-1:0] SR; //for the shift registers 
reg PARITY_BIT;
/////////////////////////FSM//////////////////////////
localparam  [2:0]    IDLE         = 3'b000,
                     START        = 3'b001,
                     DATA         = 3'b010,
		     PARITY       = 3'b011,
	 	     STOP         = 3'b100;
reg    [2:0]         current_state,next_state ;
//////////////////////////////////////////////////////
///////////////////////counter////////////////////////
//////////////////////////////////////////////////////
reg    [2:0]        counter;
reg                    ZERO;



always @(posedge CLK)
 begin
   if (current_state != DATA) 
      counter  = 3'b111 ;   
   else
      counter  = counter - 3'b001 ; 
 end  
//--------------------------------------------------------
 always @(*)
 begin
 ZERO = ~|counter ; // zero flag
 end
//--------------------------------------------------------
 always @(posedge CLK or negedge RST)
 begin
 if(!RST)
   begin
     PARITY_BIT <= 0 ;
   end
else if(!BUSY_comb && DATA_VALID)
 PARITY_BIT <= ^P_DATA ;
else PARITY_BIT <= PARITY_BIT ; // even parity bit
 end
//--------------------------------------------------------

/////////////////////////state transition////////////////////////////                   
always @(posedge CLK or negedge RST)
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

 /////////////////////////BUSY reg////////////////////////////                   
always @(posedge CLK or negedge RST)//to avoid a comb loop
 begin
  if(!RST)
   begin
     BUSY <= 0 ;
   end
  else
   begin
     BUSY <= BUSY_comb ;
   end
 end
/////////////////////////TX_OUT reg////////////////////////////                   
always @(posedge CLK or negedge RST)//to avoid a comb loop
 begin
  if(!RST)
   begin
     TX_OUT <= 0 ;
   end
  else
   begin
     TX_OUT <= TX_OUT_comb ;
   end
 end
////////////////////////////next state logic/////////////////////////////
//next state logic
 always @(*)
 begin
 case (current_state)
    IDLE : begin
       if (DATA_VALID && !BUSY_comb)
          next_state=START;
        else 
          next_state=IDLE; 
    end
////////////////
    START : next_state=DATA; //always a one clock cycle state 
////////////////
    DATA : begin
      if(!ZERO)
        next_state=DATA; // keep sending serial bits
        else if (ZERO && PAR_EN) // send parity
          next_state=PARITY;
        else next_state=STOP; // do NOT send parity
    end
////////////////
    PARITY:  next_state=STOP;
////////////////
    STOP:  
      next_state=IDLE; 

    ////////////////
     default :   next_state = IDLE ;	
////////////////
   endcase 
 end
/////////////////////////////////////////////////////////////////////////////
// TX_OUT output logic
always @(*)
 begin
  case(current_state)
IDLE:TX_OUT_comb=1;
///////////////////////
DATA:TX_OUT_comb=SR[0];
///////////////////////
START:TX_OUT_comb=0;
///////////////////////
STOP:TX_OUT_comb=1;
///////////////////////
PARITY:
begin
 if(PAR_TYP)
 TX_OUT_comb=!PARITY_BIT;
 else TX_OUT_comb=PARITY_BIT;
end
///////////////////////
default:TX_OUT_comb=1;
///////////////////////
endcase
end

/////////////////////////////////////////////////////////////////////////////
// BUSY output logic
always @(*) 
 begin
  case(current_state)
IDLE:   BUSY_comb=0;
///////////////
DATA:   BUSY_comb=1;
///////////////
START:  BUSY_comb=1;
///////////////
STOP:   BUSY_comb=1;
///////////////
PARITY: BUSY_comb=1;
///////////////
default:BUSY_comb=0;
///////////////
endcase
end
/////////////////////////////////////////////////////////////////////////////
integer   i  ;
always@(posedge CLK or negedge RST  )
begin
	if (!RST) 
		begin
			SR <= 0;
		end
		
else if(DATA_VALID && (!BUSY_comb) )
		begin	 
		SR <= P_DATA;
		end
		
else if(!DATA_VALID && !BUSY_comb)
	    SR <= SR;
else if(BUSY_comb && current_state==DATA)
  begin
	   	SR[DATA_WIDTH-1] <= 0;
	   	for(i=(DATA_WIDTH-1); i>0; i=i-1)
	   	begin
	   	 SR[i-1] <= SR[i];
	   	end
	end
else SR <= SR;
		  
end 
  
endmodule  

