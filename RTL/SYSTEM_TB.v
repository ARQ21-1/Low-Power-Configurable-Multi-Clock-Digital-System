`timescale 1ns/1fs


module SYSTEM_tb();

parameter REF_P = 20;
parameter UART_P = 271.26736;
parameter TX_CLK_PERIOD = 8680;    //115.2 KHz

/////////////////////////////////////////////////////////
//////////////////// DUT Signals ////////////////////////
/////////////////////////////////////////////////////////

reg 			RST_N_TB;
reg 			UART_CLK_TB;
reg			REF_CLK_TB;
reg			UART_RX_IN_TB;

wire			UART_TX_O_TB;
wire			parity_error_TB;
wire   			framing_error_TB;


////////////////////////////////////////////////////////
///////////////////// Clock Generator //////////////////
////////////////////////////////////////////////////////
// Write clock generation (100 MHz)
always #10 REF_CLK_TB = ~REF_CLK_TB;  // Period = 20 ns

// Read clock generation (3.6864 MHz)
always #135.6336806 UART_CLK_TB = ~UART_CLK_TB;  // Period = 271.26736 ns half is 135.6336806 ns

initial
begin

//initializing inputs
init();

//resetting 
reset();
#(TX_CLK_PERIOD*5);
$display("Test Case %0d : checking initial RX frequency before anything",0);
freq(TX_CLK_PERIOD,0);
$display("Test Case %0d : writing 2 in ADDRESS F of reg file",1);
send(8'hAA);//write
send(8'h0F);//write in ADDRESS F of reg file
send(8'h02);//write 2 in that ADDRESS
print_Reg();
$display("Test Case %0d : reading data in ADDRESS F of reg file",2);
send(8'hBB);//read
send(8'h0F);//read in ADDRESS F of reg file
check_tx(8'h02,2);
$display("Test Case %0d : ADDING 5 and 6",3);
send(8'hCC);//ALU  with OP
send(8'h05);// A = 5
send(8'h06);// B = 6 
send(8'h00);// ALU FUN ADD
check_tx(8'h0B,3);
$display("Test Case %0d : MULTIPLYING 64 and 7",4);
send(8'hCC);//ALU  with OP with 2 bytes of results
send(8'h40);// A = 64
send(8'h07);// B = 7
send(8'h02);// ALU FUN mul
check_tx(8'hC0,41);
check_tx(8'h01,42);
$display("Test Case %0d : SUBTRACTING B FROM A (A=64,B=7)",5);
send(8'hDD);//ALU - NO OP
send(8'h01);// ALU FUN subtract
check_tx(8'h39,5);
$display("Test Case %0d : changing UART config to : 100000_01 (prescale = 32,config-register=regArr[2])",6);
send(8'hAA);//write
send(8'h02);//write in ADDRESS 2 of reg file ((UART CONFIG))
send(8'h81);//write 100000_01 in that ADDRESS i.e. PRESCALE =32 (it was 16 before)
print_Reg();
freq(TX_CLK_PERIOD,6);
$display("Test Case %0d : reading data in ADDRESS 2 of reg file (new UART config)",7);
send(8'hBB);//read
send(8'h02);//read in ADDRESS 2 of reg file ((UART CONFIG))
check_tx(8'h81,7);
//check_freq_rx();
$display("Test Case %0d : MULTIPLYING 64 and 7 (A=65,B=7)",8);
send(8'hCC);//ALU  with OP with 2 bytes of results
send(8'h41);// A = 65
send(8'h07);// B = 7
send(8'h02);// ALU FUN mul
check_tx(8'hC7,81);
check_tx(8'h01,82);
$display("Test Case %0d : SUBTRACTING B FROM A (A=65,B=7)",9);
send(8'hDD);//ALU - NO OP
send(8'h01);// ALU FUN subtract
check_tx(8'h3A,9);

$display("Test Case %0d : MULTIPLYING 7 and 4 (A=7,B=4)",10);
send(8'hCC);//ALU  with OP with 1 bytes of results
send(8'h07);// A = 7
send(8'h04);// B = 4
send(8'h02);// ALU FUN mul
check_tx(8'h1C,10);
$display("Test Case %0d : SHIFTING A RIGHT (A=7,B=4)",11);
send(8'hDD);//ALU  with OP with 1 bytes of results
send(8'h0D);// shift right
check_tx(8'h03,11);

#(TX_CLK_PERIOD*15); $stop;
end


////////////////////////////////////////////////////////
////////////////////// TASKS /////////////////////////// 
////////////////////////////////////////////////////////

///init
task init ;
  begin
RST_N_TB=1;
UART_CLK_TB=1;
REF_CLK_TB=1;
UART_RX_IN_TB=1;
  end
endtask


//reset
task reset;
 begin
#REF_P 
RST_N_TB=0;
#REF_P 
RST_N_TB=1;
#REF_P;
 end
endtask

/////////////////////// Data IN /////////////////////////
task send ;
 input  [7:0]  DATA ;

 integer   i  ;
 
 begin
	
	@ (posedge DUT.UART_TX_CLK)  
	UART_RX_IN_TB <= 1'b0 ;              // start_bit

	for(i=0; i<8; i=i+1)
		begin
		@(posedge DUT.UART_TX_CLK) 		
		UART_RX_IN_TB <= DATA[i] ;       // data bits
		end 

	if(DUT.U0_UART.parity_enable)
		begin
			@ (posedge DUT.UART_TX_CLK) 
			case(DUT.U0_UART.parity_type)
			1'b0 : UART_RX_IN_TB <= ^DATA  ;     // Even Parity
			1'b1 : UART_RX_IN_TB <= ~^DATA ;     // Odd Parity
			endcase	
		end
	
	@ (posedge DUT.UART_TX_CLK) 
	UART_RX_IN_TB <= 1'b1 ;              // stop_bit
	#TX_CLK_PERIOD;
 end
endtask


//////////////////  Check Output  ////////////////////
task check_tx ;
 input  		[7:0]  		DATA    ;
 input  integer	                        Test_NUM;
 
 reg    [10:0]  gener_out ,expec_out;     //longest frame = 11 bits (1-start,1-stop,8-data,1-parity)
 reg            parity_bit;
 
 integer   i  ;

 begin
 
	@(posedge DUT.UART_TX_Busy)
	for(i=0; i<11; i=i+1)
		begin
		@(negedge DUT.UART_TX_CLK) gener_out[i] = DUT.UART_TX_O ;
		end
		
    if(DUT.UART_Config[0])
		if(DUT.UART_Config[1])
			parity_bit = ~^DATA ;
		else
			parity_bit = ^DATA ;
	else
			parity_bit = 1'b1 ;	
	
    if(DUT.UART_Config[0])
		expec_out = {1'b1,parity_bit,DATA,1'b0} ;
	else
		expec_out = {1'b1,1'b1,DATA,1'b0} ;
			
	if(gener_out == expec_out) 
		begin
			$display("Test Case %0d is succeeded result is indeed :%0h",Test_NUM,DATA);
		end
	else
		begin
			$display("Test Case %0d is failed result is not :%0h but frame is %0b : ", Test_NUM,DATA,gener_out);
		end
 end
endtask

//////////////////  Check REG-FILE  ////////////////////
    task print_Reg;
        integer i;
        begin
            $display("Printing regArr memory array:");
            $display("-----------------------------");
            for (i = 0; i < 16; i = i + 1) begin
                $display("regArr[%0d] = %h", i, DUT.U0_RegFile.regArr[i]);
            end
            $display("-----------------------------");
        end
    endtask

///////////////////////check RX freq///////////////////////////
task freq;
    input real how_long; // timein periods
   input integer op_num;
		real count,start_time,freq;
    begin
#(10*UART_P);
      count = 0;

@(posedge DUT.UART_RX_CLK) start_time = $time;
     
      while ($time < start_time + how_long) 
      begin
        @(posedge DUT.UART_RX_CLK);
        count = count + 1;
      end
      freq= count*(1_000)/how_long ; // frequency in MHz
	$display("test case number %0d : the output frequency is around %f MHz",op_num,freq);
    end
  endtask
///////////////// Design Instaniation //////////////////
SYS_TOP DUT (

.RST_N(RST_N_TB),
.UART_CLK(UART_CLK_TB),
.REF_CLK(REF_CLK_TB),
.UART_RX_IN(UART_RX_IN_TB),

.UART_TX_O(UART_TX_O_TB),
.parity_error(parity_error_TB),
.framing_error(framing_error_TB)

);
endmodule