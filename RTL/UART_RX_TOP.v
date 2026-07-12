
module UART_RX  
(
 input   wire                         CLK,
 input   wire                         RST,
 input   wire    		      RX_IN,
 input   wire                         PARITY_EN,
 input   wire                         PARITY_TYPE,
 input   wire    [5:0]    	      PRESCALE, 
 output  wire    [7:0]     	      P_DATA,
 output  wire                         DATA_VALID,

 output  wire                         stop_err,
 output  wire                         par_err

 );
 wire 				      par_chk_en,strt_chk_en,stop_chk_en,strt_err,PAR_err,STOP_err;
 wire 			 	      sampled_bit,deser_en,cnt_en,sampler_en,bit_done,bit_over,even_parity,odd_parity;
 wire   	 [4:0]  	      edge_cnt;
 wire   	 [3:0]  	      bit_cnt;
 wire				      data_done;	
//_______________________________________________________________________

// FSM
UART_RX_FSM  U0_rx_fsm (
.CLK(CLK),
.RST(RST),

.RX_IN(RX_IN), 
.PARITY_EN(PARITY_EN),

.par_err(PAR_err),
.strt_err(strt_err),
.stop_err(STOP_err),
.data_done(data_done),
.bit_cnt(bit_cnt),
.edge_cnt(edge_cnt),
.par_chk_en(par_chk_en),
.strt_chk_en(strt_chk_en),
.stop_chk_en(stop_chk_en),
.bit_over(bit_over),
.DATA_VALID(DATA_VALID), 
.bit_done(bit_done),
.deser_en(deser_en),
.sampler_en(sampler_en),
.cnt_en(cnt_en)
);
//_______________________________________________________________________

// PARITY CHECK

PARITY_CHECKER U0_parity_checker (
.CLK(CLK),
.RST(RST),

.par_chk_en(par_chk_en),
.sampled_bit(sampled_bit),
.bit_done(bit_done),
.par_err(PAR_err),
.PAR_err(par_err),
.even_parity(even_parity),
.odd_parity(odd_parity),
.bit_cnt(bit_cnt),
.PARITY_TYPE(PARITY_TYPE) 
);
//_______________________________________________________________________

// START CHECK

START_CHECKER U0_start_checker (
.CLK(CLK),
.RST(RST),
.bit_done(bit_done),
.strt_chk_en(strt_chk_en),
.sampled_bit(sampled_bit),

.strt_err(strt_err)
);
//_______________________________________________________________________

// STOP CHECK

STOP_CHECKER U0_stop_checker (
.CLK(CLK),
.RST(RST),

.stop_chk_en(stop_chk_en),
.sampled_bit(sampled_bit),
.bit_done(bit_done),
.stop_err(STOP_err),
.STOP_err(stop_err)
);
//_______________________________________________________________________

// DATA SAMPLER

DATA_SAMPLER U0_data_sampler(
.CLK(CLK),
.RST(RST),

.RX_IN(RX_IN),
.edge_cnt(edge_cnt),
.sampler_en(sampler_en),
.sampled_bit(sampled_bit),
.PRESCALE(PRESCALE)
);
//_______________________________________________________________________

// DESERIALIZER

DESERIALIZER  U0_deserializer(
.CLK(CLK),
.RST(RST),
.bit_done(bit_done),
.bit_cnt(bit_cnt),
.sampled_bit(sampled_bit),
.deser_en(deser_en),
.PARITY_EN(PARITY_EN),
.even_parity(even_parity),
.odd_parity(odd_parity),
.P_DATA(P_DATA)
);
//_______________________________________________________________________

// EDGE/BIT COUNTER

EDGE_BIT_COUNTER U0_edge_bit_counter (
.CLK(CLK),
.PRESCALE(PRESCALE),
.edge_cnt(edge_cnt),
.deser_en(deser_en),
.bit_cnt(bit_cnt),
.bit_done(bit_done),
.bit_over(bit_over),
.data_done(data_done),
.cnt_en(cnt_en)
);

endmodule

//_________________________________ E O F ________________________________


















