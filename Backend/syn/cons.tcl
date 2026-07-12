
# Constraints
# ----------------------------------------------------------------------------
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

set r_CLK_NAME MASTER_CLK
set r_CLK_PER 20
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1
set CLK_LAT 0
set CLK_RISE 0.05
set CLK_FALL 0.05

set u_CLK_NAME U_CLK
set u_CLK_PER 271.26736

set TX_CLK_PER [expr $u_CLK_PER * 32]
set RX_CLK_PER [expr $u_CLK_PER * 1]
set ALU_CLK_PER [expr $r_CLK_PER * 1]


create_clock -name $r_CLK_NAME -period $r_CLK_PER -waveform "0 [expr $r_CLK_PER/2]" [get_port REF_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clock $r_CLK_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clock $r_CLK_NAME]


create_clock -name $u_CLK_NAME -period $u_CLK_PER -waveform "0 [expr $u_CLK_PER/2]" [get_port UART_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clock $u_CLK_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clock $u_CLK_NAME]



create_generated_clock -master_clock $r_CLK_NAME -source [get_port REF_CLK] \
                       -name "ALU_CLK" [get_port U0_CLK_GATE/GATED_CLK] \
                       -divide_by 1
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clock ALU_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clock ALU_CLK]



create_generated_clock -master_clock $u_CLK_NAME -source [get_port UART_CLK] \
                       -name "UART_RX_CLK" [get_port U1_ClkDiv/o_div_clk] \
                       -divide_by 1
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clock ALU_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clock ALU_CLK]



create_generated_clock -master_clock $u_CLK_NAME -source [get_port UART_CLK] \
                       -name "UART_TX_CLK" [get_port U0_ClkDiv/o_div_clk] \
                       -divide_by 32
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clock ALU_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clock ALU_CLK]


					  
set_dont_touch_network [get_clocks {MASTER_CLK ALU_CLK U_CLK UART_RX_CLK UART_TX_CLK}]
####################################################################################
           #########################################################
                  #### Section 2 : Clocks Relationships ####
           #########################################################
####################################################################################
set_clock_groups -asynchronous -group [get_clocks {MASTER_CLK ALU_CLK}] -group [get_clocks {U_CLK UART_RX_CLK UART_TX_CLK}]

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################

set in_delay  [expr 0.2*$r_CLK_PER]
set out_delay [expr 0.2*$r_CLK_PER]

set in_delayTX  [expr 0.2*$TX_CLK_PER]
set out_delayTX [expr 0.2*$TX_CLK_PER]

set in_delayRX  [expr 0.2*$RX_CLK_PER]
set out_delayRX [expr 0.2*$RX_CLK_PER]

#Constrain Input Paths
set_input_delay $in_delayRX -clock UART_RX_CLK [get_ports {UART_RX_IN}]
#Constrain Output Paths
set_output_delay $out_delayRX -clock UART_RX_CLK [get_ports {parity_error framing_error}]

#Constrain Output Paths
set_output_delay $out_delayTX -clock UART_TX_CLK [get_ports {UART_TX_O}]
####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports {REF_CLK UART_CLK UART_RX_IN RST_N}] 

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################
set_load 0.1 [get_ports {UART_TX_O parity_error framing_error}]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis
set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################


####################################################################################
           #########################################################
                  #### Section 8 : multicycle path ####
           #########################################################
####################################################################################


