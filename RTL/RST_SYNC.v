module RST_SYNC #(parameter NUM_STAGES = 2)(
input wire RST ,
input wire CLK ,
output wire SYNC_RST
);

reg [NUM_STAGES-1:0] REG;

 always @(posedge CLK or negedge RST) begin
        if (!RST)
            REG <= {NUM_STAGES{1'b0}};
        else
            REG <= {1'b1,REG[NUM_STAGES-1:1]};
    end


assign SYNC_RST = REG[0];

endmodule
