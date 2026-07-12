module DATA_SYNC #(parameter NUM_STAGES=2,BUS_WIDTH=8)(

input wire CLK, 
input wire RST,
input wire [BUS_WIDTH-1:0] unsync_bus,
input wire bus_enable,

output reg [BUS_WIDTH-1:0] sync_bus,
output reg enable_pulse

);
//__________________________________________
reg [NUM_STAGES-1:0] MFF;
reg pulse_reg;
reg [BUS_WIDTH-1:0] sync_bus_c;
wire pulse;

//__________________________________________
genvar i;
for (i=0;i<NUM_STAGES;i=i+1)
begin
always@(posedge CLK or negedge RST)
begin
if(!RST)
MFF[i]<=0;
else
	begin
	if(i==NUM_STAGES-1)
	MFF[i]<=bus_enable;
	else MFF[i]<=MFF[i+1];
	end
end
end
//__________________________________________
always@(posedge CLK or negedge RST)
begin
if(!RST)
pulse_reg<=0;
else
pulse_reg<=MFF[0];
end
//__________________________________________
assign pulse = (!pulse_reg&MFF[0]);
//__________________________________________
always@(*)
begin 
if(pulse)
sync_bus_c=unsync_bus;
else
sync_bus_c=sync_bus;
end
//__________________________________________
always@(posedge CLK or negedge RST)
begin
if(!RST)
sync_bus<=0;
else
sync_bus<=sync_bus_c;
end
//__________________________________________
always@(posedge CLK or negedge RST)
begin
if(!RST)
enable_pulse<=0;
else
enable_pulse<=pulse;
end

//__________________________________________
endmodule
