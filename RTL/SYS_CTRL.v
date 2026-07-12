module SYS_CTRL #(parameter DATA_WIDTH = 8 ,  RF_ADDR = 4)
(
input wire 	CLK,
input wire 	RST,


input wire [DATA_WIDTH-1:0]  RX_DATA,
input wire 		     RX_valid,

input wire 		     FIFO_FULL,
output reg		     FIFO_wr_inc,
output reg [DATA_WIDTH-1:0] FIFO_wr_data,


output reg		     Reg_wr_en,
output reg [RF_ADDR-1:0]     Reg_ADDR,
output reg [DATA_WIDTH-1:0]  Reg_wr_data,
output reg		     Reg_rd_en,
input wire  [DATA_WIDTH-1:0] Reg_rd_data,
input wire 		     Reg_data_valid,


input wire [(2*DATA_WIDTH)-1:0] ALU_out, 
input wire		     ALU_out_valid,
output wire		     ALU_en,	
output reg	[3:0 ]       ALU_FUN,
output wire		     CLK_DIV_EN,
output wire		     ALU_GATE_EN

);

localparam  [3:0]    IDLE         	      = 4'b0000, //0 

                     REG_WR_1                 = 4'b0001, //1  received first wr frame, waiting for second
                     REG_WR_2                 = 4'b0011, //2  received second wr frame, waiting for third
                     REG_WR_3                 = 4'b0010, //3  received third wr frame, writing in reg file...           (1 cycle)

		     REG_RD_1                 = 4'b0110, //4  received first rd frame, waiting for second
		     REG_RD_2                 = 4'b0111, //5  received second rd frame, waiting for rd_valid
		     REG_RD_RES               = 4'b0101, //6  received rd_data from reg_file, writing in FIFO...        (1 cycle)

	 	     ALU_OP_1                 = 4'b0100, //7  received first ALU frame, waiting for second
	 	     ALU_OP_2                 = 4'b1100, //8  received second ALU frame, waiting for third
	 	     ALU_OP_3                 = 4'b1101, //9  received third ALU frame, waiting for fourth
	 	     ALU_OP_4                 = 4'b1111, //10 received fourth ALU frame, waiting for ALU_out_valid
		     ALU_OP_RES               = 4'b1110, //11 received ALU_OUT, writing in FIFO... 		        (1 cycle)

		     ALU_NO_OP_1              = 4'b1010, //12 received first ALU_NO_OP frame, waiting for second
		     ALU_NO_OP_2              = 4'b1011, //13 received second ALU_NO_OP frame, waiting for ALU_out_valid
		     ALU_NO_OP_RES            = 4'b1001, //14 received ALU_OUT, writing in FIFO...                      (1 cycle)
		     RESULT_2		      = 4'b1000; //15 :this state for multiplication results i.e.writing the second byte of ALU result in the fifo

localparam [RF_ADDR-1:0] OPERAND_A=4'b0000;

localparam [RF_ADDR-1:0] OPERAND_B=4'b0001;

reg [DATA_WIDTH-1:0]	rf_data;
reg [RF_ADDR-1:0]	rf_addr;
reg [3:0]		alu_fun;

reg [3:0] CS,NS;
//the followin are signals that allow writing in the reg file only once every RX P_DATA : LC=last cycle
assign write      = (NS == IDLE && CS == REG_WR_3) ? 1:0;
assign write_A    = (NS == ALU_OP_2 && CS != ALU_OP_2) ? 1:0;
assign write_B    = (NS == ALU_OP_3 && CS != ALU_OP_3) ? 1:0;
assign fifo_data_ready  =( (NS == REG_RD_RES&&CS!=REG_RD_RES) || (NS == ALU_OP_RES&&CS!=ALU_OP_RES)|| (NS == ALU_NO_OP_RES&&CS!=ALU_NO_OP_RES) || (NS == RESULT_2&&CS!=RESULT_2))? 1:0;

assign rf_data_ready   =( (NS == REG_WR_3 && CS != REG_WR_3)||(NS == ALU_OP_2&&CS!=ALU_OP_2)||(NS == ALU_OP_3&&CS!=ALU_OP_3)  )? 1:0;
assign rf_addr_ready   =( (NS == REG_WR_2 && CS != REG_WR_2) || (NS==REG_RD_2 && CS!=REG_RD_2)  )? 1:0;

assign fun_ready   = ((NS == ALU_OP_4 && CS != ALU_OP_4) || (NS == ALU_NO_OP_2 && CS != ALU_NO_OP_2)) ? 1:0;

always@(posedge CLK or negedge RST)begin
if(!RST) rf_data<=0;
else if(rf_data_ready) rf_data<=RX_DATA;
else rf_data<=rf_data;
end
always@(posedge CLK or negedge RST)begin
if(!RST) rf_addr<=0;
else if(rf_addr_ready) rf_addr<=RX_DATA;
else rf_addr<=rf_addr;
end
always@(posedge CLK or negedge RST)begin
if(!RST) alu_fun<=0;
else if(fun_ready) alu_fun<=RX_DATA[3:0];
else alu_fun<=alu_fun;
end

always@(*)
begin

case(CS)

IDLE:begin

if(RX_valid)
begin
case(RX_DATA)
8'hAA:NS=REG_WR_1;
8'hBB:NS=REG_RD_1;
8'hCC:NS=ALU_OP_1;
8'hDD:NS=ALU_NO_OP_1;
default:NS=IDLE;
endcase
end

else NS=IDLE;

end


REG_WR_1:begin
if(RX_valid) NS=REG_WR_2;
else NS=REG_WR_1;
end

REG_WR_2:begin
if(RX_valid) NS=REG_WR_3;
else NS=REG_WR_2;
end

REG_WR_3: NS=IDLE;

//////////////////////////
REG_RD_1:begin

if(RX_valid) NS=REG_RD_2;
else NS=REG_RD_1;

end


REG_RD_2:begin

if(Reg_data_valid) NS=REG_RD_RES;
else NS=REG_RD_2;

end

REG_RD_RES:begin 

if(FIFO_FULL) NS=IDLE;
else NS = IDLE;

end

/////////////////////////////
ALU_OP_1:begin 
if (RX_valid) begin
			NS = ALU_OP_2;
	      end
else NS = ALU_OP_1;
	 end

ALU_OP_2:begin 
if (RX_valid) begin
			NS = ALU_OP_3;
	      end
else NS = ALU_OP_2;
	 end

ALU_OP_3:begin 
if (RX_valid) NS = ALU_OP_4;
else NS = ALU_OP_3;
	 end

ALU_OP_4:begin 
if (ALU_out_valid) NS = ALU_OP_RES;
else NS = ALU_OP_4;
	 end

ALU_OP_RES:begin  
		if(FIFO_FULL) NS=ALU_OP_RES;
		else if(ALU_FUN==4'b0010) NS = RESULT_2;
		else NS = IDLE;
	      end
//////////////////////////////////////////

ALU_NO_OP_1:begin  
if (RX_valid) begin
			NS = ALU_NO_OP_2;
	      end
else NS = ALU_NO_OP_1;
	    end
ALU_NO_OP_2:begin  
if (ALU_out_valid) begin
			 NS = ALU_NO_OP_RES;
	      end
else NS = ALU_NO_OP_2;
	    end
ALU_NO_OP_RES:begin  
		if(FIFO_FULL) NS=ALU_NO_OP_RES;
		else if(ALU_FUN==4'b0010) NS = RESULT_2;
		else NS = IDLE;
	    end
/////////////////////////////////////////
RESULT_2:begin  
		if(FIFO_FULL) NS=RESULT_2;
		else NS = IDLE;
	 end

endcase
end

//ouputttttt
always@(*)
begin
case (CS)
IDLE:   begin 

ALU_FUN				= 0;


FIFO_wr_inc			= 0;
FIFO_wr_data			= 0;

Reg_wr_en			= 0;
Reg_ADDR			= 0;
Reg_wr_data			= 0;
Reg_rd_en			= 0;
	end
//-------------------------------------------------------------------------

REG_WR_1:   begin 

ALU_FUN				= 0;


FIFO_wr_inc			= 0;
FIFO_wr_data			= 0;

Reg_wr_en			= write;
Reg_ADDR			= rf_addr;
Reg_wr_data			= rf_data;
Reg_rd_en			= 0;
	    end

REG_WR_2:   begin 

ALU_FUN				= 0;


FIFO_wr_inc			= 0;
FIFO_wr_data			= 0;

Reg_wr_en			= write;
Reg_ADDR			= rf_addr;
Reg_wr_data			= rf_data;
Reg_rd_en			= 0;
	    end

REG_WR_3:   begin 

ALU_FUN				= 0;


FIFO_wr_inc			= 0;
FIFO_wr_data			= 0;

Reg_wr_en			= write;
Reg_ADDR			= rf_addr;
Reg_wr_data			= rf_data;
Reg_rd_en			= 0;
	    end

//-------------------------------------------------------------------------
REG_RD_1:begin 

ALU_FUN				= 0;


FIFO_wr_inc			= 0;
FIFO_wr_data			= 0;

Reg_wr_en			= 0;
Reg_ADDR			= rf_addr;
Reg_wr_data			= 0;
Reg_rd_en			= 0;
	 end

REG_RD_2:begin 

ALU_FUN				= 0;


FIFO_wr_inc			= fifo_data_ready;
FIFO_wr_data			= rf_data;

Reg_wr_en			= 0;
Reg_ADDR			= rf_addr;
Reg_wr_data			= 0;
Reg_rd_en			= 1;
	 end

REG_RD_RES:begin 

ALU_FUN				= 0;


FIFO_wr_inc			= fifo_data_ready;
FIFO_wr_data			= rf_data;

Reg_wr_en			= 0;
Reg_ADDR			= rf_addr;
Reg_wr_data			= 0;
Reg_rd_en			= 1;
	 end

//-------------------------------------------------------------------------

ALU_OP_1:begin 

ALU_FUN				= 0;


FIFO_wr_inc			= 0;
FIFO_wr_data			= 0;

Reg_wr_en			= write_A;
Reg_ADDR			= OPERAND_A;
Reg_wr_data			= RX_DATA;
Reg_rd_en			= 0;
	 end

ALU_OP_2:begin 

ALU_FUN				= 0;


FIFO_wr_inc			= 0;
FIFO_wr_data			= 0;

Reg_wr_en			= write_B;
Reg_ADDR			= OPERAND_B;
Reg_wr_data			= RX_DATA;
Reg_rd_en			= 0;
	 end

ALU_OP_3:begin 

ALU_FUN				= alu_fun;


FIFO_wr_inc			= 0;
FIFO_wr_data			= 0;

Reg_wr_en			= 0;
Reg_ADDR			= 0;
Reg_wr_data			= 0;
Reg_rd_en			= 0;
	 end

ALU_OP_4:begin 

ALU_FUN				= alu_fun;


FIFO_wr_inc			= 0;
FIFO_wr_data			= 0;

Reg_wr_en			= 0;
Reg_ADDR			= 0;
Reg_wr_data			= 0;
Reg_rd_en			= 0;
	 end

ALU_OP_RES:begin 

ALU_FUN				= alu_fun;


FIFO_wr_inc			= 1;
FIFO_wr_data			= ALU_out[7:0];

Reg_wr_en			= 0;
Reg_ADDR			= 0;
Reg_wr_data			= 0;
Reg_rd_en			= 0;
	 end
//-------------------------------------------------------------------------
ALU_NO_OP_1:begin  

ALU_FUN				= alu_fun;


FIFO_wr_inc			= 0;
FIFO_wr_data			= 0;

Reg_wr_en			= 0;
Reg_ADDR			= 0;
Reg_wr_data			= 0;
Reg_rd_en			= 0;
	    end

ALU_NO_OP_2:begin  

ALU_FUN				= alu_fun;


FIFO_wr_inc			= 0;
FIFO_wr_data			= 0;

Reg_wr_en			= 0;
Reg_ADDR			= 0;
Reg_wr_data			= 0;
Reg_rd_en			= 0;
	    end

ALU_NO_OP_RES:begin  

ALU_FUN				= alu_fun;


FIFO_wr_inc			= 1;
FIFO_wr_data			= ALU_out[7:0];

Reg_wr_en			= 0;
Reg_ADDR			= 0;
Reg_wr_data			= 0;
Reg_rd_en			= 0;
	    end
//-------------------------------------------------------------------------
RESULT_2:begin  

ALU_FUN				= alu_fun;


FIFO_wr_inc			= 1;
FIFO_wr_data			= ALU_out[15:8];

Reg_wr_en			= 0;
Reg_ADDR			= 0;
Reg_wr_data			= 0;
Reg_rd_en			= 0;
	    end
//-------------------------------------------------------------------------

default: begin  

ALU_FUN				= 0;


FIFO_wr_inc			= 0;
FIFO_wr_data			= 0;

Reg_wr_en			= 0;
Reg_ADDR			= 0;
Reg_wr_data			= 0;
Reg_rd_en			= 0;
	 end
endcase
end
//a!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
always@(posedge CLK or negedge RST)
begin
if(!RST) CS<=IDLE;
else CS<=NS;
end

assign CLK_DIV_EN = 1;
assign ALU_en	   = ((CS==ALU_OP_4)||(CS==ALU_NO_OP_2)||(CS==ALU_NO_OP_RES)||(CS==ALU_OP_RES)||(CS==RESULT_2)) ? 1:0;
assign ALU_GATE_EN = ((CS[3]==1) || (CS==ALU_OP_1)) ? 1:0;

endmodule