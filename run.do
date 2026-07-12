vlib work
vlog RTL/*.v
vsim -voptargs=+accs work.SYSTEM_tb
do wave.do
run -all