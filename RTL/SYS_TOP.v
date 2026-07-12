
module SYS_TOP # ( parameter DATA_WIDTH = 8 ,  RF_ADDR = 4 )

(
 input   wire                          RST_N,
 input   wire                          UART_CLK,
 input   wire                          REF_CLK,
 input   wire                          UART_RX_IN,
 output  wire                          UART_TX_O,
 output  wire                          parity_error,
 output  wire                          framing_error
);


wire                                   SYNC_UART_RST,
                                       SYNC_REF_RST;
									   
wire					               UART_TX_CLK;
wire					               UART_RX_CLK;


wire      [DATA_WIDTH-1:0]             Operand_A,
                                       Operand_B,
									   UART_Config,
									   DIV_RATIO;
									   
wire      [DATA_WIDTH-1:0]             DIV_RATIO_RX;
									   
wire      [DATA_WIDTH-1:0]             UART_RX_OUT;
wire         						   UART_RX_V_OUT;
wire      [DATA_WIDTH-1:0]			   UART_RX_SYNC;
wire                                   UART_RX_V_SYNC;

wire      [DATA_WIDTH-1:0]             UART_TX_IN;
wire        						   UART_TX_VLD;
wire      [DATA_WIDTH-1:0]             UART_TX_SYNC;
wire        						   UART_TX_V_SYNC;

wire                                   UART_TX_Busy;	
wire                                   UART_TX_Busy_PULSE;	
									   
wire                                   RF_WrEn;
wire                                   RF_RdEn;
wire      [RF_ADDR-1:0]                RF_Address;
wire      [DATA_WIDTH-1:0]             RF_WrData;
wire      [DATA_WIDTH-1:0]             RF_RdData;
wire                                   RF_RdData_VLD;									   

wire                                   CLKG_EN;
wire                                   ALU_EN;
wire      [3:0]                        ALU_FUN; 
wire      [DATA_WIDTH*2-1:0]           ALU_OUT;
wire                                   ALU_OUT_VLD; 
									   
wire                                   ALU_CLK ;								   

wire                                   FIFO_FULL ;
	
wire                                   CLKDIV_EN ;
								   
///********************************************************///
//////////////////// Reset synchronizers /////////////////////
///********************************************************///

RST_SYNC # (.NUM_STAGES(2)) U0_RST_SYNC (
.RST(RST_N),
.CLK(UART_CLK),
.SYNC_RST(SYNC_UART_RST)

);

RST_SYNC # (.NUM_STAGES(2)) U1_RST_SYNC (
.RST(RST_N),
.CLK(REF_CLK),
.SYNC_RST(SYNC_REF_RST)
);

///********************************************************///
////////////////////// Data Synchronizer /////////////////////
///********************************************************///

DATA_SYNC # (.NUM_STAGES(2) , .BUS_WIDTH(8)) U0_ref_sync (
.CLK(REF_CLK),
.RST(SYNC_REF_RST),
.unsync_bus(UART_RX_OUT),
.bus_enable(UART_RX_V_OUT),
.sync_bus(UART_RX_SYNC),
.enable_pulse(UART_RX_V_SYNC)


);

///********************************************************///
///////////////////////// Async FIFO /////////////////////////
///********************************************************///

FIFO_TOP #(.BUFFER_WIDTH(DATA_WIDTH) , .ADDR_WIDTH(3)  , .BUFFER_DEPTH(8)) U0_UART_FIFO (
.w_CLK(REF_CLK),
.w_RST(SYNC_REF_RST),  
.w_inc(UART_TX_VLD),
.w_data(UART_TX_IN),             
.r_CLK(UART_TX_CLK),              
.r_RST(SYNC_UART_RST),              
.r_inc(UART_TX_Busy_PULSE),              
.r_data(UART_TX_SYNC),             
.w_full(FIFO_FULL),               
.r_empty(UART_TX_V_SYNC)  
            
);

///********************************************************///
//////////////////////// Pulse Generator /////////////////////
///********************************************************///

PULSE_GEN U0_PULSE_GEN (
.clk(UART_TX_CLK),
.rst(SYNC_UART_RST),
.lvl_sig(UART_TX_Busy),
.pulse_sig(UART_TX_Busy_PULSE)
);

///********************************************************///
//////////// Clock Divider for UART_TX Clock /////////////////
///********************************************************///

clk_div U0_ClkDiv (
.i_ref_clk(UART_CLK),             
.i_rst_n(SYNC_UART_RST),                 
.i_clk_en(CLKDIV_EN),               
.i_div_ratio(DIV_RATIO),           
.o_div_clk(UART_TX_CLK)     
       
);

///********************************************************///
/////////////////////// Custom Mux Clock /////////////////////
///********************************************************///

CLKDIV_MUX U0_CLKDIV_MUX (
.IN(UART_Config[7:2]),
.OUT(DIV_RATIO_RX)
);

///********************************************************///
//////////// Clock Divider for UART_RX Clock /////////////////
///********************************************************///

clk_div U1_ClkDiv (
.i_ref_clk(UART_CLK),             
.i_rst_n(SYNC_UART_RST),                 
.i_clk_en(CLKDIV_EN),               
.i_div_ratio(DIV_RATIO_RX),           
.o_div_clk(UART_RX_CLK)             
);

///********************************************************///
/////////////////////////// UART /////////////////////////////
///********************************************************///

UART  U0_UART (
.RST(SYNC_UART_RST),
.TX_CLK(UART_TX_CLK),
.RX_CLK(UART_RX_CLK),
.parity_enable(UART_Config[0]),
.parity_type(UART_Config[1]),
.Prescale(UART_Config[7:2]),
.RX_IN_S(UART_RX_IN),
.RX_OUT_P(UART_RX_OUT),                      
.RX_OUT_V(UART_RX_V_OUT),                      
.TX_IN_P(UART_TX_SYNC), 
.TX_IN_V(!UART_TX_V_SYNC), 
.TX_OUT_S(UART_TX_O),
.TX_OUT_V(UART_TX_Busy),
.parity_error(parity_error),
.framing_error(framing_error)                  
);

///********************************************************///
//////////////////// System Controller ///////////////////////
///********************************************************///

SYS_CTRL U0_SYS_CTRL (
.CLK(REF_CLK),
.RST(SYNC_REF_RST),

.Reg_rd_data(RF_RdData),
.Reg_data_valid(RF_RdData_VLD),
.Reg_wr_en(RF_WrEn),
.Reg_rd_en(RF_RdEn),
.Reg_ADDR(RF_Address),
.Reg_wr_data(RF_WrData),

.ALU_en(ALU_EN),
.ALU_FUN(ALU_FUN), 
.ALU_out(ALU_OUT),
.ALU_out_valid(ALU_OUT_VLD),  
.ALU_GATE_EN(CLKG_EN), 
.CLK_DIV_EN(CLKDIV_EN),   

.FIFO_FULL(FIFO_FULL),
.RX_DATA(UART_RX_SYNC), 
.RX_valid(UART_RX_V_SYNC),
.FIFO_wr_data(UART_TX_IN), 
.FIFO_wr_inc(UART_TX_VLD)
);

///********************************************************///
/////////////////////// Register File ////////////////////////
///********************************************************///

RegFile U0_RegFile (
.CLK(REF_CLK),
.RST(SYNC_REF_RST),
.WrEn(RF_WrEn),
.RdEn(RF_RdEn),
.Address(RF_Address),
.WrData(RF_WrData),
.RdData(RF_RdData),
.RdData_VLD(RF_RdData_VLD),
.REG0(Operand_A),
.REG1(Operand_B),
.REG2(UART_Config),
.REG3(DIV_RATIO)
);

///********************************************************///
//////////////////////////// ALU /////////////////////////////
///********************************************************///
 
ALU U0_ALU (
.CLK(ALU_CLK),
.RST(SYNC_REF_RST),  
.A(Operand_A), 
.B(Operand_B),
.EN(ALU_EN),
.ALU_FUN(ALU_FUN),
.ALU_OUT(ALU_OUT),
.OUT_VALID(ALU_OUT_VLD)
);

///********************************************************///
///////////////////////// Clock Gating ///////////////////////
///********************************************************///

CLK_GATE U0_CLK_GATE (
.CLK_EN(CLKG_EN),
.CLK(REF_CLK),
.GATED_CLK(ALU_CLK)
);


endmodule
 