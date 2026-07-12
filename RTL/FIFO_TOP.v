module FIFO_TOP  # (
    parameter ADDR_WIDTH = 3,
    parameter BUFFER_DEPTH = 8,
    parameter BUFFER_WIDTH = 8)
(
input wire 			w_CLK,
input wire 			r_CLK,
input wire  			w_RST,
input wire  			r_RST,

input wire  [BUFFER_WIDTH-1:0]  w_data,
input wire  			w_inc,
input wire  			r_inc,

output wire			w_full,
output wire			r_empty,
output wire  [BUFFER_WIDTH-1:0]  r_data
);
//________________________________________________________
wire 			 w_clk_en;
wire [ADDR_WIDTH-1:0]    w_addr;
wire [ADDR_WIDTH-1:0]    r_addr;
wire [ADDR_WIDTH:0]  w_ptr_grey;
wire [ADDR_WIDTH:0]  r_ptr_grey;
wire [ADDR_WIDTH:0]  w_ptr_grey_sync;
wire [ADDR_WIDTH:0]  r_ptr_grey_sync;
//________________________________________________________
FIFO_BUFFER #(.ADDR_WIDTH(ADDR_WIDTH),
	      .BUFFER_DEPTH(BUFFER_DEPTH),
	      .BUFFER_WIDTH(BUFFER_WIDTH)) U0_buffer (
.w_clk_en(w_clk_en),
.w_clk(w_CLK),
.w_address(w_addr),
.r_address(r_addr),
.w_data(w_data),
.w_rst(w_RST),
.r_data(r_data)
);
//________________________________________________________
FIFO_RD #(.ADDR_WIDTH(ADDR_WIDTH)) U0_read (
.r_CLK(r_CLK),
.r_RST(r_RST),
.r_inc(r_inc),
.w_ptr(w_ptr_grey_sync),
.r_empty(r_empty),
.r_ptr_grey(r_ptr_grey),
.r_addr(r_addr)
);
//________________________________________________________
FIFO_WR #(.ADDR_WIDTH(ADDR_WIDTH)) U0_write (
.w_CLK(w_CLK),
.w_RST(w_RST),
.w_inc(w_inc),
.r_ptr(r_ptr_grey_sync),
.w_full(w_full),
.w_ptr_grey(w_ptr_grey),
.w_addr(w_addr),
.w_clk_en(w_clk_en)
);
//________________________________________________________
FIFO_DFF #(.ptr_width(ADDR_WIDTH+1)) U0_w2r (
.ptr(w_ptr_grey),
.CLK(r_CLK),
.RST(r_RST),
.sync_ptr(w_ptr_grey_sync)
);
//________________________________________________________
FIFO_DFF #(.ptr_width(ADDR_WIDTH+1)) U1_r2w (
.ptr(r_ptr_grey),
.CLK(w_CLK),
.RST(w_RST),
.sync_ptr(r_ptr_grey_sync)
);
//________________________________________________________
endmodule
