/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 16 03:14:57 2024
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \REG[1] ;

  DFFRQX2M \REG_reg[0]  ( .D(\REG[1] ), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  DFFRQX2M \REG_reg[1]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\REG[1] ) );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \REG[1] ;

  DFFRQX2M \REG_reg[0]  ( .D(\REG[1] ), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  DFFRQX2M \REG_reg[1]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\REG[1] ) );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 ( CLK, RST, unsync_bus, bus_enable, 
        sync_bus, enable_pulse );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse;
  wire   pulse_reg, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] MFF;

  DFFRQX2M pulse_reg_reg ( .D(MFF[0]), .CK(CLK), .RN(RST), .Q(pulse_reg) );
  DFFRQX2M \MFF_reg[0]  ( .D(MFF[1]), .CK(CLK), .RN(RST), .Q(MFF[0]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \MFF_reg[1]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(MFF[1]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(pulse_reg), .B(MFF[0]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module FIFO_BUFFER_ADDR_WIDTH3_BUFFER_DEPTH8_BUFFER_WIDTH8 ( w_clk_en, w_clk, 
        w_rst, w_address, r_address, w_data, r_data );
  input [2:0] w_address;
  input [2:0] r_address;
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk_en, w_clk, w_rst;
  wire   N10, N11, N12, N13, N14, N15, \memory[7][7] , \memory[7][6] ,
         \memory[7][5] , \memory[7][4] , \memory[7][3] , \memory[7][2] ,
         \memory[7][1] , \memory[7][0] , \memory[6][7] , \memory[6][6] ,
         \memory[6][5] , \memory[6][4] , \memory[6][3] , \memory[6][2] ,
         \memory[6][1] , \memory[6][0] , \memory[5][7] , \memory[5][6] ,
         \memory[5][5] , \memory[5][4] , \memory[5][3] , \memory[5][2] ,
         \memory[5][1] , \memory[5][0] , \memory[4][7] , \memory[4][6] ,
         \memory[4][5] , \memory[4][4] , \memory[4][3] , \memory[4][2] ,
         \memory[4][1] , \memory[4][0] , \memory[3][7] , \memory[3][6] ,
         \memory[3][5] , \memory[3][4] , \memory[3][3] , \memory[3][2] ,
         \memory[3][1] , \memory[3][0] , \memory[2][7] , \memory[2][6] ,
         \memory[2][5] , \memory[2][4] , \memory[2][3] , \memory[2][2] ,
         \memory[2][1] , \memory[2][0] , \memory[1][7] , \memory[1][6] ,
         \memory[1][5] , \memory[1][4] , \memory[1][3] , \memory[1][2] ,
         \memory[1][1] , \memory[1][0] , \memory[0][7] , \memory[0][6] ,
         \memory[0][5] , \memory[0][4] , \memory[0][3] , \memory[0][2] ,
         \memory[0][1] , \memory[0][0] , N18, N19, N20, N21, N22, N23, N24,
         N25, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n15, n17,
         n18, n19, n20, n21, n22, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n11,
         n16, n23, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133;
  assign N10 = w_address[0];
  assign N11 = w_address[1];
  assign N12 = w_address[2];
  assign N13 = r_address[0];
  assign N14 = r_address[1];
  assign N15 = r_address[2];

  DFFRQX2M \memory_reg[5][7]  ( .D(n71), .CK(w_clk), .RN(n127), .Q(
        \memory[5][7] ) );
  DFFRQX2M \memory_reg[5][6]  ( .D(n70), .CK(w_clk), .RN(n127), .Q(
        \memory[5][6] ) );
  DFFRQX2M \memory_reg[5][5]  ( .D(n69), .CK(w_clk), .RN(n127), .Q(
        \memory[5][5] ) );
  DFFRQX2M \memory_reg[5][4]  ( .D(n68), .CK(w_clk), .RN(n127), .Q(
        \memory[5][4] ) );
  DFFRQX2M \memory_reg[5][3]  ( .D(n67), .CK(w_clk), .RN(n127), .Q(
        \memory[5][3] ) );
  DFFRQX2M \memory_reg[5][2]  ( .D(n66), .CK(w_clk), .RN(n127), .Q(
        \memory[5][2] ) );
  DFFRQX2M \memory_reg[5][1]  ( .D(n65), .CK(w_clk), .RN(n127), .Q(
        \memory[5][1] ) );
  DFFRQX2M \memory_reg[5][0]  ( .D(n64), .CK(w_clk), .RN(n127), .Q(
        \memory[5][0] ) );
  DFFRQX2M \memory_reg[1][7]  ( .D(n39), .CK(w_clk), .RN(n129), .Q(
        \memory[1][7] ) );
  DFFRQX2M \memory_reg[1][6]  ( .D(n38), .CK(w_clk), .RN(n129), .Q(
        \memory[1][6] ) );
  DFFRQX2M \memory_reg[1][5]  ( .D(n37), .CK(w_clk), .RN(n129), .Q(
        \memory[1][5] ) );
  DFFRQX2M \memory_reg[1][4]  ( .D(n36), .CK(w_clk), .RN(n129), .Q(
        \memory[1][4] ) );
  DFFRQX2M \memory_reg[1][3]  ( .D(n35), .CK(w_clk), .RN(n130), .Q(
        \memory[1][3] ) );
  DFFRQX2M \memory_reg[1][2]  ( .D(n34), .CK(w_clk), .RN(n130), .Q(
        \memory[1][2] ) );
  DFFRQX2M \memory_reg[1][1]  ( .D(n33), .CK(w_clk), .RN(n130), .Q(
        \memory[1][1] ) );
  DFFRQX2M \memory_reg[1][0]  ( .D(n32), .CK(w_clk), .RN(n130), .Q(
        \memory[1][0] ) );
  DFFRQX2M \memory_reg[7][7]  ( .D(n87), .CK(w_clk), .RN(n126), .Q(
        \memory[7][7] ) );
  DFFRQX2M \memory_reg[7][6]  ( .D(n86), .CK(w_clk), .RN(n126), .Q(
        \memory[7][6] ) );
  DFFRQX2M \memory_reg[7][5]  ( .D(n85), .CK(w_clk), .RN(n126), .Q(
        \memory[7][5] ) );
  DFFRQX2M \memory_reg[7][4]  ( .D(n84), .CK(w_clk), .RN(n126), .Q(
        \memory[7][4] ) );
  DFFRQX2M \memory_reg[7][3]  ( .D(n83), .CK(w_clk), .RN(n126), .Q(
        \memory[7][3] ) );
  DFFRQX2M \memory_reg[7][2]  ( .D(n82), .CK(w_clk), .RN(n126), .Q(
        \memory[7][2] ) );
  DFFRQX2M \memory_reg[7][1]  ( .D(n81), .CK(w_clk), .RN(n126), .Q(
        \memory[7][1] ) );
  DFFRQX2M \memory_reg[7][0]  ( .D(n80), .CK(w_clk), .RN(n126), .Q(
        \memory[7][0] ) );
  DFFRQX2M \memory_reg[3][7]  ( .D(n55), .CK(w_clk), .RN(n128), .Q(
        \memory[3][7] ) );
  DFFRQX2M \memory_reg[3][6]  ( .D(n54), .CK(w_clk), .RN(n128), .Q(
        \memory[3][6] ) );
  DFFRQX2M \memory_reg[3][5]  ( .D(n53), .CK(w_clk), .RN(n128), .Q(
        \memory[3][5] ) );
  DFFRQX2M \memory_reg[3][4]  ( .D(n52), .CK(w_clk), .RN(n128), .Q(
        \memory[3][4] ) );
  DFFRQX2M \memory_reg[3][3]  ( .D(n51), .CK(w_clk), .RN(n128), .Q(
        \memory[3][3] ) );
  DFFRQX2M \memory_reg[3][2]  ( .D(n50), .CK(w_clk), .RN(n128), .Q(
        \memory[3][2] ) );
  DFFRQX2M \memory_reg[3][1]  ( .D(n49), .CK(w_clk), .RN(n128), .Q(
        \memory[3][1] ) );
  DFFRQX2M \memory_reg[3][0]  ( .D(n48), .CK(w_clk), .RN(n129), .Q(
        \memory[3][0] ) );
  DFFRQX2M \memory_reg[6][7]  ( .D(n79), .CK(w_clk), .RN(n126), .Q(
        \memory[6][7] ) );
  DFFRQX2M \memory_reg[6][6]  ( .D(n78), .CK(w_clk), .RN(n126), .Q(
        \memory[6][6] ) );
  DFFRQX2M \memory_reg[6][5]  ( .D(n77), .CK(w_clk), .RN(n126), .Q(
        \memory[6][5] ) );
  DFFRQX2M \memory_reg[6][4]  ( .D(n76), .CK(w_clk), .RN(n126), .Q(
        \memory[6][4] ) );
  DFFRQX2M \memory_reg[6][3]  ( .D(n75), .CK(w_clk), .RN(n126), .Q(
        \memory[6][3] ) );
  DFFRQX2M \memory_reg[6][2]  ( .D(n74), .CK(w_clk), .RN(n127), .Q(
        \memory[6][2] ) );
  DFFRQX2M \memory_reg[6][1]  ( .D(n73), .CK(w_clk), .RN(n127), .Q(
        \memory[6][1] ) );
  DFFRQX2M \memory_reg[6][0]  ( .D(n72), .CK(w_clk), .RN(n127), .Q(
        \memory[6][0] ) );
  DFFRQX2M \memory_reg[2][7]  ( .D(n47), .CK(w_clk), .RN(n129), .Q(
        \memory[2][7] ) );
  DFFRQX2M \memory_reg[2][6]  ( .D(n46), .CK(w_clk), .RN(n129), .Q(
        \memory[2][6] ) );
  DFFRQX2M \memory_reg[2][5]  ( .D(n45), .CK(w_clk), .RN(n129), .Q(
        \memory[2][5] ) );
  DFFRQX2M \memory_reg[2][4]  ( .D(n44), .CK(w_clk), .RN(n129), .Q(
        \memory[2][4] ) );
  DFFRQX2M \memory_reg[2][3]  ( .D(n43), .CK(w_clk), .RN(n129), .Q(
        \memory[2][3] ) );
  DFFRQX2M \memory_reg[2][2]  ( .D(n42), .CK(w_clk), .RN(n129), .Q(
        \memory[2][2] ) );
  DFFRQX2M \memory_reg[2][1]  ( .D(n41), .CK(w_clk), .RN(n129), .Q(
        \memory[2][1] ) );
  DFFRQX2M \memory_reg[2][0]  ( .D(n40), .CK(w_clk), .RN(n129), .Q(
        \memory[2][0] ) );
  DFFRQX2M \memory_reg[4][7]  ( .D(n63), .CK(w_clk), .RN(n127), .Q(
        \memory[4][7] ) );
  DFFRQX2M \memory_reg[4][6]  ( .D(n62), .CK(w_clk), .RN(n127), .Q(
        \memory[4][6] ) );
  DFFRQX2M \memory_reg[4][5]  ( .D(n61), .CK(w_clk), .RN(n128), .Q(
        \memory[4][5] ) );
  DFFRQX2M \memory_reg[4][4]  ( .D(n60), .CK(w_clk), .RN(n128), .Q(
        \memory[4][4] ) );
  DFFRQX2M \memory_reg[4][3]  ( .D(n59), .CK(w_clk), .RN(n128), .Q(
        \memory[4][3] ) );
  DFFRQX2M \memory_reg[4][2]  ( .D(n58), .CK(w_clk), .RN(n128), .Q(
        \memory[4][2] ) );
  DFFRQX2M \memory_reg[4][1]  ( .D(n57), .CK(w_clk), .RN(n128), .Q(
        \memory[4][1] ) );
  DFFRQX2M \memory_reg[4][0]  ( .D(n56), .CK(w_clk), .RN(n128), .Q(
        \memory[4][0] ) );
  DFFRQX2M \memory_reg[0][7]  ( .D(n31), .CK(w_clk), .RN(n130), .Q(
        \memory[0][7] ) );
  DFFRQX2M \memory_reg[0][6]  ( .D(n30), .CK(w_clk), .RN(n130), .Q(
        \memory[0][6] ) );
  DFFRQX2M \memory_reg[0][5]  ( .D(n29), .CK(w_clk), .RN(n130), .Q(
        \memory[0][5] ) );
  DFFRQX2M \memory_reg[0][4]  ( .D(n28), .CK(w_clk), .RN(n130), .Q(
        \memory[0][4] ) );
  DFFRQX2M \memory_reg[0][3]  ( .D(n27), .CK(w_clk), .RN(n130), .Q(
        \memory[0][3] ) );
  DFFRQX2M \memory_reg[0][2]  ( .D(n26), .CK(w_clk), .RN(n130), .Q(
        \memory[0][2] ) );
  DFFRQX2M \memory_reg[0][1]  ( .D(n25), .CK(w_clk), .RN(n130), .Q(
        \memory[0][1] ) );
  DFFRQX2M \memory_reg[0][0]  ( .D(n24), .CK(w_clk), .RN(n130), .Q(
        \memory[0][0] ) );
  BUFX2M U2 ( .A(n15), .Y(n122) );
  BUFX2M U3 ( .A(n19), .Y(n121) );
  BUFX2M U4 ( .A(n12), .Y(n123) );
  BUFX2M U5 ( .A(n22), .Y(n120) );
  INVX2M U6 ( .A(w_clk_en), .Y(n131) );
  BUFX2M U7 ( .A(n124), .Y(n128) );
  BUFX2M U8 ( .A(n124), .Y(n127) );
  BUFX2M U9 ( .A(n124), .Y(n126) );
  BUFX2M U10 ( .A(n125), .Y(n129) );
  BUFX2M U11 ( .A(n125), .Y(n130) );
  BUFX2M U12 ( .A(w_rst), .Y(n124) );
  BUFX2M U13 ( .A(w_rst), .Y(n125) );
  NAND2X2M U14 ( .A(n10), .B(n132), .Y(n2) );
  NAND2X2M U15 ( .A(n14), .B(n132), .Y(n13) );
  NAND2X2M U16 ( .A(n18), .B(n132), .Y(n17) );
  NAND2X2M U17 ( .A(n21), .B(n132), .Y(n20) );
  AOI22X1M U18 ( .A0(w_data[0]), .A1(w_clk_en), .B0(N25), .B1(n131), .Y(n1) );
  MX2X2M U19 ( .A(n16), .B(n11), .S0(N12), .Y(N25) );
  AOI22X1M U20 ( .A0(w_data[1]), .A1(w_clk_en), .B0(N24), .B1(n131), .Y(n3) );
  MX2X2M U21 ( .A(n88), .B(n23), .S0(N12), .Y(N24) );
  AOI22X1M U22 ( .A0(w_data[2]), .A1(w_clk_en), .B0(N23), .B1(n131), .Y(n4) );
  MX2X2M U23 ( .A(n90), .B(n89), .S0(N12), .Y(N23) );
  AOI22X1M U24 ( .A0(w_data[3]), .A1(w_clk_en), .B0(N22), .B1(n131), .Y(n5) );
  MX2X2M U25 ( .A(n92), .B(n91), .S0(N12), .Y(N22) );
  AOI22X1M U26 ( .A0(w_data[4]), .A1(w_clk_en), .B0(N21), .B1(n131), .Y(n6) );
  MX2X2M U27 ( .A(n94), .B(n93), .S0(N12), .Y(N21) );
  AOI22X1M U28 ( .A0(w_data[5]), .A1(w_clk_en), .B0(N20), .B1(n131), .Y(n7) );
  MX2X2M U29 ( .A(n96), .B(n95), .S0(N12), .Y(N20) );
  AOI22X1M U30 ( .A0(w_data[6]), .A1(w_clk_en), .B0(N19), .B1(n131), .Y(n8) );
  MX2X2M U31 ( .A(n98), .B(n97), .S0(N12), .Y(N19) );
  AOI22X1M U32 ( .A0(w_data[7]), .A1(w_clk_en), .B0(N18), .B1(n131), .Y(n9) );
  MX2X2M U33 ( .A(n100), .B(n99), .S0(N12), .Y(N18) );
  OAI2BB2X1M U34 ( .B0(n1), .B1(n2), .A0N(\memory[0][0] ), .A1N(n2), .Y(n24)
         );
  OAI2BB2X1M U35 ( .B0(n3), .B1(n2), .A0N(\memory[0][1] ), .A1N(n2), .Y(n25)
         );
  OAI2BB2X1M U36 ( .B0(n4), .B1(n2), .A0N(\memory[0][2] ), .A1N(n2), .Y(n26)
         );
  OAI2BB2X1M U37 ( .B0(n5), .B1(n2), .A0N(\memory[0][3] ), .A1N(n2), .Y(n27)
         );
  OAI2BB2X1M U38 ( .B0(n6), .B1(n2), .A0N(\memory[0][4] ), .A1N(n2), .Y(n28)
         );
  OAI2BB2X1M U39 ( .B0(n7), .B1(n2), .A0N(\memory[0][5] ), .A1N(n2), .Y(n29)
         );
  OAI2BB2X1M U40 ( .B0(n8), .B1(n2), .A0N(\memory[0][6] ), .A1N(n2), .Y(n30)
         );
  OAI2BB2X1M U41 ( .B0(n9), .B1(n2), .A0N(\memory[0][7] ), .A1N(n2), .Y(n31)
         );
  OAI2BB2X1M U42 ( .B0(n1), .B1(n123), .A0N(\memory[1][0] ), .A1N(n123), .Y(
        n32) );
  OAI2BB2X1M U43 ( .B0(n3), .B1(n123), .A0N(\memory[1][1] ), .A1N(n123), .Y(
        n33) );
  OAI2BB2X1M U44 ( .B0(n4), .B1(n123), .A0N(\memory[1][2] ), .A1N(n123), .Y(
        n34) );
  OAI2BB2X1M U45 ( .B0(n5), .B1(n123), .A0N(\memory[1][3] ), .A1N(n123), .Y(
        n35) );
  OAI2BB2X1M U46 ( .B0(n6), .B1(n123), .A0N(\memory[1][4] ), .A1N(n123), .Y(
        n36) );
  OAI2BB2X1M U47 ( .B0(n7), .B1(n123), .A0N(\memory[1][5] ), .A1N(n123), .Y(
        n37) );
  OAI2BB2X1M U48 ( .B0(n8), .B1(n123), .A0N(\memory[1][6] ), .A1N(n123), .Y(
        n38) );
  OAI2BB2X1M U49 ( .B0(n9), .B1(n123), .A0N(\memory[1][7] ), .A1N(n123), .Y(
        n39) );
  OAI2BB2X1M U50 ( .B0(n1), .B1(n13), .A0N(\memory[2][0] ), .A1N(n13), .Y(n40)
         );
  OAI2BB2X1M U51 ( .B0(n3), .B1(n13), .A0N(\memory[2][1] ), .A1N(n13), .Y(n41)
         );
  OAI2BB2X1M U52 ( .B0(n4), .B1(n13), .A0N(\memory[2][2] ), .A1N(n13), .Y(n42)
         );
  OAI2BB2X1M U53 ( .B0(n5), .B1(n13), .A0N(\memory[2][3] ), .A1N(n13), .Y(n43)
         );
  OAI2BB2X1M U54 ( .B0(n6), .B1(n13), .A0N(\memory[2][4] ), .A1N(n13), .Y(n44)
         );
  OAI2BB2X1M U55 ( .B0(n7), .B1(n13), .A0N(\memory[2][5] ), .A1N(n13), .Y(n45)
         );
  OAI2BB2X1M U56 ( .B0(n8), .B1(n13), .A0N(\memory[2][6] ), .A1N(n13), .Y(n46)
         );
  OAI2BB2X1M U57 ( .B0(n9), .B1(n13), .A0N(\memory[2][7] ), .A1N(n13), .Y(n47)
         );
  OAI2BB2X1M U58 ( .B0(n1), .B1(n122), .A0N(\memory[3][0] ), .A1N(n122), .Y(
        n48) );
  OAI2BB2X1M U59 ( .B0(n3), .B1(n122), .A0N(\memory[3][1] ), .A1N(n122), .Y(
        n49) );
  OAI2BB2X1M U60 ( .B0(n4), .B1(n122), .A0N(\memory[3][2] ), .A1N(n122), .Y(
        n50) );
  OAI2BB2X1M U61 ( .B0(n5), .B1(n122), .A0N(\memory[3][3] ), .A1N(n122), .Y(
        n51) );
  OAI2BB2X1M U62 ( .B0(n6), .B1(n122), .A0N(\memory[3][4] ), .A1N(n122), .Y(
        n52) );
  OAI2BB2X1M U63 ( .B0(n7), .B1(n122), .A0N(\memory[3][5] ), .A1N(n122), .Y(
        n53) );
  OAI2BB2X1M U64 ( .B0(n8), .B1(n122), .A0N(\memory[3][6] ), .A1N(n122), .Y(
        n54) );
  OAI2BB2X1M U65 ( .B0(n9), .B1(n122), .A0N(\memory[3][7] ), .A1N(n122), .Y(
        n55) );
  OAI2BB2X1M U66 ( .B0(n1), .B1(n17), .A0N(\memory[4][0] ), .A1N(n17), .Y(n56)
         );
  OAI2BB2X1M U67 ( .B0(n3), .B1(n17), .A0N(\memory[4][1] ), .A1N(n17), .Y(n57)
         );
  OAI2BB2X1M U68 ( .B0(n4), .B1(n17), .A0N(\memory[4][2] ), .A1N(n17), .Y(n58)
         );
  OAI2BB2X1M U69 ( .B0(n5), .B1(n17), .A0N(\memory[4][3] ), .A1N(n17), .Y(n59)
         );
  OAI2BB2X1M U70 ( .B0(n6), .B1(n17), .A0N(\memory[4][4] ), .A1N(n17), .Y(n60)
         );
  OAI2BB2X1M U71 ( .B0(n7), .B1(n17), .A0N(\memory[4][5] ), .A1N(n17), .Y(n61)
         );
  OAI2BB2X1M U72 ( .B0(n8), .B1(n17), .A0N(\memory[4][6] ), .A1N(n17), .Y(n62)
         );
  OAI2BB2X1M U73 ( .B0(n9), .B1(n17), .A0N(\memory[4][7] ), .A1N(n17), .Y(n63)
         );
  OAI2BB2X1M U74 ( .B0(n1), .B1(n121), .A0N(\memory[5][0] ), .A1N(n121), .Y(
        n64) );
  OAI2BB2X1M U75 ( .B0(n3), .B1(n121), .A0N(\memory[5][1] ), .A1N(n121), .Y(
        n65) );
  OAI2BB2X1M U76 ( .B0(n4), .B1(n121), .A0N(\memory[5][2] ), .A1N(n121), .Y(
        n66) );
  OAI2BB2X1M U77 ( .B0(n5), .B1(n121), .A0N(\memory[5][3] ), .A1N(n121), .Y(
        n67) );
  OAI2BB2X1M U78 ( .B0(n6), .B1(n121), .A0N(\memory[5][4] ), .A1N(n121), .Y(
        n68) );
  OAI2BB2X1M U79 ( .B0(n7), .B1(n121), .A0N(\memory[5][5] ), .A1N(n121), .Y(
        n69) );
  OAI2BB2X1M U80 ( .B0(n8), .B1(n121), .A0N(\memory[5][6] ), .A1N(n121), .Y(
        n70) );
  OAI2BB2X1M U81 ( .B0(n9), .B1(n121), .A0N(\memory[5][7] ), .A1N(n121), .Y(
        n71) );
  OAI2BB2X1M U82 ( .B0(n1), .B1(n20), .A0N(\memory[6][0] ), .A1N(n20), .Y(n72)
         );
  OAI2BB2X1M U83 ( .B0(n3), .B1(n20), .A0N(\memory[6][1] ), .A1N(n20), .Y(n73)
         );
  OAI2BB2X1M U84 ( .B0(n4), .B1(n20), .A0N(\memory[6][2] ), .A1N(n20), .Y(n74)
         );
  OAI2BB2X1M U85 ( .B0(n5), .B1(n20), .A0N(\memory[6][3] ), .A1N(n20), .Y(n75)
         );
  OAI2BB2X1M U86 ( .B0(n6), .B1(n20), .A0N(\memory[6][4] ), .A1N(n20), .Y(n76)
         );
  OAI2BB2X1M U87 ( .B0(n7), .B1(n20), .A0N(\memory[6][5] ), .A1N(n20), .Y(n77)
         );
  OAI2BB2X1M U88 ( .B0(n8), .B1(n20), .A0N(\memory[6][6] ), .A1N(n20), .Y(n78)
         );
  OAI2BB2X1M U89 ( .B0(n9), .B1(n20), .A0N(\memory[6][7] ), .A1N(n20), .Y(n79)
         );
  OAI2BB2X1M U90 ( .B0(n1), .B1(n120), .A0N(\memory[7][0] ), .A1N(n120), .Y(
        n80) );
  OAI2BB2X1M U91 ( .B0(n3), .B1(n120), .A0N(\memory[7][1] ), .A1N(n120), .Y(
        n81) );
  OAI2BB2X1M U92 ( .B0(n4), .B1(n120), .A0N(\memory[7][2] ), .A1N(n120), .Y(
        n82) );
  OAI2BB2X1M U93 ( .B0(n5), .B1(n120), .A0N(\memory[7][3] ), .A1N(n120), .Y(
        n83) );
  OAI2BB2X1M U94 ( .B0(n6), .B1(n120), .A0N(\memory[7][4] ), .A1N(n120), .Y(
        n84) );
  OAI2BB2X1M U95 ( .B0(n7), .B1(n120), .A0N(\memory[7][5] ), .A1N(n120), .Y(
        n85) );
  OAI2BB2X1M U96 ( .B0(n8), .B1(n120), .A0N(\memory[7][6] ), .A1N(n120), .Y(
        n86) );
  OAI2BB2X1M U97 ( .B0(n9), .B1(n120), .A0N(\memory[7][7] ), .A1N(n120), .Y(
        n87) );
  BUFX4M U98 ( .A(N10), .Y(n101) );
  MX4X1M U99 ( .A(\memory[0][0] ), .B(\memory[1][0] ), .C(\memory[2][0] ), .D(
        \memory[3][0] ), .S0(n101), .S1(N11), .Y(n16) );
  MX4X1M U100 ( .A(\memory[0][1] ), .B(\memory[1][1] ), .C(\memory[2][1] ), 
        .D(\memory[3][1] ), .S0(n101), .S1(N11), .Y(n88) );
  MX4X1M U101 ( .A(\memory[0][2] ), .B(\memory[1][2] ), .C(\memory[2][2] ), 
        .D(\memory[3][2] ), .S0(n101), .S1(N11), .Y(n90) );
  MX4X1M U102 ( .A(\memory[0][3] ), .B(\memory[1][3] ), .C(\memory[2][3] ), 
        .D(\memory[3][3] ), .S0(n101), .S1(N11), .Y(n92) );
  MX4X1M U103 ( .A(\memory[0][4] ), .B(\memory[1][4] ), .C(\memory[2][4] ), 
        .D(\memory[3][4] ), .S0(n101), .S1(N11), .Y(n94) );
  MX4X1M U104 ( .A(\memory[0][5] ), .B(\memory[1][5] ), .C(\memory[2][5] ), 
        .D(\memory[3][5] ), .S0(n101), .S1(N11), .Y(n96) );
  MX4X1M U105 ( .A(\memory[0][6] ), .B(\memory[1][6] ), .C(\memory[2][6] ), 
        .D(\memory[3][6] ), .S0(n101), .S1(N11), .Y(n98) );
  MX4X1M U106 ( .A(\memory[0][7] ), .B(\memory[1][7] ), .C(\memory[2][7] ), 
        .D(\memory[3][7] ), .S0(n101), .S1(N11), .Y(n100) );
  MX4X1M U107 ( .A(\memory[4][0] ), .B(\memory[5][0] ), .C(\memory[6][0] ), 
        .D(\memory[7][0] ), .S0(n101), .S1(N11), .Y(n11) );
  MX4X1M U108 ( .A(\memory[4][1] ), .B(\memory[5][1] ), .C(\memory[6][1] ), 
        .D(\memory[7][1] ), .S0(n101), .S1(N11), .Y(n23) );
  MX4X1M U109 ( .A(\memory[4][2] ), .B(\memory[5][2] ), .C(\memory[6][2] ), 
        .D(\memory[7][2] ), .S0(n101), .S1(N11), .Y(n89) );
  MX4X1M U110 ( .A(\memory[4][3] ), .B(\memory[5][3] ), .C(\memory[6][3] ), 
        .D(\memory[7][3] ), .S0(n101), .S1(N11), .Y(n91) );
  MX4X1M U111 ( .A(\memory[4][4] ), .B(\memory[5][4] ), .C(\memory[6][4] ), 
        .D(\memory[7][4] ), .S0(n101), .S1(N11), .Y(n93) );
  MX4X1M U112 ( .A(\memory[4][5] ), .B(\memory[5][5] ), .C(\memory[6][5] ), 
        .D(\memory[7][5] ), .S0(n101), .S1(N11), .Y(n95) );
  MX4X1M U113 ( .A(\memory[4][6] ), .B(\memory[5][6] ), .C(\memory[6][6] ), 
        .D(\memory[7][6] ), .S0(n101), .S1(N11), .Y(n97) );
  MX4X1M U114 ( .A(\memory[4][7] ), .B(\memory[5][7] ), .C(\memory[6][7] ), 
        .D(\memory[7][7] ), .S0(n101), .S1(N11), .Y(n99) );
  NOR2X2M U115 ( .A(N12), .B(N11), .Y(n10) );
  NOR2X2M U116 ( .A(n133), .B(N12), .Y(n14) );
  INVX2M U117 ( .A(N10), .Y(n132) );
  INVX2M U118 ( .A(N11), .Y(n133) );
  NAND2X2M U119 ( .A(N10), .B(n10), .Y(n12) );
  NAND2X2M U120 ( .A(n14), .B(N10), .Y(n15) );
  NAND2X2M U121 ( .A(n18), .B(N10), .Y(n19) );
  NAND2X2M U122 ( .A(n21), .B(N10), .Y(n22) );
  AND2X2M U123 ( .A(N12), .B(N11), .Y(n21) );
  AND2X2M U124 ( .A(N12), .B(n133), .Y(n18) );
  MX2X2M U125 ( .A(n109), .B(n108), .S0(N15), .Y(r_data[3]) );
  MX4X1M U126 ( .A(\memory[4][3] ), .B(\memory[5][3] ), .C(\memory[6][3] ), 
        .D(\memory[7][3] ), .S0(n118), .S1(N14), .Y(n108) );
  MX4X1M U127 ( .A(\memory[0][3] ), .B(\memory[1][3] ), .C(\memory[2][3] ), 
        .D(\memory[3][3] ), .S0(n119), .S1(N14), .Y(n109) );
  MX2X2M U128 ( .A(n115), .B(n114), .S0(N15), .Y(r_data[6]) );
  MX4X1M U129 ( .A(\memory[4][6] ), .B(\memory[5][6] ), .C(\memory[6][6] ), 
        .D(\memory[7][6] ), .S0(n118), .S1(N14), .Y(n114) );
  MX4X1M U130 ( .A(\memory[0][6] ), .B(\memory[1][6] ), .C(\memory[2][6] ), 
        .D(\memory[3][6] ), .S0(n119), .S1(N14), .Y(n115) );
  MX2X2M U131 ( .A(n111), .B(n110), .S0(N15), .Y(r_data[4]) );
  MX4X1M U132 ( .A(\memory[4][4] ), .B(\memory[5][4] ), .C(\memory[6][4] ), 
        .D(\memory[7][4] ), .S0(n118), .S1(N14), .Y(n110) );
  MX4X1M U133 ( .A(\memory[0][4] ), .B(\memory[1][4] ), .C(\memory[2][4] ), 
        .D(\memory[3][4] ), .S0(n119), .S1(N14), .Y(n111) );
  MX2X2M U134 ( .A(n103), .B(n102), .S0(N15), .Y(r_data[0]) );
  MX4X1M U135 ( .A(\memory[4][0] ), .B(\memory[5][0] ), .C(\memory[6][0] ), 
        .D(\memory[7][0] ), .S0(n118), .S1(N14), .Y(n102) );
  MX4X1M U136 ( .A(\memory[0][0] ), .B(\memory[1][0] ), .C(\memory[2][0] ), 
        .D(\memory[3][0] ), .S0(n119), .S1(N14), .Y(n103) );
  MX2X2M U137 ( .A(n105), .B(n104), .S0(N15), .Y(r_data[1]) );
  MX4X1M U138 ( .A(\memory[4][1] ), .B(\memory[5][1] ), .C(\memory[6][1] ), 
        .D(\memory[7][1] ), .S0(n118), .S1(N14), .Y(n104) );
  MX4X1M U139 ( .A(\memory[0][1] ), .B(\memory[1][1] ), .C(\memory[2][1] ), 
        .D(\memory[3][1] ), .S0(n119), .S1(N14), .Y(n105) );
  MX2X2M U140 ( .A(n113), .B(n112), .S0(N15), .Y(r_data[5]) );
  MX4X1M U141 ( .A(\memory[4][5] ), .B(\memory[5][5] ), .C(\memory[6][5] ), 
        .D(\memory[7][5] ), .S0(n118), .S1(N14), .Y(n112) );
  MX4X1M U142 ( .A(\memory[0][5] ), .B(\memory[1][5] ), .C(\memory[2][5] ), 
        .D(\memory[3][5] ), .S0(n119), .S1(N14), .Y(n113) );
  MX2X2M U143 ( .A(n117), .B(n116), .S0(N15), .Y(r_data[7]) );
  MX4X1M U144 ( .A(\memory[4][7] ), .B(\memory[5][7] ), .C(\memory[6][7] ), 
        .D(\memory[7][7] ), .S0(n118), .S1(N14), .Y(n116) );
  MX4X1M U145 ( .A(\memory[0][7] ), .B(\memory[1][7] ), .C(\memory[2][7] ), 
        .D(\memory[3][7] ), .S0(n119), .S1(N14), .Y(n117) );
  BUFX2M U146 ( .A(N13), .Y(n119) );
  BUFX2M U147 ( .A(N13), .Y(n118) );
  MX2X2M U148 ( .A(n107), .B(n106), .S0(N15), .Y(r_data[2]) );
  MX4X1M U149 ( .A(\memory[4][2] ), .B(\memory[5][2] ), .C(\memory[6][2] ), 
        .D(\memory[7][2] ), .S0(n118), .S1(N14), .Y(n106) );
  MX4X1M U150 ( .A(\memory[0][2] ), .B(\memory[1][2] ), .C(\memory[2][2] ), 
        .D(\memory[3][2] ), .S0(n119), .S1(N14), .Y(n107) );
endmodule


module FIFO_RD_ADDR_WIDTH3 ( r_CLK, r_RST, r_inc, w_ptr, r_empty, r_ptr_grey, 
        r_addr );
  input [3:0] w_ptr;
  output [3:0] r_ptr_grey;
  output [2:0] r_addr;
  input r_CLK, r_RST, r_inc;
  output r_empty;
  wire   N6, n1, n2, n3, n5, n6, n7, n8, n10, n11, n12, n13, n4, n9;
  assign r_empty = N6;

  DFFRQX2M \r_ptr_reg[3]  ( .D(n10), .CK(r_CLK), .RN(r_RST), .Q(r_ptr_grey[3])
         );
  DFFRQX2M \r_ptr_reg[0]  ( .D(n13), .CK(r_CLK), .RN(r_RST), .Q(r_addr[0]) );
  DFFRQX2M \r_ptr_reg[2]  ( .D(n11), .CK(r_CLK), .RN(r_RST), .Q(r_addr[2]) );
  DFFRQX2M \r_ptr_reg[1]  ( .D(n12), .CK(r_CLK), .RN(r_RST), .Q(r_addr[1]) );
  NOR2X2M U3 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X2M U4 ( .A(n4), .B(r_addr[2]), .Y(r_ptr_grey[1]) );
  XNOR2X2M U5 ( .A(n9), .B(r_addr[2]), .Y(r_ptr_grey[2]) );
  NOR4X1M U6 ( .A(n5), .B(n6), .C(n7), .D(n8), .Y(N6) );
  XNOR2X2M U7 ( .A(w_ptr[3]), .B(n9), .Y(n6) );
  INVX2M U8 ( .A(r_addr[1]), .Y(n4) );
  CLKXOR2X2M U9 ( .A(w_ptr[0]), .B(r_ptr_grey[0]), .Y(n7) );
  CLKXOR2X2M U10 ( .A(w_ptr[1]), .B(r_ptr_grey[1]), .Y(n8) );
  CLKXOR2X2M U11 ( .A(w_ptr[2]), .B(r_ptr_grey[2]), .Y(n5) );
  CLKXOR2X2M U12 ( .A(r_addr[0]), .B(r_addr[1]), .Y(r_ptr_grey[0]) );
  INVX2M U13 ( .A(r_ptr_grey[3]), .Y(n9) );
  XNOR2X2M U14 ( .A(r_addr[1]), .B(n3), .Y(n12) );
  XNOR2X2M U15 ( .A(r_ptr_grey[3]), .B(n1), .Y(n10) );
  NAND2X2M U16 ( .A(n2), .B(r_addr[2]), .Y(n1) );
  NAND2X2M U17 ( .A(r_inc), .B(r_addr[0]), .Y(n3) );
  CLKXOR2X2M U18 ( .A(r_addr[2]), .B(n2), .Y(n11) );
  CLKXOR2X2M U19 ( .A(r_inc), .B(r_addr[0]), .Y(n13) );
endmodule


module FIFO_WR_ADDR_WIDTH3 ( w_CLK, w_RST, w_inc, r_ptr, w_full, w_ptr_grey, 
        w_addr, w_clk_en );
  input [3:0] r_ptr;
  output [3:0] w_ptr_grey;
  output [2:0] w_addr;
  input w_CLK, w_RST, w_inc;
  output w_full, w_clk_en;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;

  DFFRQX2M \w_ptr_reg[3]  ( .D(n13), .CK(w_CLK), .RN(w_RST), .Q(w_ptr_grey[3])
         );
  DFFRX1M \w_ptr_reg[0]  ( .D(n16), .CK(w_CLK), .RN(w_RST), .Q(w_addr[0]), 
        .QN(n3) );
  DFFRQX2M \w_ptr_reg[2]  ( .D(n14), .CK(w_CLK), .RN(w_RST), .Q(w_addr[2]) );
  DFFRQX2M \w_ptr_reg[1]  ( .D(n15), .CK(w_CLK), .RN(w_RST), .Q(w_addr[1]) );
  INVX2M U3 ( .A(n5), .Y(w_clk_en) );
  NAND2X2M U4 ( .A(w_inc), .B(n4), .Y(n5) );
  INVX2M U5 ( .A(n4), .Y(w_full) );
  NAND4X2M U6 ( .A(n9), .B(n10), .C(n11), .D(n12), .Y(n4) );
  CLKXOR2X2M U7 ( .A(w_ptr_grey[3]), .B(r_ptr[3]), .Y(n12) );
  XNOR2X2M U8 ( .A(w_ptr_grey[0]), .B(r_ptr[0]), .Y(n10) );
  XNOR2X2M U9 ( .A(w_ptr_grey[1]), .B(r_ptr[1]), .Y(n9) );
  CLKXOR2X2M U10 ( .A(w_ptr_grey[3]), .B(w_addr[2]), .Y(w_ptr_grey[2]) );
  CLKXOR2X2M U11 ( .A(r_ptr[2]), .B(w_ptr_grey[2]), .Y(n11) );
  CLKXOR2X2M U12 ( .A(w_addr[1]), .B(w_addr[2]), .Y(w_ptr_grey[1]) );
  XNOR2X2M U13 ( .A(n3), .B(w_addr[1]), .Y(w_ptr_grey[0]) );
  NOR2X2M U14 ( .A(n5), .B(n3), .Y(n8) );
  XNOR2X2M U15 ( .A(w_addr[2]), .B(n7), .Y(n14) );
  XNOR2X2M U16 ( .A(w_ptr_grey[3]), .B(n6), .Y(n13) );
  NAND2BX2M U17 ( .AN(n7), .B(w_addr[2]), .Y(n6) );
  NAND2X2M U18 ( .A(n8), .B(w_addr[1]), .Y(n7) );
  CLKXOR2X2M U19 ( .A(w_addr[1]), .B(n8), .Y(n15) );
  CLKXOR2X2M U20 ( .A(n3), .B(n5), .Y(n16) );
endmodule


module FIFO_DFF_ptr_width4_0 ( ptr, CLK, RST, sync_ptr );
  input [3:0] ptr;
  output [3:0] sync_ptr;
  input CLK, RST;

  wire   [3:0] R0;

  DFFRQX2M \R1_reg[3]  ( .D(R0[3]), .CK(CLK), .RN(RST), .Q(sync_ptr[3]) );
  DFFRQX2M \R1_reg[2]  ( .D(R0[2]), .CK(CLK), .RN(RST), .Q(sync_ptr[2]) );
  DFFRQX2M \R1_reg[1]  ( .D(R0[1]), .CK(CLK), .RN(RST), .Q(sync_ptr[1]) );
  DFFRQX2M \R1_reg[0]  ( .D(R0[0]), .CK(CLK), .RN(RST), .Q(sync_ptr[0]) );
  DFFRQX2M \R0_reg[3]  ( .D(ptr[3]), .CK(CLK), .RN(RST), .Q(R0[3]) );
  DFFRQX2M \R0_reg[2]  ( .D(ptr[2]), .CK(CLK), .RN(RST), .Q(R0[2]) );
  DFFRQX2M \R0_reg[1]  ( .D(ptr[1]), .CK(CLK), .RN(RST), .Q(R0[1]) );
  DFFRQX2M \R0_reg[0]  ( .D(ptr[0]), .CK(CLK), .RN(RST), .Q(R0[0]) );
endmodule


module FIFO_DFF_ptr_width4_1 ( ptr, CLK, RST, sync_ptr );
  input [3:0] ptr;
  output [3:0] sync_ptr;
  input CLK, RST;

  wire   [3:0] R0;

  DFFRQX2M \R1_reg[1]  ( .D(R0[1]), .CK(CLK), .RN(RST), .Q(sync_ptr[1]) );
  DFFRQX2M \R1_reg[0]  ( .D(R0[0]), .CK(CLK), .RN(RST), .Q(sync_ptr[0]) );
  DFFRQX2M \R1_reg[3]  ( .D(R0[3]), .CK(CLK), .RN(RST), .Q(sync_ptr[3]) );
  DFFRQX2M \R1_reg[2]  ( .D(R0[2]), .CK(CLK), .RN(RST), .Q(sync_ptr[2]) );
  DFFRQX2M \R0_reg[2]  ( .D(ptr[2]), .CK(CLK), .RN(RST), .Q(R0[2]) );
  DFFRQX2M \R0_reg[1]  ( .D(ptr[1]), .CK(CLK), .RN(RST), .Q(R0[1]) );
  DFFRQX2M \R0_reg[0]  ( .D(ptr[0]), .CK(CLK), .RN(RST), .Q(R0[0]) );
  DFFRQX2M \R0_reg[3]  ( .D(ptr[3]), .CK(CLK), .RN(RST), .Q(R0[3]) );
endmodule


module FIFO_TOP_ADDR_WIDTH3_BUFFER_DEPTH8_BUFFER_WIDTH8 ( w_CLK, r_CLK, w_RST, 
        r_RST, w_data, w_inc, r_inc, w_full, r_empty, r_data );
  input [7:0] w_data;
  output [7:0] r_data;
  input w_CLK, r_CLK, w_RST, r_RST, w_inc, r_inc;
  output w_full, r_empty;
  wire   w_clk_en;
  wire   [2:0] w_addr;
  wire   [2:0] r_addr;
  wire   [3:0] w_ptr_grey_sync;
  wire   [3:0] r_ptr_grey;
  wire   [3:0] r_ptr_grey_sync;
  wire   [3:0] w_ptr_grey;

  FIFO_BUFFER_ADDR_WIDTH3_BUFFER_DEPTH8_BUFFER_WIDTH8 U0_buffer ( .w_clk_en(
        w_clk_en), .w_clk(w_CLK), .w_rst(w_RST), .w_address(w_addr), 
        .r_address(r_addr), .w_data(w_data), .r_data(r_data) );
  FIFO_RD_ADDR_WIDTH3 U0_read ( .r_CLK(r_CLK), .r_RST(r_RST), .r_inc(r_inc), 
        .w_ptr(w_ptr_grey_sync), .r_empty(r_empty), .r_ptr_grey(r_ptr_grey), 
        .r_addr(r_addr) );
  FIFO_WR_ADDR_WIDTH3 U0_write ( .w_CLK(w_CLK), .w_RST(w_RST), .w_inc(w_inc), 
        .r_ptr(r_ptr_grey_sync), .w_full(w_full), .w_ptr_grey(w_ptr_grey), 
        .w_addr(w_addr), .w_clk_en(w_clk_en) );
  FIFO_DFF_ptr_width4_0 U0_w2r ( .ptr(w_ptr_grey), .CLK(r_CLK), .RST(r_RST), 
        .sync_ptr(w_ptr_grey_sync) );
  FIFO_DFF_ptr_width4_1 U1_r2w ( .ptr(r_ptr_grey), .CLK(w_CLK), .RST(w_RST), 
        .sync_ptr(r_ptr_grey_sync) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module clk_div_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module clk_div_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  clk_div_0_DW01_inc_0 add_46 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n18), .CK(i_ref_clk), .RN(i_rst_n), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n17), .CK(i_ref_clk), .SN(i_rst_n), .Q(
        odd_edge_tog) );
  DFFRQX2M \count_reg[5]  ( .D(n20), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[5]) );
  DFFRQX2M \count_reg[4]  ( .D(n21), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[4]) );
  DFFRQX2M \count_reg[3]  ( .D(n22), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[3]) );
  DFFRQX2M \count_reg[6]  ( .D(n19), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[6]) );
  DFFRQX2M \count_reg[0]  ( .D(n25), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[0]) );
  DFFRQX2M \count_reg[2]  ( .D(n23), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[2]) );
  DFFRQX2M \count_reg[1]  ( .D(n24), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[1]) );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(n43), .Y(o_div_clk) );
  NAND2BX2M U4 ( .AN(n14), .B(i_clk_en), .Y(n7) );
  INVX2M U5 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  NAND2BX1M U7 ( .AN(i_div_ratio[2]), .B(edge_flip_half[0]), .Y(n1) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n25) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n24) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n23) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n22) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n21) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n20) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n19) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(n43), .Y(n8) );
  CLKINVX1M U26 ( .A(n7), .Y(n43) );
  CLKXOR2X2M U27 ( .A(div_clk), .B(n11), .Y(n18) );
  AOI21X1M U28 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U29 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U30 ( .A(odd_edge_tog), .B(n13), .Y(n17) );
  OR2X1M U31 ( .A(n10), .B(n7), .Y(n13) );
  NOR4BX1M U32 ( .AN(n15), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n14) );
  NOR4X1M U33 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n15) );
  CLKNAND2X2M U34 ( .A(n16), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U35 ( .A(n26), .B(n12), .S0(odd_edge_tog), .Y(n16) );
  NAND4X1M U36 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n12) );
  NOR4X1M U37 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n34) );
  CLKXOR2X2M U39 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n33) );
  CLKXOR2X2M U40 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n32) );
  CLKXOR2X2M U41 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n31) );
  XNOR2X1M U42 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n29) );
  XNOR2X1M U43 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n28) );
  XNOR2X1M U44 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n27) );
  NAND4X1M U45 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n26) );
  NOR4X1M U46 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n42) );
  CLKXOR2X2M U48 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n41) );
  CLKXOR2X2M U49 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n40) );
  CLKXOR2X2M U50 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n39) );
  XNOR2X1M U51 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n37) );
  XNOR2X1M U52 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n36) );
  XNOR2X1M U53 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n35) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n1, n2, n3, n4;
  assign OUT[4] = 1'b0;
  assign OUT[5] = 1'b0;
  assign OUT[6] = 1'b0;
  assign OUT[7] = 1'b0;

  NAND4BX1M U3 ( .AN(IN[4]), .B(IN[3]), .C(n2), .D(n1), .Y(n6) );
  NAND4BX1M U4 ( .AN(IN[3]), .B(IN[4]), .C(n2), .D(n1), .Y(n7) );
  NOR3X2M U5 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR4X1M U6 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U7 ( .A(n4), .B(n3), .C(IN[2]), .Y(n5) );
  NOR3X2M U8 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  OAI211X2M U9 ( .A0(n8), .A1(n9), .B0(n4), .C0(n3), .Y(OUT[0]) );
  NAND2X2M U10 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U11 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n2), .Y(n8) );
  INVX2M U12 ( .A(IN[2]), .Y(n2) );
  INVX2M U13 ( .A(IN[5]), .Y(n1) );
  INVX2M U14 ( .A(IN[0]), .Y(n4) );
  INVX2M U15 ( .A(IN[1]), .Y(n3) );
endmodule


module clk_div_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module clk_div_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  clk_div_1_DW01_inc_0 add_46 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n51), .CK(i_ref_clk), .RN(i_rst_n), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n52), .CK(i_ref_clk), .SN(i_rst_n), .Q(
        odd_edge_tog) );
  DFFRQX2M \count_reg[5]  ( .D(n49), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[5]) );
  DFFRQX2M \count_reg[4]  ( .D(n48), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[4]) );
  DFFRQX2M \count_reg[3]  ( .D(n47), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[3]) );
  DFFRQX2M \count_reg[6]  ( .D(n50), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[6]) );
  DFFRQX2M \count_reg[0]  ( .D(n44), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[0]) );
  DFFRQX2M \count_reg[2]  ( .D(n46), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[2]) );
  DFFRQX2M \count_reg[1]  ( .D(n45), .CK(i_ref_clk), .RN(i_rst_n), .Q(count[1]) );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(n43), .Y(o_div_clk) );
  INVX2M U4 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  NAND2BX2M U5 ( .AN(n14), .B(i_clk_en), .Y(n7) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  NAND2BX1M U7 ( .AN(i_div_ratio[2]), .B(edge_flip_half[0]), .Y(n1) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n44) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n45) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n46) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n47) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n48) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n49) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n50) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(n43), .Y(n8) );
  CLKINVX1M U26 ( .A(n7), .Y(n43) );
  CLKXOR2X2M U27 ( .A(div_clk), .B(n11), .Y(n51) );
  AOI21X1M U28 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U29 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U30 ( .A(odd_edge_tog), .B(n13), .Y(n52) );
  OR2X1M U31 ( .A(n10), .B(n7), .Y(n13) );
  NOR4BX1M U32 ( .AN(n15), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n14) );
  NOR4X1M U33 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n15) );
  CLKNAND2X2M U34 ( .A(n16), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U35 ( .A(n26), .B(n12), .S0(odd_edge_tog), .Y(n16) );
  NAND4X1M U36 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n12) );
  NOR4X1M U37 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n34) );
  CLKXOR2X2M U39 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n33) );
  CLKXOR2X2M U40 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n32) );
  CLKXOR2X2M U41 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n31) );
  XNOR2X1M U42 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n29) );
  XNOR2X1M U43 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n28) );
  XNOR2X1M U44 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n27) );
  NAND4X1M U45 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n26) );
  NOR4X1M U46 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n42) );
  CLKXOR2X2M U48 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n41) );
  CLKXOR2X2M U49 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n40) );
  CLKXOR2X2M U50 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n39) );
  XNOR2X1M U51 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n37) );
  XNOR2X1M U52 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n36) );
  XNOR2X1M U53 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n35) );
endmodule


module UART_TX_DATA_WIDTH8 ( P_DATA, DATA_VALID, PAR_EN, PAR_TYP, CLK, RST, 
        TX_OUT, BUSY );
  input [7:0] P_DATA;
  input DATA_VALID, PAR_EN, PAR_TYP, CLK, RST;
  output TX_OUT, BUSY;
  wire   N31, N33, PARITY_BIT, BUSY_comb, N38, TX_OUT_comb, \SR[0] , N109,
         N110, N111, N112, N113, N114, N115, N116, n8, n9, n10, n11, n12, n13,
         n14, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n1, n2, n3, n4, n5, n6, n7, n15, n16, n17,
         n18, n19, n20, n21, n22;
  wire   [2:0] current_state;
  wire   [2:0] counter;
  wire   [2:0] next_state;

  DFFQX2M \counter_reg[1]  ( .D(n2), .CK(CLK), .Q(counter[1]) );
  DFFRQX2M PARITY_BIT_reg ( .D(N38), .CK(CLK), .RN(RST), .Q(PARITY_BIT) );
  DFFRX1M \SR_reg[6]  ( .D(N115), .CK(CLK), .RN(RST), .QN(n9) );
  DFFRX1M \SR_reg[5]  ( .D(N114), .CK(CLK), .RN(RST), .QN(n10) );
  DFFRX1M \SR_reg[4]  ( .D(N113), .CK(CLK), .RN(RST), .QN(n11) );
  DFFRX1M \SR_reg[3]  ( .D(N112), .CK(CLK), .RN(RST), .QN(n12) );
  DFFRX1M \SR_reg[2]  ( .D(N111), .CK(CLK), .RN(RST), .QN(n13) );
  DFFRX1M \SR_reg[1]  ( .D(N110), .CK(CLK), .RN(RST), .QN(n14) );
  DFFQX2M \counter_reg[2]  ( .D(N33), .CK(CLK), .Q(counter[2]) );
  DFFRQX2M \SR_reg[0]  ( .D(N109), .CK(CLK), .RN(RST), .Q(\SR[0] ) );
  DFFQX2M \counter_reg[0]  ( .D(N31), .CK(CLK), .Q(counter[0]) );
  DFFRX1M \SR_reg[7]  ( .D(N116), .CK(CLK), .RN(RST), .QN(n8) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M BUSY_reg ( .D(BUSY_comb), .CK(CLK), .RN(RST), .Q(BUSY) );
  DFFRQX2M TX_OUT_reg ( .D(TX_OUT_comb), .CK(CLK), .RN(RST), .Q(TX_OUT) );
  NAND2X2M U3 ( .A(n24), .B(n27), .Y(n39) );
  CLKXOR2X2M U4 ( .A(n20), .B(P_DATA[3]), .Y(n35) );
  CLKXOR2X2M U5 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n34) );
  INVX2M U6 ( .A(n24), .Y(n1) );
  INVX2M U7 ( .A(n37), .Y(n5) );
  OAI222X1M U8 ( .A0(n24), .A1(n14), .B0(n39), .B1(n15), .C0(n22), .C1(n27), 
        .Y(N109) );
  INVX2M U9 ( .A(\SR[0] ), .Y(n15) );
  INVX2M U10 ( .A(P_DATA[0]), .Y(n22) );
  OAI222X1M U11 ( .A0(n24), .A1(n13), .B0(n39), .B1(n14), .C0(n21), .C1(n27), 
        .Y(N110) );
  INVX2M U12 ( .A(P_DATA[1]), .Y(n21) );
  OAI222X1M U13 ( .A0(n24), .A1(n12), .B0(n39), .B1(n13), .C0(n20), .C1(n27), 
        .Y(N111) );
  OAI222X1M U14 ( .A0(n24), .A1(n11), .B0(n39), .B1(n12), .C0(n19), .C1(n27), 
        .Y(N112) );
  INVX2M U15 ( .A(P_DATA[3]), .Y(n19) );
  OAI222X1M U16 ( .A0(n24), .A1(n10), .B0(n39), .B1(n11), .C0(n18), .C1(n27), 
        .Y(N113) );
  INVX2M U17 ( .A(P_DATA[4]), .Y(n18) );
  OAI222X1M U18 ( .A0(n24), .A1(n9), .B0(n39), .B1(n10), .C0(n17), .C1(n27), 
        .Y(N114) );
  INVX2M U19 ( .A(P_DATA[5]), .Y(n17) );
  OAI222X1M U20 ( .A0(n24), .A1(n8), .B0(n39), .B1(n9), .C0(n16), .C1(n27), 
        .Y(N115) );
  INVX2M U21 ( .A(P_DATA[6]), .Y(n16) );
  AOI211X2M U22 ( .A0(n26), .A1(n27), .B0(current_state[2]), .C0(
        current_state[0]), .Y(next_state[0]) );
  NAND2X2M U23 ( .A(n25), .B(current_state[1]), .Y(n26) );
  NAND2BX2M U24 ( .AN(BUSY_comb), .B(DATA_VALID), .Y(n27) );
  OAI2B2X1M U25 ( .A1N(P_DATA[7]), .A0(n27), .B0(n39), .B1(n8), .Y(N116) );
  INVX2M U26 ( .A(current_state[1]), .Y(n6) );
  OAI2BB2X1M U27 ( .B0(n31), .B1(n27), .A0N(n27), .A1N(PARITY_BIT), .Y(N38) );
  CLKXOR2X2M U28 ( .A(n32), .B(n33), .Y(n31) );
  XOR3XLM U29 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n34), .Y(n33) );
  XOR3XLM U30 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n35), .Y(n32) );
  CLKXOR2X2M U31 ( .A(n40), .B(current_state[2]), .Y(BUSY_comb) );
  NAND2X2M U32 ( .A(n6), .B(n3), .Y(n40) );
  INVX2M U33 ( .A(P_DATA[2]), .Y(n20) );
  NOR3BX2M U34 ( .AN(PAR_EN), .B(n5), .C(counter[2]), .Y(n25) );
  OAI32X1M U35 ( .A0(n3), .A1(current_state[2]), .A2(current_state[1]), .B0(
        n23), .B1(n24), .Y(next_state[1]) );
  NOR3X2M U36 ( .A(n25), .B(counter[2]), .C(n5), .Y(n23) );
  NAND3X2M U37 ( .A(n3), .B(n7), .C(current_state[1]), .Y(n24) );
  AOI211X2M U38 ( .A0(n3), .A1(n4), .B0(n6), .C0(current_state[2]), .Y(
        next_state[2]) );
  INVX2M U39 ( .A(n23), .Y(n4) );
  NOR2X2M U40 ( .A(counter[1]), .B(counter[0]), .Y(n37) );
  INVX2M U41 ( .A(current_state[0]), .Y(n3) );
  INVX2M U42 ( .A(n38), .Y(n2) );
  AOI211X2M U43 ( .A0(counter[0]), .A1(counter[1]), .B0(n37), .C0(n24), .Y(n38) );
  INVX2M U44 ( .A(current_state[2]), .Y(n7) );
  NAND3X2M U45 ( .A(n28), .B(n7), .C(n29), .Y(TX_OUT_comb) );
  NAND3X2M U46 ( .A(current_state[1]), .B(n30), .C(current_state[0]), .Y(n28)
         );
  OAI21X2M U47 ( .A0(\SR[0] ), .A1(n6), .B0(n3), .Y(n29) );
  CLKXOR2X2M U48 ( .A(PAR_TYP), .B(PARITY_BIT), .Y(n30) );
  NAND2X2M U49 ( .A(counter[0]), .B(n1), .Y(N31) );
  NAND2X2M U50 ( .A(n36), .B(n1), .Y(N33) );
  CLKXOR2X2M U51 ( .A(n5), .B(counter[2]), .Y(n36) );
endmodule


module UART_RX_FSM ( CLK, RST, RX_IN, PARITY_EN, par_err, strt_err, bit_done, 
        bit_over, stop_err, data_done, edge_cnt, bit_cnt, par_chk_en, 
        strt_chk_en, stop_chk_en, deser_en, DATA_VALID, cnt_en, sampler_en );
  input [4:0] edge_cnt;
  input [3:0] bit_cnt;
  input CLK, RST, RX_IN, PARITY_EN, par_err, strt_err, bit_done, bit_over,
         stop_err, data_done;
  output par_chk_en, strt_chk_en, stop_chk_en, deser_en, DATA_VALID, cnt_en,
         sampler_en;
  wire   cnt_en, DATA_VALID_delay, n7, n8, n9, n10, n11, n12, n13, n14, n1, n2,
         n3, n4, n5, n6, n15;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign sampler_en = cnt_en;

  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M DATA_VALID_reg ( .D(DATA_VALID_delay), .CK(CLK), .RN(RST), .Q(
        DATA_VALID) );
  DFFX1M DATA_VALID_delay_reg ( .D(deser_en), .CK(CLK), .Q(DATA_VALID_delay)
         );
  OAI22X1M U3 ( .A0(current_state[2]), .A1(n5), .B0(n1), .B1(n15), .Y(cnt_en)
         );
  NOR3BX2M U4 ( .AN(stop_chk_en), .B(stop_err), .C(n3), .Y(deser_en) );
  INVX2M U5 ( .A(bit_done), .Y(n3) );
  NOR2X2M U6 ( .A(n10), .B(n1), .Y(par_chk_en) );
  NOR2X2M U7 ( .A(n7), .B(n1), .Y(stop_chk_en) );
  INVX2M U8 ( .A(n1), .Y(n5) );
  NOR2BX2M U9 ( .AN(n13), .B(current_state[2]), .Y(next_state[0]) );
  OAI32X1M U10 ( .A0(RX_IN), .A1(current_state[1]), .A2(n1), .B0(n14), .B1(n5), 
        .Y(n13) );
  AOI221XLM U11 ( .A0(current_state[1]), .A1(n4), .B0(n15), .B1(n2), .C0(n3), 
        .Y(n14) );
  OAI32X1M U12 ( .A0(n15), .A1(n1), .A2(bit_done), .B0(current_state[2]), .B1(
        n11), .Y(next_state[1]) );
  AOI31X2M U13 ( .A0(n1), .A1(n2), .A2(bit_done), .B0(n12), .Y(n11) );
  AOI21X2M U14 ( .A0(par_err), .A1(n5), .B0(n15), .Y(n12) );
  OAI32X1M U15 ( .A0(n7), .A1(n1), .A2(bit_done), .B0(n8), .B1(n3), .Y(
        next_state[2]) );
  AOI2B1X1M U16 ( .A1N(par_err), .A0(par_chk_en), .B0(n9), .Y(n8) );
  NOR4X1M U17 ( .A(PARITY_EN), .B(n10), .C(n4), .D(n5), .Y(n9) );
  INVX2M U18 ( .A(strt_err), .Y(n2) );
  AND3X2M U19 ( .A(n10), .B(n1), .C(n6), .Y(strt_chk_en) );
  NAND2X2M U20 ( .A(current_state[1]), .B(n6), .Y(n10) );
  NAND2X2M U21 ( .A(current_state[2]), .B(current_state[1]), .Y(n7) );
  INVX2M U22 ( .A(current_state[1]), .Y(n15) );
  BUFX2M U23 ( .A(current_state[0]), .Y(n1) );
  INVX2M U24 ( .A(current_state[2]), .Y(n6) );
  INVX2M U25 ( .A(bit_cnt[3]), .Y(n4) );
endmodule


module PARITY_CHECKER ( CLK, RST, bit_cnt, par_chk_en, sampled_bit, 
        PARITY_TYPE, odd_parity, even_parity, bit_done, par_err, PAR_err );
  input [3:0] bit_cnt;
  input CLK, RST, par_chk_en, sampled_bit, PARITY_TYPE, odd_parity,
         even_parity, bit_done;
  output par_err, PAR_err;
  wire   n1, n2, n3;

  DFFRQX2M PAR_err_reg ( .D(par_err), .CK(CLK), .RN(RST), .Q(PAR_err) );
  AND3X2M U3 ( .A(bit_done), .B(n1), .C(par_chk_en), .Y(par_err) );
  OAI2B2X1M U4 ( .A1N(PARITY_TYPE), .A0(n2), .B0(PARITY_TYPE), .B1(n3), .Y(n1)
         );
  XNOR2X2M U5 ( .A(sampled_bit), .B(odd_parity), .Y(n2) );
  XNOR2X2M U6 ( .A(sampled_bit), .B(even_parity), .Y(n3) );
endmodule


module START_CHECKER ( CLK, RST, strt_chk_en, sampled_bit, bit_done, strt_err
 );
  input CLK, RST, strt_chk_en, sampled_bit, bit_done;
  output strt_err;
  wire   N0;
  assign strt_err = N0;

  AND3X2M U1 ( .A(sampled_bit), .B(bit_done), .C(strt_chk_en), .Y(N0) );
endmodule


module STOP_CHECKER ( CLK, RST, stop_chk_en, sampled_bit, bit_done, stop_err, 
        STOP_err );
  input CLK, RST, stop_chk_en, sampled_bit, bit_done;
  output stop_err, STOP_err;
  wire   N1, n1;
  assign stop_err = N1;

  DFFRQX2M STOP_err_reg ( .D(N1), .CK(CLK), .RN(RST), .Q(STOP_err) );
  AND3X2M U3 ( .A(n1), .B(bit_done), .C(stop_chk_en), .Y(N1) );
  INVX2M U4 ( .A(sampled_bit), .Y(n1) );
endmodule


module DATA_SAMPLER ( CLK, RST, edge_cnt, sampler_en, RX_IN, PRESCALE, 
        sampled_bit );
  input [4:0] edge_cnt;
  input [5:0] PRESCALE;
  input CLK, RST, sampler_en, RX_IN;
  output sampled_bit;
  wire   sampled_bit_c, n1, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;
  wire   [6:0] samples;

  DFFRQX2M \samples_reg[5]  ( .D(n75), .CK(CLK), .RN(RST), .Q(samples[5]) );
  DFFRX1M \samples_reg[6]  ( .D(n74), .CK(CLK), .RN(RST), .QN(n1) );
  DFFRQX2M \samples_reg[4]  ( .D(n76), .CK(CLK), .RN(RST), .Q(samples[4]) );
  DFFRQX2M \samples_reg[2]  ( .D(n78), .CK(CLK), .RN(RST), .Q(samples[2]) );
  DFFRQX2M \samples_reg[3]  ( .D(n77), .CK(CLK), .RN(RST), .Q(samples[3]) );
  DFFRQX2M \samples_reg[1]  ( .D(n79), .CK(CLK), .RN(RST), .Q(samples[1]) );
  DFFRQX2M \samples_reg[0]  ( .D(n80), .CK(CLK), .RN(RST), .Q(samples[0]) );
  DFFRQX2M sampled_bit_reg ( .D(sampled_bit_c), .CK(CLK), .RN(RST), .Q(
        sampled_bit) );
  NOR4BX1M U3 ( .AN(PRESCALE[4]), .B(PRESCALE[2]), .C(PRESCALE[3]), .D(
        PRESCALE[5]), .Y(n64) );
  NOR4X1M U4 ( .A(n18), .B(PRESCALE[2]), .C(PRESCALE[4]), .D(PRESCALE[5]), .Y(
        n63) );
  NOR2X2M U5 ( .A(PRESCALE[1]), .B(PRESCALE[0]), .Y(n29) );
  INVX2M U6 ( .A(n50), .Y(n14) );
  NOR2X2M U7 ( .A(n19), .B(n15), .Y(n50) );
  INVX2M U8 ( .A(n41), .Y(n13) );
  NOR3X2M U9 ( .A(n4), .B(n45), .C(n46), .Y(n28) );
  INVX2M U10 ( .A(n60), .Y(n4) );
  OAI31X1M U11 ( .A0(n27), .A1(n60), .A2(n11), .B0(n59), .Y(n71) );
  NOR3X2M U12 ( .A(n54), .B(n19), .C(n17), .Y(n23) );
  NAND2X2M U13 ( .A(n50), .B(n7), .Y(n42) );
  INVX2M U14 ( .A(n37), .Y(n6) );
  INVX2M U15 ( .A(n30), .Y(n10) );
  NAND4BX1M U16 ( .AN(n64), .B(n17), .C(n27), .D(n15), .Y(n59) );
  NAND2X2M U17 ( .A(n64), .B(n29), .Y(n46) );
  NAND2X2M U18 ( .A(n29), .B(n59), .Y(n41) );
  INVX2M U19 ( .A(n29), .Y(n19) );
  INVX2M U20 ( .A(n72), .Y(n15) );
  INVX2M U21 ( .A(n63), .Y(n17) );
  AND2X2M U22 ( .A(n59), .B(n29), .Y(n36) );
  NOR2BX2M U23 ( .AN(n36), .B(RX_IN), .Y(n35) );
  OAI31X1M U24 ( .A0(n60), .A1(n72), .A2(n68), .B0(RX_IN), .Y(n70) );
  OAI2B2X1M U25 ( .A1N(n34), .A0(n35), .B0(n1), .B1(n34), .Y(n74) );
  OAI22X1M U26 ( .A0(n36), .A1(n37), .B0(n14), .B1(n20), .Y(n34) );
  OAI2BB2X1M U27 ( .B0(n35), .B1(n39), .A0N(n39), .A1N(samples[5]), .Y(n75) );
  OAI21X2M U28 ( .A0(n40), .A1(n41), .B0(n6), .Y(n39) );
  NOR2X2M U29 ( .A(n4), .B(n42), .Y(n40) );
  OAI2BB2X1M U30 ( .B0(n65), .B1(n66), .A0N(n66), .A1N(samples[0]), .Y(n80) );
  OAI31X1M U31 ( .A0(n67), .A1(n19), .A2(n68), .B0(n6), .Y(n66) );
  NOR3BX2M U32 ( .AN(n70), .B(n71), .C(n19), .Y(n65) );
  OAI211X2M U33 ( .A0(n15), .A1(n54), .B0(n27), .C0(n59), .Y(n67) );
  OAI2BB2X1M U34 ( .B0(n35), .B1(n56), .A0N(n56), .A1N(samples[1]), .Y(n79) );
  OAI31X1M U35 ( .A0(n57), .A1(n58), .A2(n41), .B0(n6), .Y(n56) );
  NOR2X2M U36 ( .A(n4), .B(n55), .Y(n58) );
  OAI31X1M U37 ( .A0(n61), .A1(n46), .A2(n7), .B0(n62), .Y(n57) );
  OAI2BB2X1M U38 ( .B0(n35), .B1(n51), .A0N(n51), .A1N(samples[2]), .Y(n78) );
  OAI31X1M U39 ( .A0(n52), .A1(n23), .A2(n53), .B0(n6), .Y(n51) );
  NOR4X1M U40 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .C(n45), .D(n46), .Y(n53) );
  OAI31X1M U41 ( .A0(n55), .A1(n2), .A2(n5), .B0(n13), .Y(n52) );
  OAI2BB2X1M U42 ( .B0(n35), .B1(n47), .A0N(n47), .A1N(samples[3]), .Y(n77) );
  OAI31X1M U43 ( .A0(n41), .A1(n48), .A2(n49), .B0(n6), .Y(n47) );
  NOR3X2M U44 ( .A(n42), .B(edge_cnt[1]), .C(edge_cnt[0]), .Y(n48) );
  NOR4X1M U45 ( .A(edge_cnt[1]), .B(n2), .C(n45), .D(n46), .Y(n49) );
  OAI2BB2X1M U46 ( .B0(n35), .B1(n43), .A0N(n43), .A1N(samples[4]), .Y(n76) );
  OAI31X1M U47 ( .A0(n41), .A1(n28), .A2(n44), .B0(n6), .Y(n43) );
  NOR3X2M U48 ( .A(n42), .B(edge_cnt[1]), .C(n2), .Y(n44) );
  OAI32X1M U49 ( .A0(n26), .A1(n11), .A2(n27), .B0(n10), .B1(n3), .Y(n25) );
  NAND3X2M U50 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .C(n29), .Y(n26) );
  INVX2M U51 ( .A(n28), .Y(n3) );
  OAI32X1M U52 ( .A0(n20), .A1(n21), .A2(n14), .B0(n22), .B1(n12), .Y(
        sampled_bit_c) );
  INVX2M U53 ( .A(sampler_en), .Y(n12) );
  AOI21X2M U54 ( .A0(samples[5]), .A1(n30), .B0(n31), .Y(n21) );
  AOI21X2M U55 ( .A0(n23), .A1(n24), .B0(n25), .Y(n22) );
  INVX2M U56 ( .A(edge_cnt[1]), .Y(n5) );
  INVX2M U57 ( .A(edge_cnt[0]), .Y(n2) );
  NOR3X2M U58 ( .A(n2), .B(edge_cnt[2]), .C(n5), .Y(n38) );
  NOR2X2M U59 ( .A(n5), .B(edge_cnt[0]), .Y(n60) );
  NAND4X2M U60 ( .A(sampler_en), .B(edge_cnt[4]), .C(n38), .D(n8), .Y(n20) );
  OAI2BB1X2M U61 ( .A0N(n38), .A1N(n63), .B0(n73), .Y(n68) );
  NAND4X2M U62 ( .A(edge_cnt[2]), .B(n60), .C(n64), .D(n8), .Y(n73) );
  OAI21X2M U63 ( .A0(n69), .A1(n14), .B0(sampler_en), .Y(n37) );
  AOI222X1M U64 ( .A0(edge_cnt[3]), .A1(edge_cnt[4]), .B0(n7), .B1(n9), .C0(
        edge_cnt[2]), .C1(n8), .Y(n69) );
  INVX2M U65 ( .A(edge_cnt[4]), .Y(n9) );
  NAND2X2M U66 ( .A(edge_cnt[3]), .B(n7), .Y(n45) );
  NAND3X2M U67 ( .A(edge_cnt[0]), .B(n5), .C(edge_cnt[2]), .Y(n54) );
  INVX2M U68 ( .A(edge_cnt[2]), .Y(n7) );
  NAND2X2M U69 ( .A(edge_cnt[2]), .B(n50), .Y(n55) );
  OAI2BB1X2M U70 ( .A0N(n24), .A1N(samples[3]), .B0(n32), .Y(n30) );
  OAI21X2M U71 ( .A0(samples[3]), .A1(n24), .B0(samples[4]), .Y(n32) );
  NAND4X2M U72 ( .A(n63), .B(edge_cnt[2]), .C(n2), .D(n5), .Y(n62) );
  OAI2BB1X2M U73 ( .A0N(samples[0]), .A1N(samples[1]), .B0(n33), .Y(n24) );
  OAI21X2M U74 ( .A0(samples[0]), .A1(samples[1]), .B0(samples[2]), .Y(n33) );
  NAND3X2M U75 ( .A(edge_cnt[0]), .B(n8), .C(edge_cnt[1]), .Y(n61) );
  INVX2M U76 ( .A(edge_cnt[3]), .Y(n8) );
  AOI2B1X1M U77 ( .A1N(samples[5]), .A0(n10), .B0(n1), .Y(n31) );
  INVX2M U78 ( .A(samples[0]), .Y(n11) );
  NAND4BX1M U79 ( .AN(PRESCALE[4]), .B(PRESCALE[2]), .C(n18), .D(n16), .Y(n27)
         );
  NOR4X1M U80 ( .A(n16), .B(PRESCALE[2]), .C(PRESCALE[3]), .D(PRESCALE[4]), 
        .Y(n72) );
  INVX2M U81 ( .A(PRESCALE[5]), .Y(n16) );
  INVX2M U82 ( .A(PRESCALE[3]), .Y(n18) );
endmodule


module DESERIALIZER ( CLK, RST, sampled_bit, deser_en, bit_done, PARITY_EN, 
        bit_cnt, P_DATA, even_parity, odd_parity );
  input [3:0] bit_cnt;
  output [7:0] P_DATA;
  input CLK, RST, sampled_bit, deser_en, bit_done, PARITY_EN;
  output even_parity, odd_parity;
  wire   n5, n6, n8, n9, n11, n14, n16, n18, n20, n22, n24, n26, n28, n29, n30,
         n32, n33, n34, n35, n36, n39, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n1, n2, n3, n4, n7,
         n10, n12, n13, n15, n17, n19, n21;
  wire   [10:2] all_frame;

  DFFRQX2M \P_DATA_reg[7]  ( .D(n50), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(n49), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[5]  ( .D(n48), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n47), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n46), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n45), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n44), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[0]  ( .D(n43), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \all_frame_reg[5]  ( .D(n54), .CK(CLK), .RN(RST), .Q(all_frame[5])
         );
  DFFRQX2M \all_frame_reg[4]  ( .D(n53), .CK(CLK), .RN(RST), .Q(all_frame[4])
         );
  DFFRQX2M \all_frame_reg[8]  ( .D(n57), .CK(CLK), .RN(RST), .Q(all_frame[8])
         );
  DFFRX1M \all_frame_reg[9]  ( .D(n58), .CK(CLK), .RN(RST), .Q(n42), .QN(n7)
         );
  DFFRX1M \all_frame_reg[7]  ( .D(n56), .CK(CLK), .RN(RST), .QN(n12) );
  DFFRX1M \all_frame_reg[6]  ( .D(n55), .CK(CLK), .RN(RST), .Q(n39), .QN(n13)
         );
  DFFRX1M \all_frame_reg[3]  ( .D(n52), .CK(CLK), .RN(RST), .QN(n19) );
  DFFRX1M \all_frame_reg[2]  ( .D(n51), .CK(CLK), .RN(RST), .QN(n21) );
  DFFRX1M \all_frame_reg[10]  ( .D(n59), .CK(CLK), .RN(RST), .QN(n4) );
  INVX2M U3 ( .A(deser_en), .Y(n2) );
  NOR2BX2M U4 ( .AN(n5), .B(n6), .Y(even_parity) );
  NOR2X2M U5 ( .A(n5), .B(n6), .Y(odd_parity) );
  OAI22X1M U6 ( .A0(n1), .A1(n17), .B0(n15), .B1(n28), .Y(n53) );
  OAI22X1M U7 ( .A0(n1), .A1(n15), .B0(n13), .B1(n28), .Y(n54) );
  OAI22X1M U8 ( .A0(n1), .A1(n10), .B0(n7), .B1(n28), .Y(n57) );
  OAI22X1M U9 ( .A0(n1), .A1(n21), .B0(n19), .B1(n28), .Y(n51) );
  OAI22X1M U10 ( .A0(n1), .A1(n19), .B0(n17), .B1(n28), .Y(n52) );
  OAI22X1M U11 ( .A0(n1), .A1(n13), .B0(n12), .B1(n28), .Y(n55) );
  OAI22X1M U12 ( .A0(n1), .A1(n12), .B0(n10), .B1(n28), .Y(n56) );
  OAI22X1M U13 ( .A0(n1), .A1(n7), .B0(n4), .B1(n28), .Y(n58) );
  INVX2M U14 ( .A(n28), .Y(n1) );
  OAI221X1M U15 ( .A0(n17), .A1(n8), .B0(n19), .B1(n9), .C0(n14), .Y(n44) );
  NAND2X2M U16 ( .A(P_DATA[1]), .B(n2), .Y(n14) );
  OAI221X1M U17 ( .A0(n15), .A1(n8), .B0(n17), .B1(n9), .C0(n16), .Y(n45) );
  NAND2X2M U18 ( .A(P_DATA[2]), .B(n2), .Y(n16) );
  OAI221X1M U19 ( .A0(n13), .A1(n8), .B0(n15), .B1(n9), .C0(n18), .Y(n46) );
  NAND2X2M U20 ( .A(P_DATA[3]), .B(n2), .Y(n18) );
  OAI221X1M U21 ( .A0(n12), .A1(n8), .B0(n13), .B1(n9), .C0(n20), .Y(n47) );
  NAND2X2M U22 ( .A(P_DATA[4]), .B(n2), .Y(n20) );
  OAI221X1M U23 ( .A0(n10), .A1(n8), .B0(n12), .B1(n9), .C0(n22), .Y(n48) );
  NAND2X2M U24 ( .A(P_DATA[5]), .B(n2), .Y(n22) );
  OAI221X1M U25 ( .A0(n7), .A1(n8), .B0(n10), .B1(n9), .C0(n24), .Y(n49) );
  NAND2X2M U26 ( .A(P_DATA[6]), .B(n2), .Y(n24) );
  OAI221X1M U27 ( .A0(n4), .A1(n8), .B0(n7), .B1(n9), .C0(n26), .Y(n50) );
  NAND2X2M U28 ( .A(P_DATA[7]), .B(n2), .Y(n26) );
  OAI221X1M U29 ( .A0(n19), .A1(n8), .B0(n9), .B1(n21), .C0(n11), .Y(n43) );
  NAND2X2M U30 ( .A(P_DATA[0]), .B(n2), .Y(n11) );
  NAND2X2M U31 ( .A(PARITY_EN), .B(deser_en), .Y(n9) );
  NAND4X2M U32 ( .A(bit_done), .B(bit_cnt[3]), .C(n32), .D(bit_cnt[0]), .Y(n6)
         );
  NOR2X2M U33 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n32) );
  NAND2BX2M U34 ( .AN(PARITY_EN), .B(deser_en), .Y(n8) );
  XNOR2X2M U35 ( .A(n33), .B(n34), .Y(n5) );
  XOR3XLM U36 ( .A(n15), .B(n17), .C(n36), .Y(n33) );
  XOR3XLM U37 ( .A(n12), .B(n4), .C(n35), .Y(n34) );
  XNOR2X2M U38 ( .A(all_frame[8]), .B(n42), .Y(n36) );
  NAND2X2M U39 ( .A(bit_done), .B(n29), .Y(n28) );
  OAI21X2M U40 ( .A0(n30), .A1(bit_cnt[2]), .B0(bit_cnt[3]), .Y(n29) );
  AOI2B1X1M U41 ( .A1N(bit_cnt[0]), .A0(PARITY_EN), .B0(n3), .Y(n30) );
  INVX2M U42 ( .A(bit_cnt[1]), .Y(n3) );
  XNOR2X2M U43 ( .A(n19), .B(n39), .Y(n35) );
  OAI2BB2X1M U44 ( .B0(n1), .B1(n4), .A0N(sampled_bit), .A1N(n1), .Y(n59) );
  INVX2M U45 ( .A(all_frame[4]), .Y(n17) );
  INVX2M U46 ( .A(all_frame[5]), .Y(n15) );
  INVX2M U47 ( .A(all_frame[8]), .Y(n10) );
endmodule


module EDGE_BIT_COUNTER ( cnt_en, CLK, PRESCALE, deser_en, bit_cnt, edge_cnt, 
        bit_done, bit_over, data_done );
  input [5:0] PRESCALE;
  output [3:0] bit_cnt;
  output [4:0] edge_cnt;
  input cnt_en, CLK, deser_en;
  output bit_done, bit_over, data_done;
  wire   N9, N10, N11, N12, N13, N58, N59, N60, N61, n2, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         \add_19/carry[4] , \add_19/carry[3] , \add_19/carry[2] , n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n30, n31, n32;
  assign data_done = 1'b0;

  DFFTRX2M \edge_cnt_reg[4]  ( .D(N13), .RN(cnt_en), .CK(CLK), .Q(edge_cnt[4])
         );
  DFFTRX2M \edge_cnt_reg[3]  ( .D(N12), .RN(cnt_en), .CK(CLK), .Q(edge_cnt[3])
         );
  AND2X1M \edge_cnt_reg[2]/U2  ( .A(N11), .B(cnt_en), .Y(n4) );
  DFFQX1M \edge_cnt_reg[2]  ( .D(n4), .CK(CLK), .Q(edge_cnt[2]) );
  DFFTRX1M \edge_cnt_reg[1]  ( .D(N10), .RN(cnt_en), .CK(CLK), .Q(edge_cnt[1])
         );
  AND2X1M \edge_cnt_reg[0]/U2  ( .A(N9), .B(cnt_en), .Y(n3) );
  DFFTRX1M \edge_cnt_reg[0]  ( .D(1'b1), .RN(n3), .CK(CLK), .Q(edge_cnt[0]), 
        .QN(N9) );
  DFFX1M \bit_cnt_reg[0]  ( .D(N58), .CK(CLK), .Q(bit_cnt[0]), .QN(n7) );
  DFFX1M \bit_cnt_reg[3]  ( .D(N61), .CK(CLK), .Q(bit_cnt[3]), .QN(n10) );
  DFFX1M \bit_cnt_reg[2]  ( .D(N60), .CK(CLK), .Q(bit_cnt[2]), .QN(n9) );
  DFFX1M \bit_cnt_reg[1]  ( .D(N59), .CK(CLK), .Q(bit_cnt[1]), .QN(n8) );
  INVX2M U4 ( .A(edge_cnt[2]), .Y(n2) );
  INVX2M U5 ( .A(n26), .Y(n6) );
  INVX2M U6 ( .A(n24), .Y(n5) );
  INVX2M U7 ( .A(cnt_en), .Y(n11) );
  OAI21X2M U8 ( .A0(PRESCALE[2]), .A1(n12), .B0(n13), .Y(bit_done) );
  AOI33X2M U9 ( .A0(edge_cnt[2]), .A1(n14), .A2(n15), .B0(edge_cnt[3]), .B1(
        PRESCALE[4]), .B2(n16), .Y(n12) );
  NOR3X2M U10 ( .A(n17), .B(edge_cnt[0]), .C(PRESCALE[4]), .Y(n15) );
  NOR3X2M U11 ( .A(n6), .B(edge_cnt[2]), .C(PRESCALE[3]), .Y(n16) );
  AOI33X2M U12 ( .A0(edge_cnt[4]), .A1(PRESCALE[5]), .A2(n18), .B0(edge_cnt[1]), .B1(n30), .B2(PRESCALE[3]), .Y(n17) );
  INVX2M U13 ( .A(PRESCALE[5]), .Y(n30) );
  NOR3X2M U14 ( .A(PRESCALE[3]), .B(edge_cnt[3]), .C(edge_cnt[1]), .Y(n18) );
  NAND3X2M U15 ( .A(edge_cnt[0]), .B(n14), .C(edge_cnt[1]), .Y(n29) );
  NOR2X2M U16 ( .A(n29), .B(PRESCALE[5]), .Y(n26) );
  NAND4X2M U17 ( .A(PRESCALE[2]), .B(n26), .C(n32), .D(n31), .Y(n13) );
  OAI32X1M U18 ( .A0(n7), .A1(n5), .A2(n11), .B0(bit_cnt[0]), .B1(n24), .Y(N58) );
  OAI32X1M U19 ( .A0(n19), .A1(bit_cnt[3]), .A2(n20), .B0(n21), .B1(n10), .Y(
        N61) );
  AOI21X2M U20 ( .A0(n5), .A1(n20), .B0(n22), .Y(n21) );
  NAND2X2M U21 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n20) );
  OAI32X1M U22 ( .A0(n19), .A1(bit_cnt[2]), .A2(n8), .B0(n23), .B1(n9), .Y(N60) );
  AOI21X2M U23 ( .A0(n5), .A1(n8), .B0(n22), .Y(n23) );
  OAI22X1M U24 ( .A0(bit_cnt[0]), .A1(n24), .B0(n5), .B1(n11), .Y(n22) );
  NAND2X2M U25 ( .A(cnt_en), .B(bit_over), .Y(n24) );
  OAI31X1M U26 ( .A0(n2), .A1(PRESCALE[2]), .A2(n25), .B0(n13), .Y(bit_over)
         );
  AOI33X2M U27 ( .A0(n27), .A1(n32), .A2(edge_cnt[3]), .B0(n26), .B1(n31), 
        .B2(PRESCALE[3]), .Y(n25) );
  OAI32X1M U28 ( .A0(n28), .A1(PRESCALE[4]), .A2(n29), .B0(n6), .B1(n31), .Y(
        n27) );
  OAI2BB2X1M U29 ( .B0(bit_cnt[1]), .B1(n19), .A0N(n22), .A1N(bit_cnt[1]), .Y(
        N59) );
  NAND2X2M U30 ( .A(edge_cnt[4]), .B(PRESCALE[5]), .Y(n28) );
  NAND2X2M U31 ( .A(bit_cnt[0]), .B(n5), .Y(n19) );
  ADDHX1M U32 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_19/carry[2] ), .S(
        N10) );
  ADDHX1M U33 ( .A(edge_cnt[2]), .B(\add_19/carry[2] ), .CO(\add_19/carry[3] ), 
        .S(N11) );
  ADDHX1M U34 ( .A(edge_cnt[3]), .B(\add_19/carry[3] ), .CO(\add_19/carry[4] ), 
        .S(N12) );
  NOR2X2M U35 ( .A(PRESCALE[1]), .B(PRESCALE[0]), .Y(n14) );
  INVX2M U36 ( .A(PRESCALE[4]), .Y(n31) );
  INVX2M U37 ( .A(PRESCALE[3]), .Y(n32) );
  CLKXOR2X2M U38 ( .A(\add_19/carry[4] ), .B(edge_cnt[4]), .Y(N13) );
endmodule


module UART_RX ( CLK, RST, RX_IN, PARITY_EN, PARITY_TYPE, PRESCALE, P_DATA, 
        DATA_VALID, stop_err, par_err );
  input [5:0] PRESCALE;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, PARITY_EN, PARITY_TYPE;
  output DATA_VALID, stop_err, par_err;
  wire   PAR_err, strt_err, STOP_err, par_chk_en, strt_chk_en, stop_chk_en,
         bit_over, bit_done, deser_en, sampler_en, cnt_en, sampled_bit,
         even_parity, odd_parity, n1, n2;
  wire   [3:0] bit_cnt;
  wire   [4:0] edge_cnt;

  UART_RX_FSM U0_rx_fsm ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), .PARITY_EN(
        PARITY_EN), .par_err(PAR_err), .strt_err(strt_err), .bit_done(bit_done), .bit_over(bit_over), .stop_err(STOP_err), .data_done(1'b0), .edge_cnt(
        edge_cnt), .bit_cnt(bit_cnt), .par_chk_en(par_chk_en), .strt_chk_en(
        strt_chk_en), .stop_chk_en(stop_chk_en), .deser_en(deser_en), 
        .DATA_VALID(DATA_VALID), .cnt_en(cnt_en), .sampler_en(sampler_en) );
  PARITY_CHECKER U0_parity_checker ( .CLK(CLK), .RST(n1), .bit_cnt(bit_cnt), 
        .par_chk_en(par_chk_en), .sampled_bit(sampled_bit), .PARITY_TYPE(
        PARITY_TYPE), .odd_parity(odd_parity), .even_parity(even_parity), 
        .bit_done(bit_done), .par_err(PAR_err), .PAR_err(par_err) );
  START_CHECKER U0_start_checker ( .CLK(CLK), .RST(n1), .strt_chk_en(
        strt_chk_en), .sampled_bit(sampled_bit), .bit_done(bit_done), 
        .strt_err(strt_err) );
  STOP_CHECKER U0_stop_checker ( .CLK(CLK), .RST(n1), .stop_chk_en(stop_chk_en), .sampled_bit(sampled_bit), .bit_done(bit_done), .stop_err(STOP_err), 
        .STOP_err(stop_err) );
  DATA_SAMPLER U0_data_sampler ( .CLK(CLK), .RST(n1), .edge_cnt(edge_cnt), 
        .sampler_en(sampler_en), .RX_IN(RX_IN), .PRESCALE(PRESCALE), 
        .sampled_bit(sampled_bit) );
  DESERIALIZER U0_deserializer ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), .deser_en(deser_en), .bit_done(bit_done), .PARITY_EN(PARITY_EN), .bit_cnt(
        bit_cnt), .P_DATA(P_DATA), .even_parity(even_parity), .odd_parity(
        odd_parity) );
  EDGE_BIT_COUNTER U0_edge_bit_counter ( .cnt_en(cnt_en), .CLK(CLK), 
        .PRESCALE(PRESCALE), .deser_en(deser_en), .bit_cnt(bit_cnt), 
        .edge_cnt(edge_cnt), .bit_done(bit_done), .bit_over(bit_over) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error;
  wire   n1, n2;

  UART_TX_DATA_WIDTH8 U0_UART_TX ( .P_DATA(TX_IN_P), .DATA_VALID(TX_IN_V), 
        .PAR_EN(parity_enable), .PAR_TYP(parity_type), .CLK(TX_CLK), .RST(n1), 
        .TX_OUT(TX_OUT_S), .BUSY(TX_OUT_V) );
  UART_RX U0_UART_RX ( .CLK(RX_CLK), .RST(n1), .RX_IN(RX_IN_S), .PARITY_EN(
        parity_enable), .PARITY_TYPE(parity_type), .PRESCALE(Prescale), 
        .P_DATA(RX_OUT_P), .DATA_VALID(RX_OUT_V), .stop_err(framing_error), 
        .par_err(parity_error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module SYS_CTRL ( CLK, RST, RX_DATA, RX_valid, FIFO_FULL, FIFO_wr_inc, 
        FIFO_wr_data, Reg_wr_en, Reg_ADDR, Reg_wr_data, Reg_rd_en, Reg_rd_data, 
        Reg_data_valid, ALU_out, ALU_out_valid, ALU_en, ALU_FUN, CLK_DIV_EN, 
        ALU_GATE_EN );
  input [7:0] RX_DATA;
  output [7:0] FIFO_wr_data;
  output [3:0] Reg_ADDR;
  output [7:0] Reg_wr_data;
  input [7:0] Reg_rd_data;
  input [15:0] ALU_out;
  output [3:0] ALU_FUN;
  input CLK, RST, RX_valid, FIFO_FULL, Reg_data_valid, ALU_out_valid;
  output FIFO_wr_inc, Reg_wr_en, Reg_rd_en, ALU_en, CLK_DIV_EN, ALU_GATE_EN;
  wire   N55, N56, N57, N58, N59, N60, N61, N62, N64, N65, N66, N67, N69, N70,
         N71, N72, N257, N258, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n113, n114, n115, n116, n117;
  wire   [3:0] NS;
  wire   [3:0] CS;
  wire   [3:0] alu_fun;
  assign CLK_DIV_EN = 1'b1;
  assign ALU_en = N257;
  assign ALU_GATE_EN = N258;

  DFFRX1M \rf_addr_reg[2]  ( .D(N66), .CK(CLK), .RN(RST), .QN(n10) );
  DFFRX1M \rf_data_reg[7]  ( .D(N62), .CK(CLK), .RN(RST), .QN(n1) );
  DFFRX1M \rf_data_reg[6]  ( .D(N61), .CK(CLK), .RN(RST), .QN(n2) );
  DFFRX1M \rf_data_reg[5]  ( .D(N60), .CK(CLK), .RN(RST), .QN(n3) );
  DFFRX1M \rf_data_reg[4]  ( .D(N59), .CK(CLK), .RN(RST), .QN(n4) );
  DFFRX1M \rf_data_reg[3]  ( .D(N58), .CK(CLK), .RN(RST), .QN(n5) );
  DFFRX1M \rf_data_reg[2]  ( .D(N57), .CK(CLK), .RN(RST), .QN(n6) );
  DFFRX1M \rf_data_reg[1]  ( .D(N56), .CK(CLK), .RN(RST), .QN(n7) );
  DFFRX1M \rf_data_reg[0]  ( .D(N55), .CK(CLK), .RN(RST), .QN(n8) );
  DFFRQX2M \alu_fun_reg[3]  ( .D(N72), .CK(CLK), .RN(RST), .Q(alu_fun[3]) );
  DFFRQX2M \alu_fun_reg[2]  ( .D(N71), .CK(CLK), .RN(RST), .Q(alu_fun[2]) );
  DFFRQX2M \alu_fun_reg[1]  ( .D(N70), .CK(CLK), .RN(RST), .Q(alu_fun[1]) );
  DFFRQX2M \alu_fun_reg[0]  ( .D(N69), .CK(CLK), .RN(RST), .Q(alu_fun[0]) );
  DFFRX1M \rf_addr_reg[0]  ( .D(N64), .CK(CLK), .RN(RST), .QN(n12) );
  DFFRX1M \rf_addr_reg[3]  ( .D(N67), .CK(CLK), .RN(RST), .QN(n9) );
  DFFRX1M \rf_addr_reg[1]  ( .D(N65), .CK(CLK), .RN(RST), .QN(n11) );
  DFFRQX2M \CS_reg[2]  ( .D(NS[2]), .CK(CLK), .RN(RST), .Q(CS[2]) );
  DFFRQX2M \CS_reg[1]  ( .D(NS[1]), .CK(CLK), .RN(RST), .Q(CS[1]) );
  DFFRQX2M \CS_reg[0]  ( .D(NS[0]), .CK(CLK), .RN(RST), .Q(CS[0]) );
  DFFRQX2M \CS_reg[3]  ( .D(NS[3]), .CK(CLK), .RN(RST), .Q(CS[3]) );
  OAI22X1M U3 ( .A0(n14), .A1(n36), .B0(n55), .B1(n35), .Y(N257) );
  OAI211X2M U4 ( .A0(ALU_out_valid), .A1(n59), .B0(n66), .C0(n67), .Y(NS[0])
         );
  NOR2X2M U5 ( .A(n14), .B(CS[0]), .Y(n55) );
  BUFX2M U6 ( .A(CS[2]), .Y(n14) );
  NOR2X2M U7 ( .A(n51), .B(n10), .Y(Reg_ADDR[2]) );
  NAND4BBX1M U8 ( .AN(n91), .BN(n53), .C(n75), .D(n92), .Y(NS[1]) );
  INVX2M U9 ( .A(n62), .Y(n26) );
  INVX2M U10 ( .A(n47), .Y(n33) );
  INVX2M U11 ( .A(Reg_rd_en), .Y(n25) );
  NOR3X2M U12 ( .A(n38), .B(n39), .C(n27), .Y(n62) );
  AND3X2M U13 ( .A(n52), .B(n25), .C(n17), .Y(n51) );
  NOR2X2M U14 ( .A(n34), .B(n36), .Y(n47) );
  NAND2X2M U15 ( .A(n90), .B(n26), .Y(Reg_rd_en) );
  INVX2M U16 ( .A(n16), .Y(n18) );
  INVX2M U17 ( .A(n68), .Y(n30) );
  INVX2M U18 ( .A(n58), .Y(n29) );
  INVX2M U19 ( .A(n60), .Y(n20) );
  OR3X2M U20 ( .A(n78), .B(n32), .C(n15), .Y(n110) );
  INVX2M U21 ( .A(n112), .Y(n36) );
  INVX2M U22 ( .A(n111), .Y(n35) );
  BUFX2M U23 ( .A(n49), .Y(n17) );
  NOR3BX2M U24 ( .AN(n46), .B(n53), .C(n54), .Y(n49) );
  INVX2M U25 ( .A(n89), .Y(n32) );
  NAND3BX2M U26 ( .AN(n15), .B(n88), .C(n89), .Y(FIFO_wr_inc) );
  NAND3BX2M U27 ( .AN(NS[1]), .B(n90), .C(Reg_rd_en), .Y(n88) );
  INVX2M U28 ( .A(FIFO_FULL), .Y(n24) );
  NOR3X2M U29 ( .A(n35), .B(n14), .C(n31), .Y(n58) );
  NOR3X2M U30 ( .A(n36), .B(n38), .C(n31), .Y(n68) );
  NOR2X2M U31 ( .A(n48), .B(n47), .Y(n50) );
  NOR3X2M U32 ( .A(n13), .B(n14), .C(n27), .Y(n54) );
  NOR2X2M U33 ( .A(n37), .B(n39), .Y(n111) );
  NAND4X2M U34 ( .A(n57), .B(NS[3]), .C(NS[0]), .D(NS[1]), .Y(n56) );
  OAI2BB2X1M U35 ( .B0(NS[2]), .B1(n58), .A0N(n59), .A1N(NS[2]), .Y(n57) );
  NOR3X2M U36 ( .A(n39), .B(n14), .C(n27), .Y(n53) );
  NAND4X2M U37 ( .A(n61), .B(NS[0]), .C(NS[1]), .D(n21), .Y(n60) );
  OAI22X1M U38 ( .A0(NS[2]), .A1(n53), .B0(n62), .B1(n22), .Y(n61) );
  NOR2X2M U39 ( .A(n37), .B(n13), .Y(n112) );
  OAI21X2M U40 ( .A0(n44), .A1(n45), .B0(n46), .Y(Reg_wr_en) );
  AOI21X2M U41 ( .A0(n47), .A1(NS[0]), .B0(n48), .Y(n44) );
  NAND2X2M U42 ( .A(n111), .B(n55), .Y(n72) );
  NOR2X2M U43 ( .A(ALU_FUN[3]), .B(ALU_FUN[2]), .Y(n82) );
  NAND2X2M U44 ( .A(n111), .B(n87), .Y(n80) );
  INVX2M U45 ( .A(n83), .Y(ALU_FUN[0]) );
  INVX2M U46 ( .A(NS[0]), .Y(n19) );
  NAND3X2M U47 ( .A(n13), .B(n37), .C(n87), .Y(n52) );
  NAND4X2M U48 ( .A(n30), .B(n29), .C(n72), .D(n59), .Y(n78) );
  NAND2X2M U49 ( .A(n112), .B(n55), .Y(n89) );
  NAND3X2M U50 ( .A(n14), .B(n39), .C(n109), .Y(n90) );
  NAND3X2M U51 ( .A(n55), .B(n37), .C(n13), .Y(n46) );
  INVX2M U52 ( .A(n109), .Y(n27) );
  INVX2M U53 ( .A(n87), .Y(n34) );
  INVX2M U54 ( .A(n13), .Y(n39) );
  AND4X2M U55 ( .A(n115), .B(n42), .C(n94), .D(n95), .Y(n86) );
  NOR3X2M U56 ( .A(n117), .B(n114), .C(n41), .Y(n95) );
  BUFX2M U57 ( .A(n63), .Y(n16) );
  OAI31X1M U58 ( .A0(n45), .A1(NS[1]), .A2(n64), .B0(n65), .Y(n63) );
  AOI22X1M U59 ( .A0(n33), .A1(n19), .B0(NS[0]), .B1(n30), .Y(n64) );
  NAND4X2M U60 ( .A(NS[1]), .B(n19), .C(n22), .D(n21), .Y(n65) );
  INVX2M U61 ( .A(n14), .Y(n38) );
  INVX2M U62 ( .A(NS[3]), .Y(n21) );
  NAND2X2M U63 ( .A(NS[2]), .B(NS[3]), .Y(n45) );
  BUFX2M U64 ( .A(n81), .Y(n15) );
  OAI31X1M U65 ( .A0(n31), .A1(n14), .A2(n36), .B0(n80), .Y(n81) );
  INVX2M U66 ( .A(NS[2]), .Y(n22) );
  OAI21X2M U67 ( .A0(n13), .A1(n34), .B0(n37), .Y(N258) );
  OAI21X2M U68 ( .A0(n25), .A1(n8), .B0(n108), .Y(FIFO_wr_data[0]) );
  AOI22X1M U69 ( .A0(ALU_out[0]), .A1(n15), .B0(ALU_out[8]), .B1(n32), .Y(n108) );
  OAI21X2M U70 ( .A0(n25), .A1(n7), .B0(n107), .Y(FIFO_wr_data[1]) );
  AOI22X1M U71 ( .A0(ALU_out[1]), .A1(n15), .B0(ALU_out[9]), .B1(n32), .Y(n107) );
  OAI21X2M U72 ( .A0(n25), .A1(n6), .B0(n106), .Y(FIFO_wr_data[2]) );
  AOI22X1M U73 ( .A0(ALU_out[2]), .A1(n15), .B0(ALU_out[10]), .B1(n32), .Y(
        n106) );
  OAI21X2M U74 ( .A0(n25), .A1(n5), .B0(n105), .Y(FIFO_wr_data[3]) );
  AOI22X1M U75 ( .A0(ALU_out[3]), .A1(n15), .B0(ALU_out[11]), .B1(n32), .Y(
        n105) );
  OAI21X2M U76 ( .A0(n25), .A1(n4), .B0(n104), .Y(FIFO_wr_data[4]) );
  AOI22X1M U77 ( .A0(ALU_out[4]), .A1(n15), .B0(ALU_out[12]), .B1(n32), .Y(
        n104) );
  OAI21X2M U78 ( .A0(n25), .A1(n3), .B0(n103), .Y(FIFO_wr_data[5]) );
  AOI22X1M U79 ( .A0(ALU_out[5]), .A1(n15), .B0(ALU_out[13]), .B1(n32), .Y(
        n103) );
  OAI21X2M U80 ( .A0(n25), .A1(n2), .B0(n102), .Y(FIFO_wr_data[6]) );
  AOI22X1M U81 ( .A0(ALU_out[6]), .A1(n15), .B0(ALU_out[14]), .B1(n32), .Y(
        n102) );
  OAI21X2M U82 ( .A0(n25), .A1(n1), .B0(n101), .Y(FIFO_wr_data[7]) );
  AOI22X1M U83 ( .A0(ALU_out[7]), .A1(n15), .B0(ALU_out[15]), .B1(n32), .Y(
        n101) );
  AOI21BX2M U84 ( .A0(RX_valid), .A1(n93), .B0N(n72), .Y(n92) );
  OAI221X1M U85 ( .A0(Reg_data_valid), .A1(n26), .B0(ALU_out_valid), .B1(n29), 
        .C0(n23), .Y(n91) );
  OAI21X2M U86 ( .A0(n14), .A1(n27), .B0(n30), .Y(n93) );
  INVX2M U87 ( .A(n96), .Y(n23) );
  OAI211X2M U88 ( .A0(n24), .A1(n80), .B0(n97), .C0(n98), .Y(n96) );
  AND2X2M U89 ( .A(n59), .B(n52), .Y(n98) );
  NAND4X2M U90 ( .A(RX_DATA[4]), .B(RX_DATA[0]), .C(n73), .D(n99), .Y(n97) );
  NOR4X1M U91 ( .A(n58), .B(n62), .C(n68), .D(n54), .Y(n67) );
  AOI32X1M U92 ( .A0(n69), .A1(n38), .A2(CS[0]), .B0(RX_valid), .B1(n70), .Y(
        n66) );
  NAND4X2M U93 ( .A(n71), .B(n33), .C(n52), .D(n72), .Y(n70) );
  NOR2X4M U94 ( .A(n51), .B(n9), .Y(Reg_ADDR[3]) );
  NOR3X2M U95 ( .A(n13), .B(CS[3]), .C(n34), .Y(n48) );
  NOR2X2M U96 ( .A(n38), .B(CS[0]), .Y(n87) );
  NOR3X2M U97 ( .A(n117), .B(RX_DATA[6]), .C(RX_DATA[2]), .Y(n99) );
  NAND4X2M U98 ( .A(n33), .B(n75), .C(n76), .D(n77), .Y(NS[3]) );
  AOI211X2M U99 ( .A0(n48), .A1(RX_valid), .B0(n78), .C0(n79), .Y(n77) );
  NAND4X2M U100 ( .A(ALU_FUN[1]), .B(n15), .C(n82), .D(n83), .Y(n76) );
  AOI21X2M U101 ( .A0(n36), .A1(n80), .B0(n24), .Y(n79) );
  OAI22X1M U102 ( .A0(RX_valid), .A1(CS[3]), .B0(n13), .B1(n24), .Y(n69) );
  NAND3X2M U103 ( .A(n23), .B(n50), .C(n84), .Y(NS[2]) );
  AOI211X2M U104 ( .A0(n85), .A1(n86), .B0(n62), .C0(n68), .Y(n84) );
  NOR2X2M U105 ( .A(RX_DATA[4]), .B(RX_DATA[0]), .Y(n85) );
  AND2X2M U106 ( .A(alu_fun[3]), .B(n110), .Y(ALU_FUN[3]) );
  OAI22X1M U107 ( .A0(n18), .A1(n116), .B0(n8), .B1(n16), .Y(N55) );
  OAI22X1M U108 ( .A0(n18), .A1(n115), .B0(n7), .B1(n16), .Y(N56) );
  OAI22X1M U109 ( .A0(n18), .A1(n114), .B0(n6), .B1(n16), .Y(N57) );
  OAI22X1M U110 ( .A0(n18), .A1(n113), .B0(n5), .B1(n16), .Y(N58) );
  OAI22X1M U111 ( .A0(n18), .A1(n43), .B0(n4), .B1(n16), .Y(N59) );
  OAI22X1M U112 ( .A0(n18), .A1(n42), .B0(n3), .B1(n16), .Y(N60) );
  OAI22X1M U113 ( .A0(n18), .A1(n41), .B0(n2), .B1(n16), .Y(N61) );
  OAI22X1M U114 ( .A0(n18), .A1(n40), .B0(n1), .B1(n16), .Y(N62) );
  OAI22X1M U115 ( .A0(n115), .A1(n60), .B0(n20), .B1(n11), .Y(N65) );
  OAI22X1M U116 ( .A0(n114), .A1(n60), .B0(n20), .B1(n10), .Y(N66) );
  OAI22X1M U117 ( .A0(n113), .A1(n60), .B0(n20), .B1(n9), .Y(N67) );
  OAI22X1M U118 ( .A0(n116), .A1(n60), .B0(n20), .B1(n12), .Y(N64) );
  AND2X2M U119 ( .A(alu_fun[2]), .B(n110), .Y(ALU_FUN[2]) );
  NOR2X2M U120 ( .A(n31), .B(CS[3]), .Y(n109) );
  NAND3X2M U121 ( .A(n111), .B(n14), .C(CS[0]), .Y(n59) );
  AND3X2M U122 ( .A(n94), .B(RX_DATA[1]), .C(RX_DATA[5]), .Y(n73) );
  INVX2M U123 ( .A(CS[3]), .Y(n37) );
  OAI2BB2X1M U124 ( .B0(n116), .B1(n56), .A0N(n56), .A1N(alu_fun[0]), .Y(N69)
         );
  OAI2BB2X1M U125 ( .B0(n115), .B1(n56), .A0N(n56), .A1N(alu_fun[1]), .Y(N70)
         );
  OAI2BB2X1M U126 ( .B0(n114), .B1(n56), .A0N(n56), .A1N(alu_fun[2]), .Y(N71)
         );
  OAI2BB2X1M U127 ( .B0(n113), .B1(n56), .A0N(n56), .A1N(alu_fun[3]), .Y(N72)
         );
  AND2X2M U128 ( .A(alu_fun[1]), .B(n110), .Y(ALU_FUN[1]) );
  INVX2M U129 ( .A(CS[0]), .Y(n31) );
  BUFX2M U130 ( .A(CS[1]), .Y(n13) );
  NAND3X2M U131 ( .A(RX_DATA[0]), .B(n86), .C(RX_DATA[4]), .Y(n75) );
  INVX2M U132 ( .A(RX_DATA[2]), .Y(n114) );
  NAND2X2M U133 ( .A(alu_fun[0]), .B(n110), .Y(n83) );
  NAND3X2M U134 ( .A(n73), .B(n116), .C(n74), .Y(n71) );
  NOR3X2M U135 ( .A(RX_DATA[2]), .B(RX_DATA[6]), .C(RX_DATA[4]), .Y(n74) );
  INVX2M U136 ( .A(RX_DATA[6]), .Y(n41) );
  INVX2M U137 ( .A(RX_DATA[1]), .Y(n115) );
  INVX2M U138 ( .A(RX_valid), .Y(n117) );
  AND4X2M U139 ( .A(RX_DATA[7]), .B(RX_DATA[3]), .C(n100), .D(n55), .Y(n94) );
  NOR2X2M U140 ( .A(CS[3]), .B(n13), .Y(n100) );
  INVX2M U141 ( .A(RX_DATA[5]), .Y(n42) );
  OAI21X2M U142 ( .A0(n51), .A1(n12), .B0(n33), .Y(Reg_ADDR[0]) );
  NOR2X2M U143 ( .A(n51), .B(n11), .Y(Reg_ADDR[1]) );
  OAI22X1M U144 ( .A0(n17), .A1(n8), .B0(n50), .B1(n116), .Y(Reg_wr_data[0])
         );
  OAI22X1M U145 ( .A0(n17), .A1(n7), .B0(n50), .B1(n115), .Y(Reg_wr_data[1])
         );
  OAI22X1M U146 ( .A0(n17), .A1(n6), .B0(n50), .B1(n114), .Y(Reg_wr_data[2])
         );
  OAI22X1M U147 ( .A0(n17), .A1(n5), .B0(n50), .B1(n113), .Y(Reg_wr_data[3])
         );
  OAI22X1M U148 ( .A0(n17), .A1(n4), .B0(n50), .B1(n43), .Y(Reg_wr_data[4]) );
  OAI22X1M U149 ( .A0(n17), .A1(n3), .B0(n50), .B1(n42), .Y(Reg_wr_data[5]) );
  OAI22X1M U150 ( .A0(n17), .A1(n2), .B0(n50), .B1(n41), .Y(Reg_wr_data[6]) );
  OAI22X1M U151 ( .A0(n17), .A1(n1), .B0(n50), .B1(n40), .Y(Reg_wr_data[7]) );
  INVX2M U152 ( .A(RX_DATA[0]), .Y(n116) );
  INVX2M U153 ( .A(RX_DATA[4]), .Y(n43) );
  INVX2M U154 ( .A(RX_DATA[3]), .Y(n113) );
  INVX2M U155 ( .A(RX_DATA[7]), .Y(n40) );
endmodule


module RegFile ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, RdData_VLD, 
        REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_VLD;
  wire   N11, N12, N13, N14, \regArr[15][7] , \regArr[15][6] , \regArr[15][5] ,
         \regArr[15][4] , \regArr[15][3] , \regArr[15][2] , \regArr[15][1] ,
         \regArr[15][0] , \regArr[14][7] , \regArr[14][6] , \regArr[14][5] ,
         \regArr[14][4] , \regArr[14][3] , \regArr[14][2] , \regArr[14][1] ,
         \regArr[14][0] , \regArr[13][7] , \regArr[13][6] , \regArr[13][5] ,
         \regArr[13][4] , \regArr[13][3] , \regArr[13][2] , \regArr[13][1] ,
         \regArr[13][0] , \regArr[12][7] , \regArr[12][6] , \regArr[12][5] ,
         \regArr[12][4] , \regArr[12][3] , \regArr[12][2] , \regArr[12][1] ,
         \regArr[12][0] , \regArr[11][7] , \regArr[11][6] , \regArr[11][5] ,
         \regArr[11][4] , \regArr[11][3] , \regArr[11][2] , \regArr[11][1] ,
         \regArr[11][0] , \regArr[10][7] , \regArr[10][6] , \regArr[10][5] ,
         \regArr[10][4] , \regArr[10][3] , \regArr[10][2] , \regArr[10][1] ,
         \regArr[10][0] , \regArr[9][7] , \regArr[9][6] , \regArr[9][5] ,
         \regArr[9][4] , \regArr[9][3] , \regArr[9][2] , \regArr[9][1] ,
         \regArr[9][0] , \regArr[8][7] , \regArr[8][6] , \regArr[8][5] ,
         \regArr[8][4] , \regArr[8][3] , \regArr[8][2] , \regArr[8][1] ,
         \regArr[8][0] , \regArr[7][7] , \regArr[7][6] , \regArr[7][5] ,
         \regArr[7][4] , \regArr[7][3] , \regArr[7][2] , \regArr[7][1] ,
         \regArr[7][0] , \regArr[6][7] , \regArr[6][6] , \regArr[6][5] ,
         \regArr[6][4] , \regArr[6][3] , \regArr[6][2] , \regArr[6][1] ,
         \regArr[6][0] , \regArr[5][7] , \regArr[5][6] , \regArr[5][5] ,
         \regArr[5][4] , \regArr[5][3] , \regArr[5][2] , \regArr[5][1] ,
         \regArr[5][0] , \regArr[4][7] , \regArr[4][6] , \regArr[4][5] ,
         \regArr[4][4] , \regArr[4][3] , \regArr[4][2] , \regArr[4][1] ,
         \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRQX2M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n206), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n206), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n206), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n206), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n206), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n206), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n206), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n210), .Q(RdData[0]) );
  DFFRQX2M \regArr_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n214), .Q(
        \regArr[13][7] ) );
  DFFRQX2M \regArr_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n214), .Q(
        \regArr[13][6] ) );
  DFFRQX2M \regArr_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n213), .Q(
        \regArr[13][5] ) );
  DFFRQX2M \regArr_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n213), .Q(
        \regArr[13][4] ) );
  DFFRQX2M \regArr_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n213), .Q(
        \regArr[13][3] ) );
  DFFRQX2M \regArr_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n213), .Q(
        \regArr[13][2] ) );
  DFFRQX2M \regArr_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n213), .Q(
        \regArr[13][1] ) );
  DFFRQX2M \regArr_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n213), .Q(
        \regArr[13][0] ) );
  DFFRQX2M \regArr_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n211), .Q(
        \regArr[9][7] ) );
  DFFRQX2M \regArr_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n211), .Q(
        \regArr[9][6] ) );
  DFFRQX2M \regArr_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n211), .Q(
        \regArr[9][5] ) );
  DFFRQX2M \regArr_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n211), .Q(
        \regArr[9][4] ) );
  DFFRQX2M \regArr_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n211), .Q(
        \regArr[9][3] ) );
  DFFRQX2M \regArr_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n211), .Q(
        \regArr[9][2] ) );
  DFFRQX2M \regArr_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n211), .Q(
        \regArr[9][1] ) );
  DFFRQX2M \regArr_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n211), .Q(
        \regArr[9][0] ) );
  DFFRQX2M \regArr_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n209), .Q(
        \regArr[5][7] ) );
  DFFRQX2M \regArr_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n209), .Q(
        \regArr[5][6] ) );
  DFFRQX2M \regArr_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n209), .Q(
        \regArr[5][5] ) );
  DFFRQX2M \regArr_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n209), .Q(
        \regArr[5][4] ) );
  DFFRQX2M \regArr_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n209), .Q(
        \regArr[5][3] ) );
  DFFRQX2M \regArr_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n209), .Q(
        \regArr[5][2] ) );
  DFFRQX2M \regArr_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n209), .Q(
        \regArr[5][1] ) );
  DFFRQX2M \regArr_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n209), .Q(
        \regArr[5][0] ) );
  DFFRQX2M \regArr_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n206), .Q(
        \regArr[15][7] ) );
  DFFRQX2M \regArr_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n215), .Q(
        \regArr[15][6] ) );
  DFFRQX2M \regArr_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n215), .Q(
        \regArr[15][5] ) );
  DFFRQX2M \regArr_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n214), .Q(
        \regArr[15][4] ) );
  DFFRQX2M \regArr_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n214), .Q(
        \regArr[15][3] ) );
  DFFRQX2M \regArr_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n214), .Q(
        \regArr[15][2] ) );
  DFFRQX2M \regArr_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n214), .Q(
        \regArr[15][1] ) );
  DFFRQX2M \regArr_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n214), .Q(
        \regArr[15][0] ) );
  DFFRQX2M \regArr_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n213), .Q(
        \regArr[11][7] ) );
  DFFRQX2M \regArr_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n212), .Q(
        \regArr[11][6] ) );
  DFFRQX2M \regArr_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n212), .Q(
        \regArr[11][5] ) );
  DFFRQX2M \regArr_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n212), .Q(
        \regArr[11][4] ) );
  DFFRQX2M \regArr_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n212), .Q(
        \regArr[11][3] ) );
  DFFRQX2M \regArr_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n212), .Q(
        \regArr[11][2] ) );
  DFFRQX2M \regArr_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n212), .Q(
        \regArr[11][1] ) );
  DFFRQX2M \regArr_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n212), .Q(
        \regArr[11][0] ) );
  DFFRQX2M \regArr_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n210), .Q(
        \regArr[7][7] ) );
  DFFRQX2M \regArr_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n210), .Q(
        \regArr[7][6] ) );
  DFFRQX2M \regArr_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n210), .Q(
        \regArr[7][5] ) );
  DFFRQX2M \regArr_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n210), .Q(
        \regArr[7][4] ) );
  DFFRQX2M \regArr_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n210), .Q(
        \regArr[7][3] ) );
  DFFRQX2M \regArr_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n210), .Q(
        \regArr[7][2] ) );
  DFFRQX2M \regArr_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n210), .Q(
        \regArr[7][1] ) );
  DFFRQX2M \regArr_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n210), .Q(
        \regArr[7][0] ) );
  DFFRQX2M \regArr_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n214), .Q(
        \regArr[14][7] ) );
  DFFRQX2M \regArr_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n214), .Q(
        \regArr[14][6] ) );
  DFFRQX2M \regArr_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n214), .Q(
        \regArr[14][5] ) );
  DFFRQX2M \regArr_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n214), .Q(
        \regArr[14][4] ) );
  DFFRQX2M \regArr_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n214), .Q(
        \regArr[14][3] ) );
  DFFRQX2M \regArr_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n214), .Q(
        \regArr[14][2] ) );
  DFFRQX2M \regArr_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n214), .Q(
        \regArr[14][1] ) );
  DFFRQX2M \regArr_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n214), .Q(
        \regArr[14][0] ) );
  DFFRQX2M \regArr_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n212), .Q(
        \regArr[10][7] ) );
  DFFRQX2M \regArr_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n212), .Q(
        \regArr[10][6] ) );
  DFFRQX2M \regArr_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n212), .Q(
        \regArr[10][5] ) );
  DFFRQX2M \regArr_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n212), .Q(
        \regArr[10][4] ) );
  DFFRQX2M \regArr_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n212), .Q(
        \regArr[10][3] ) );
  DFFRQX2M \regArr_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n212), .Q(
        \regArr[10][2] ) );
  DFFRQX2M \regArr_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n212), .Q(
        \regArr[10][1] ) );
  DFFRQX2M \regArr_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n212), .Q(
        \regArr[10][0] ) );
  DFFRQX2M \regArr_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n210), .Q(
        \regArr[6][7] ) );
  DFFRQX2M \regArr_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n210), .Q(
        \regArr[6][6] ) );
  DFFRQX2M \regArr_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n210), .Q(
        \regArr[6][5] ) );
  DFFRQX2M \regArr_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n210), .Q(
        \regArr[6][4] ) );
  DFFRQX2M \regArr_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n210), .Q(
        \regArr[6][3] ) );
  DFFRQX2M \regArr_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n209), .Q(
        \regArr[6][2] ) );
  DFFRQX2M \regArr_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n209), .Q(
        \regArr[6][1] ) );
  DFFRQX2M \regArr_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n209), .Q(
        \regArr[6][0] ) );
  DFFRQX2M \regArr_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n213), .Q(
        \regArr[12][7] ) );
  DFFRQX2M \regArr_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n213), .Q(
        \regArr[12][6] ) );
  DFFRQX2M \regArr_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n213), .Q(
        \regArr[12][5] ) );
  DFFRQX2M \regArr_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n213), .Q(
        \regArr[12][4] ) );
  DFFRQX2M \regArr_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n213), .Q(
        \regArr[12][3] ) );
  DFFRQX2M \regArr_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n213), .Q(
        \regArr[12][2] ) );
  DFFRQX2M \regArr_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n213), .Q(
        \regArr[12][1] ) );
  DFFRQX2M \regArr_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n213), .Q(
        \regArr[12][0] ) );
  DFFRQX2M \regArr_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n211), .Q(
        \regArr[8][7] ) );
  DFFRQX2M \regArr_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n211), .Q(
        \regArr[8][6] ) );
  DFFRQX2M \regArr_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n211), .Q(
        \regArr[8][5] ) );
  DFFRQX2M \regArr_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n211), .Q(
        \regArr[8][4] ) );
  DFFRQX2M \regArr_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n211), .Q(
        \regArr[8][3] ) );
  DFFRQX2M \regArr_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n211), .Q(
        \regArr[8][2] ) );
  DFFRQX2M \regArr_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n211), .Q(
        \regArr[8][1] ) );
  DFFRQX2M \regArr_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n210), .Q(
        \regArr[8][0] ) );
  DFFRQX2M \regArr_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n209), .Q(
        \regArr[4][7] ) );
  DFFRQX2M \regArr_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n209), .Q(
        \regArr[4][6] ) );
  DFFRQX2M \regArr_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n209), .Q(
        \regArr[4][5] ) );
  DFFRQX2M \regArr_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n209), .Q(
        \regArr[4][4] ) );
  DFFRQX2M \regArr_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n208), .Q(
        \regArr[4][3] ) );
  DFFRQX2M \regArr_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n208), .Q(
        \regArr[4][2] ) );
  DFFRQX2M \regArr_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n208), .Q(
        \regArr[4][1] ) );
  DFFRQX2M \regArr_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n208), .Q(
        \regArr[4][0] ) );
  DFFRQX2M \regArr_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n208), .Q(REG3[0]) );
  DFFRQX2M \regArr_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n208), .Q(REG3[4]) );
  DFFRQX2M \regArr_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n208), .Q(REG3[2]) );
  DFFRQX2M \regArr_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n208), .Q(REG3[3]) );
  DFFRQX2M \regArr_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n208), .Q(REG3[6]) );
  DFFRQX2M \regArr_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n208), .Q(REG3[7]) );
  DFFSQX2M \regArr_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n206), .Q(REG3[5]) );
  DFFRQX2M \regArr_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n208), .Q(REG3[1]) );
  DFFRQX2M \regArr_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n207), .Q(REG2[1]) );
  DFFSQX2M \regArr_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n206), .Q(REG2[0]) );
  DFFRQX2M \regArr_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n207), .Q(REG2[3]) );
  DFFRQX2M \regArr_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n208), .Q(REG2[2]) );
  DFFRQX2M RdData_VLD_reg ( .D(n48), .CK(CLK), .RN(n206), .Q(RdData_VLD) );
  DFFRQX2M \regArr_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n206), .Q(REG0[1]) );
  DFFRQX2M \regArr_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n206), .Q(REG0[0]) );
  DFFRQX2M \regArr_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n207), .Q(REG0[2]) );
  DFFRQX2M \regArr_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n206), .Q(REG0[3]) );
  DFFRQX2M \regArr_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n207), .Q(REG0[4]) );
  DFFRQX2M \regArr_reg[0][5]  ( .D(n54), .CK(CLK), .RN(n207), .Q(REG0[5]) );
  DFFRQX2M \regArr_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n207), .Q(REG0[7]) );
  DFFRQX2M \regArr_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n207), .Q(REG0[6]) );
  DFFRQX2M \regArr_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n207), .Q(REG1[6]) );
  DFFRQX2M \regArr_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n207), .Q(REG1[1]) );
  DFFRQX2M \regArr_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n207), .Q(REG1[5]) );
  DFFRQX2M \regArr_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n207), .Q(REG1[4]) );
  DFFRQX2M \regArr_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n207), .Q(REG1[7]) );
  DFFRQX2M \regArr_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n207), .Q(REG1[3]) );
  DFFRQX2M \regArr_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n207), .Q(REG1[2]) );
  DFFRQX2M \regArr_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n207), .Q(REG1[0]) );
  DFFRQX2M \regArr_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n208), .Q(REG2[4]) );
  DFFSQX2M \regArr_reg[2][6]  ( .D(n71), .CK(CLK), .SN(n206), .Q(REG2[6]) );
  DFFRQX2M \regArr_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n208), .Q(REG2[5]) );
  DFFRQX2M \regArr_reg[2][7]  ( .D(n72), .CK(CLK), .RN(n208), .Q(REG2[7]) );
  NOR2BX2M U3 ( .AN(n38), .B(n204), .Y(n32) );
  NOR2BX2M U4 ( .AN(n27), .B(n204), .Y(n18) );
  NOR2BX2M U5 ( .AN(N13), .B(N12), .Y(n23) );
  NOR2BX2M U6 ( .AN(N13), .B(n205), .Y(n26) );
  NOR2X2M U7 ( .A(n205), .B(N13), .Y(n20) );
  NOR2X2M U8 ( .A(n199), .B(N13), .Y(n15) );
  INVX2M U9 ( .A(WrData[0]), .Y(n222) );
  INVX2M U10 ( .A(WrData[1]), .Y(n223) );
  INVX2M U11 ( .A(WrData[2]), .Y(n224) );
  INVX2M U12 ( .A(WrData[3]), .Y(n225) );
  INVX2M U13 ( .A(WrData[4]), .Y(n226) );
  INVX2M U14 ( .A(WrData[5]), .Y(n227) );
  INVX2M U15 ( .A(WrData[6]), .Y(n228) );
  INVX2M U16 ( .A(WrData[7]), .Y(n229) );
  INVX2M U17 ( .A(n201), .Y(n202) );
  INVX2M U18 ( .A(n198), .Y(n199) );
  INVX2M U19 ( .A(n12), .Y(n221) );
  BUFX2M U20 ( .A(n204), .Y(n201) );
  BUFX2M U21 ( .A(n205), .Y(n198) );
  INVX2M U22 ( .A(n200), .Y(n203) );
  BUFX2M U23 ( .A(n204), .Y(n200) );
  NOR2BX2M U24 ( .AN(n27), .B(N11), .Y(n16) );
  NOR2BX2M U25 ( .AN(n38), .B(N11), .Y(n30) );
  NAND2X2M U26 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U27 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U28 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U29 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U30 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U31 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U32 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U33 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U34 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U35 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U36 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U37 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U38 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U39 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U40 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U41 ( .A(n15), .B(n16), .Y(n14) );
  NAND2BX2M U42 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  NOR2BX2M U43 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  BUFX2M U44 ( .A(n220), .Y(n206) );
  BUFX2M U45 ( .A(n220), .Y(n207) );
  BUFX2M U46 ( .A(n219), .Y(n208) );
  BUFX2M U47 ( .A(n219), .Y(n209) );
  BUFX2M U48 ( .A(n218), .Y(n210) );
  BUFX2M U49 ( .A(n218), .Y(n211) );
  BUFX2M U50 ( .A(n217), .Y(n212) );
  BUFX2M U51 ( .A(n217), .Y(n213) );
  BUFX2M U52 ( .A(n216), .Y(n214) );
  BUFX2M U53 ( .A(n216), .Y(n215) );
  NOR2BX2M U54 ( .AN(n13), .B(N14), .Y(n27) );
  AND2X2M U55 ( .A(N14), .B(n13), .Y(n38) );
  BUFX2M U56 ( .A(RST), .Y(n219) );
  BUFX2M U57 ( .A(RST), .Y(n218) );
  BUFX2M U58 ( .A(RST), .Y(n217) );
  BUFX2M U59 ( .A(RST), .Y(n216) );
  BUFX2M U60 ( .A(RST), .Y(n220) );
  OAI2BB2X1M U61 ( .B0(n14), .B1(n222), .A0N(REG0[0]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U62 ( .B0(n14), .B1(n223), .A0N(REG0[1]), .A1N(n14), .Y(n50) );
  OAI2BB2X1M U63 ( .B0(n14), .B1(n224), .A0N(REG0[2]), .A1N(n14), .Y(n51) );
  OAI2BB2X1M U64 ( .B0(n14), .B1(n225), .A0N(REG0[3]), .A1N(n14), .Y(n52) );
  OAI2BB2X1M U65 ( .B0(n14), .B1(n226), .A0N(REG0[4]), .A1N(n14), .Y(n53) );
  OAI2BB2X1M U66 ( .B0(n14), .B1(n227), .A0N(REG0[5]), .A1N(n14), .Y(n54) );
  OAI2BB2X1M U67 ( .B0(n14), .B1(n228), .A0N(REG0[6]), .A1N(n14), .Y(n55) );
  OAI2BB2X1M U68 ( .B0(n14), .B1(n229), .A0N(REG0[7]), .A1N(n14), .Y(n56) );
  OAI2BB2X1M U69 ( .B0(n222), .B1(n17), .A0N(REG1[0]), .A1N(n17), .Y(n57) );
  OAI2BB2X1M U70 ( .B0(n223), .B1(n17), .A0N(REG1[1]), .A1N(n17), .Y(n58) );
  OAI2BB2X1M U71 ( .B0(n224), .B1(n17), .A0N(REG1[2]), .A1N(n17), .Y(n59) );
  OAI2BB2X1M U72 ( .B0(n225), .B1(n17), .A0N(REG1[3]), .A1N(n17), .Y(n60) );
  OAI2BB2X1M U73 ( .B0(n226), .B1(n17), .A0N(REG1[4]), .A1N(n17), .Y(n61) );
  OAI2BB2X1M U74 ( .B0(n227), .B1(n17), .A0N(REG1[5]), .A1N(n17), .Y(n62) );
  OAI2BB2X1M U75 ( .B0(n228), .B1(n17), .A0N(REG1[6]), .A1N(n17), .Y(n63) );
  OAI2BB2X1M U76 ( .B0(n229), .B1(n17), .A0N(REG1[7]), .A1N(n17), .Y(n64) );
  OAI2BB2X1M U77 ( .B0(n222), .B1(n22), .A0N(\regArr[4][0] ), .A1N(n22), .Y(
        n81) );
  OAI2BB2X1M U78 ( .B0(n223), .B1(n22), .A0N(\regArr[4][1] ), .A1N(n22), .Y(
        n82) );
  OAI2BB2X1M U79 ( .B0(n224), .B1(n22), .A0N(\regArr[4][2] ), .A1N(n22), .Y(
        n83) );
  OAI2BB2X1M U80 ( .B0(n225), .B1(n22), .A0N(\regArr[4][3] ), .A1N(n22), .Y(
        n84) );
  OAI2BB2X1M U81 ( .B0(n226), .B1(n22), .A0N(\regArr[4][4] ), .A1N(n22), .Y(
        n85) );
  OAI2BB2X1M U82 ( .B0(n227), .B1(n22), .A0N(\regArr[4][5] ), .A1N(n22), .Y(
        n86) );
  OAI2BB2X1M U83 ( .B0(n228), .B1(n22), .A0N(\regArr[4][6] ), .A1N(n22), .Y(
        n87) );
  OAI2BB2X1M U84 ( .B0(n229), .B1(n22), .A0N(\regArr[4][7] ), .A1N(n22), .Y(
        n88) );
  OAI2BB2X1M U85 ( .B0(n222), .B1(n24), .A0N(\regArr[5][0] ), .A1N(n24), .Y(
        n89) );
  OAI2BB2X1M U86 ( .B0(n223), .B1(n24), .A0N(\regArr[5][1] ), .A1N(n24), .Y(
        n90) );
  OAI2BB2X1M U87 ( .B0(n224), .B1(n24), .A0N(\regArr[5][2] ), .A1N(n24), .Y(
        n91) );
  OAI2BB2X1M U88 ( .B0(n225), .B1(n24), .A0N(\regArr[5][3] ), .A1N(n24), .Y(
        n92) );
  OAI2BB2X1M U89 ( .B0(n226), .B1(n24), .A0N(\regArr[5][4] ), .A1N(n24), .Y(
        n93) );
  OAI2BB2X1M U90 ( .B0(n227), .B1(n24), .A0N(\regArr[5][5] ), .A1N(n24), .Y(
        n94) );
  OAI2BB2X1M U91 ( .B0(n228), .B1(n24), .A0N(\regArr[5][6] ), .A1N(n24), .Y(
        n95) );
  OAI2BB2X1M U92 ( .B0(n229), .B1(n24), .A0N(\regArr[5][7] ), .A1N(n24), .Y(
        n96) );
  OAI2BB2X1M U93 ( .B0(n222), .B1(n25), .A0N(\regArr[6][0] ), .A1N(n25), .Y(
        n97) );
  OAI2BB2X1M U94 ( .B0(n223), .B1(n25), .A0N(\regArr[6][1] ), .A1N(n25), .Y(
        n98) );
  OAI2BB2X1M U95 ( .B0(n224), .B1(n25), .A0N(\regArr[6][2] ), .A1N(n25), .Y(
        n99) );
  OAI2BB2X1M U96 ( .B0(n225), .B1(n25), .A0N(\regArr[6][3] ), .A1N(n25), .Y(
        n100) );
  OAI2BB2X1M U97 ( .B0(n226), .B1(n25), .A0N(\regArr[6][4] ), .A1N(n25), .Y(
        n101) );
  OAI2BB2X1M U98 ( .B0(n227), .B1(n25), .A0N(\regArr[6][5] ), .A1N(n25), .Y(
        n102) );
  OAI2BB2X1M U99 ( .B0(n228), .B1(n25), .A0N(\regArr[6][6] ), .A1N(n25), .Y(
        n103) );
  OAI2BB2X1M U100 ( .B0(n229), .B1(n25), .A0N(\regArr[6][7] ), .A1N(n25), .Y(
        n104) );
  OAI2BB2X1M U101 ( .B0(n222), .B1(n28), .A0N(\regArr[7][0] ), .A1N(n28), .Y(
        n105) );
  OAI2BB2X1M U102 ( .B0(n223), .B1(n28), .A0N(\regArr[7][1] ), .A1N(n28), .Y(
        n106) );
  OAI2BB2X1M U103 ( .B0(n224), .B1(n28), .A0N(\regArr[7][2] ), .A1N(n28), .Y(
        n107) );
  OAI2BB2X1M U104 ( .B0(n225), .B1(n28), .A0N(\regArr[7][3] ), .A1N(n28), .Y(
        n108) );
  OAI2BB2X1M U105 ( .B0(n226), .B1(n28), .A0N(\regArr[7][4] ), .A1N(n28), .Y(
        n109) );
  OAI2BB2X1M U106 ( .B0(n227), .B1(n28), .A0N(\regArr[7][5] ), .A1N(n28), .Y(
        n110) );
  OAI2BB2X1M U107 ( .B0(n228), .B1(n28), .A0N(\regArr[7][6] ), .A1N(n28), .Y(
        n111) );
  OAI2BB2X1M U108 ( .B0(n229), .B1(n28), .A0N(\regArr[7][7] ), .A1N(n28), .Y(
        n112) );
  OAI2BB2X1M U109 ( .B0(n222), .B1(n29), .A0N(\regArr[8][0] ), .A1N(n29), .Y(
        n113) );
  OAI2BB2X1M U110 ( .B0(n223), .B1(n29), .A0N(\regArr[8][1] ), .A1N(n29), .Y(
        n114) );
  OAI2BB2X1M U111 ( .B0(n224), .B1(n29), .A0N(\regArr[8][2] ), .A1N(n29), .Y(
        n115) );
  OAI2BB2X1M U112 ( .B0(n225), .B1(n29), .A0N(\regArr[8][3] ), .A1N(n29), .Y(
        n116) );
  OAI2BB2X1M U113 ( .B0(n226), .B1(n29), .A0N(\regArr[8][4] ), .A1N(n29), .Y(
        n117) );
  OAI2BB2X1M U114 ( .B0(n227), .B1(n29), .A0N(\regArr[8][5] ), .A1N(n29), .Y(
        n118) );
  OAI2BB2X1M U115 ( .B0(n228), .B1(n29), .A0N(\regArr[8][6] ), .A1N(n29), .Y(
        n119) );
  OAI2BB2X1M U116 ( .B0(n229), .B1(n29), .A0N(\regArr[8][7] ), .A1N(n29), .Y(
        n120) );
  OAI2BB2X1M U117 ( .B0(n222), .B1(n31), .A0N(\regArr[9][0] ), .A1N(n31), .Y(
        n121) );
  OAI2BB2X1M U118 ( .B0(n223), .B1(n31), .A0N(\regArr[9][1] ), .A1N(n31), .Y(
        n122) );
  OAI2BB2X1M U119 ( .B0(n224), .B1(n31), .A0N(\regArr[9][2] ), .A1N(n31), .Y(
        n123) );
  OAI2BB2X1M U120 ( .B0(n225), .B1(n31), .A0N(\regArr[9][3] ), .A1N(n31), .Y(
        n124) );
  OAI2BB2X1M U121 ( .B0(n226), .B1(n31), .A0N(\regArr[9][4] ), .A1N(n31), .Y(
        n125) );
  OAI2BB2X1M U122 ( .B0(n227), .B1(n31), .A0N(\regArr[9][5] ), .A1N(n31), .Y(
        n126) );
  OAI2BB2X1M U123 ( .B0(n228), .B1(n31), .A0N(\regArr[9][6] ), .A1N(n31), .Y(
        n127) );
  OAI2BB2X1M U124 ( .B0(n229), .B1(n31), .A0N(\regArr[9][7] ), .A1N(n31), .Y(
        n128) );
  OAI2BB2X1M U125 ( .B0(n222), .B1(n33), .A0N(\regArr[10][0] ), .A1N(n33), .Y(
        n129) );
  OAI2BB2X1M U126 ( .B0(n223), .B1(n33), .A0N(\regArr[10][1] ), .A1N(n33), .Y(
        n130) );
  OAI2BB2X1M U127 ( .B0(n224), .B1(n33), .A0N(\regArr[10][2] ), .A1N(n33), .Y(
        n131) );
  OAI2BB2X1M U128 ( .B0(n225), .B1(n33), .A0N(\regArr[10][3] ), .A1N(n33), .Y(
        n132) );
  OAI2BB2X1M U129 ( .B0(n226), .B1(n33), .A0N(\regArr[10][4] ), .A1N(n33), .Y(
        n133) );
  OAI2BB2X1M U130 ( .B0(n227), .B1(n33), .A0N(\regArr[10][5] ), .A1N(n33), .Y(
        n134) );
  OAI2BB2X1M U131 ( .B0(n228), .B1(n33), .A0N(\regArr[10][6] ), .A1N(n33), .Y(
        n135) );
  OAI2BB2X1M U132 ( .B0(n229), .B1(n33), .A0N(\regArr[10][7] ), .A1N(n33), .Y(
        n136) );
  OAI2BB2X1M U133 ( .B0(n222), .B1(n34), .A0N(\regArr[11][0] ), .A1N(n34), .Y(
        n137) );
  OAI2BB2X1M U134 ( .B0(n223), .B1(n34), .A0N(\regArr[11][1] ), .A1N(n34), .Y(
        n138) );
  OAI2BB2X1M U135 ( .B0(n224), .B1(n34), .A0N(\regArr[11][2] ), .A1N(n34), .Y(
        n139) );
  OAI2BB2X1M U136 ( .B0(n225), .B1(n34), .A0N(\regArr[11][3] ), .A1N(n34), .Y(
        n140) );
  OAI2BB2X1M U137 ( .B0(n226), .B1(n34), .A0N(\regArr[11][4] ), .A1N(n34), .Y(
        n141) );
  OAI2BB2X1M U138 ( .B0(n227), .B1(n34), .A0N(\regArr[11][5] ), .A1N(n34), .Y(
        n142) );
  OAI2BB2X1M U139 ( .B0(n228), .B1(n34), .A0N(\regArr[11][6] ), .A1N(n34), .Y(
        n143) );
  OAI2BB2X1M U140 ( .B0(n229), .B1(n34), .A0N(\regArr[11][7] ), .A1N(n34), .Y(
        n144) );
  OAI2BB2X1M U141 ( .B0(n222), .B1(n35), .A0N(\regArr[12][0] ), .A1N(n35), .Y(
        n145) );
  OAI2BB2X1M U142 ( .B0(n223), .B1(n35), .A0N(\regArr[12][1] ), .A1N(n35), .Y(
        n146) );
  OAI2BB2X1M U143 ( .B0(n224), .B1(n35), .A0N(\regArr[12][2] ), .A1N(n35), .Y(
        n147) );
  OAI2BB2X1M U144 ( .B0(n225), .B1(n35), .A0N(\regArr[12][3] ), .A1N(n35), .Y(
        n148) );
  OAI2BB2X1M U145 ( .B0(n226), .B1(n35), .A0N(\regArr[12][4] ), .A1N(n35), .Y(
        n149) );
  OAI2BB2X1M U146 ( .B0(n227), .B1(n35), .A0N(\regArr[12][5] ), .A1N(n35), .Y(
        n150) );
  OAI2BB2X1M U147 ( .B0(n228), .B1(n35), .A0N(\regArr[12][6] ), .A1N(n35), .Y(
        n151) );
  OAI2BB2X1M U148 ( .B0(n229), .B1(n35), .A0N(\regArr[12][7] ), .A1N(n35), .Y(
        n152) );
  OAI2BB2X1M U149 ( .B0(n222), .B1(n36), .A0N(\regArr[13][0] ), .A1N(n36), .Y(
        n153) );
  OAI2BB2X1M U150 ( .B0(n223), .B1(n36), .A0N(\regArr[13][1] ), .A1N(n36), .Y(
        n154) );
  OAI2BB2X1M U151 ( .B0(n224), .B1(n36), .A0N(\regArr[13][2] ), .A1N(n36), .Y(
        n155) );
  OAI2BB2X1M U152 ( .B0(n225), .B1(n36), .A0N(\regArr[13][3] ), .A1N(n36), .Y(
        n156) );
  OAI2BB2X1M U153 ( .B0(n226), .B1(n36), .A0N(\regArr[13][4] ), .A1N(n36), .Y(
        n157) );
  OAI2BB2X1M U154 ( .B0(n227), .B1(n36), .A0N(\regArr[13][5] ), .A1N(n36), .Y(
        n158) );
  OAI2BB2X1M U155 ( .B0(n228), .B1(n36), .A0N(\regArr[13][6] ), .A1N(n36), .Y(
        n159) );
  OAI2BB2X1M U156 ( .B0(n229), .B1(n36), .A0N(\regArr[13][7] ), .A1N(n36), .Y(
        n160) );
  OAI2BB2X1M U157 ( .B0(n222), .B1(n37), .A0N(\regArr[14][0] ), .A1N(n37), .Y(
        n161) );
  OAI2BB2X1M U158 ( .B0(n223), .B1(n37), .A0N(\regArr[14][1] ), .A1N(n37), .Y(
        n162) );
  OAI2BB2X1M U159 ( .B0(n224), .B1(n37), .A0N(\regArr[14][2] ), .A1N(n37), .Y(
        n163) );
  OAI2BB2X1M U160 ( .B0(n225), .B1(n37), .A0N(\regArr[14][3] ), .A1N(n37), .Y(
        n164) );
  OAI2BB2X1M U161 ( .B0(n226), .B1(n37), .A0N(\regArr[14][4] ), .A1N(n37), .Y(
        n165) );
  OAI2BB2X1M U162 ( .B0(n227), .B1(n37), .A0N(\regArr[14][5] ), .A1N(n37), .Y(
        n166) );
  OAI2BB2X1M U163 ( .B0(n228), .B1(n37), .A0N(\regArr[14][6] ), .A1N(n37), .Y(
        n167) );
  OAI2BB2X1M U164 ( .B0(n229), .B1(n37), .A0N(\regArr[14][7] ), .A1N(n37), .Y(
        n168) );
  OAI2BB2X1M U165 ( .B0(n222), .B1(n39), .A0N(\regArr[15][0] ), .A1N(n39), .Y(
        n169) );
  OAI2BB2X1M U166 ( .B0(n223), .B1(n39), .A0N(\regArr[15][1] ), .A1N(n39), .Y(
        n170) );
  OAI2BB2X1M U167 ( .B0(n224), .B1(n39), .A0N(\regArr[15][2] ), .A1N(n39), .Y(
        n171) );
  OAI2BB2X1M U168 ( .B0(n225), .B1(n39), .A0N(\regArr[15][3] ), .A1N(n39), .Y(
        n172) );
  OAI2BB2X1M U169 ( .B0(n226), .B1(n39), .A0N(\regArr[15][4] ), .A1N(n39), .Y(
        n173) );
  OAI2BB2X1M U170 ( .B0(n227), .B1(n39), .A0N(\regArr[15][5] ), .A1N(n39), .Y(
        n174) );
  OAI2BB2X1M U171 ( .B0(n228), .B1(n39), .A0N(\regArr[15][6] ), .A1N(n39), .Y(
        n175) );
  OAI2BB2X1M U172 ( .B0(n229), .B1(n39), .A0N(\regArr[15][7] ), .A1N(n39), .Y(
        n176) );
  OAI2BB2X1M U173 ( .B0(n223), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n66) );
  OAI2BB2X1M U174 ( .B0(n224), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n67) );
  OAI2BB2X1M U175 ( .B0(n225), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n68) );
  OAI2BB2X1M U176 ( .B0(n226), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n69) );
  OAI2BB2X1M U177 ( .B0(n227), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n70) );
  OAI2BB2X1M U178 ( .B0(n229), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n72) );
  OAI2BB2X1M U179 ( .B0(n222), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U180 ( .B0(n223), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n74) );
  OAI2BB2X1M U181 ( .B0(n224), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n75) );
  OAI2BB2X1M U182 ( .B0(n225), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n76) );
  OAI2BB2X1M U183 ( .B0(n226), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n77) );
  OAI2BB2X1M U184 ( .B0(n228), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n79) );
  OAI2BB2X1M U185 ( .B0(n229), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n80) );
  OAI2BB2X1M U186 ( .B0(n222), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U187 ( .B0(n228), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n71) );
  OAI2BB2X1M U188 ( .B0(n227), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n78) );
  AO22X1M U189 ( .A0(N38), .A1(n221), .B0(RdData[5]), .B1(n12), .Y(n45) );
  MX4X1M U190 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U191 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n203), 
        .S1(N12), .Y(n189) );
  MX4X1M U192 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(n203), .S1(N12), .Y(n187) );
  AO22X1M U193 ( .A0(N37), .A1(n221), .B0(RdData[6]), .B1(n12), .Y(n46) );
  MX4X1M U194 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U195 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n203), 
        .S1(N12), .Y(n193) );
  MX4X1M U196 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(n203), .S1(N12), .Y(n191) );
  AO22X1M U197 ( .A0(N36), .A1(n221), .B0(RdData[7]), .B1(n12), .Y(n47) );
  MX4X1M U198 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U199 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n203), 
        .S1(N12), .Y(n197) );
  MX4X1M U200 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(n203), .S1(N12), .Y(n195) );
  MX4X1M U201 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n202), 
        .S1(n199), .Y(n8) );
  MX4X1M U202 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(N11), .S1(N12), .Y(n3) );
  MX4X1M U203 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n202), .S1(N12), .Y(n7) );
  MX4X1M U204 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n202), .S1(n199), .Y(n11) );
  MX4X1M U205 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n202), .S1(n199), .Y(n180) );
  MX4X1M U206 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n202), .S1(n199), .Y(n184) );
  MX4X1M U207 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n203), .S1(n199), .Y(n188) );
  MX4X1M U208 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n203), .S1(N12), .Y(n192) );
  MX4X1M U209 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(n203), .S1(N12), .Y(n196) );
  MX4X1M U210 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n203), .S1(n199), .Y(n1) );
  MX4X1M U211 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n202), .S1(n199), .Y(n9) );
  MX4X1M U212 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n202), .S1(n199), .Y(n178) );
  MX4X1M U213 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n202), .S1(n199), .Y(n182) );
  MX4X1M U214 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n203), .S1(n199), .Y(n186) );
  MX4X1M U215 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n203), .S1(N12), .Y(n190) );
  MX4X1M U216 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n203), .S1(N12), .Y(n194) );
  OAI2BB1X2M U217 ( .A0N(RdData_VLD), .A1N(n13), .B0(n12), .Y(n48) );
  AO22X1M U218 ( .A0(N43), .A1(n221), .B0(RdData[0]), .B1(n12), .Y(n40) );
  MX4X1M U219 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U220 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(n199), .Y(n4) );
  MX4X1M U221 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(N11), .S1(N12), .Y(n2) );
  AO22X1M U222 ( .A0(N42), .A1(n221), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4X1M U223 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U224 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(N11), .S1(n199), .Y(n6) );
  MX4X1M U225 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n202), .S1(N12), .Y(n5) );
  AO22X1M U226 ( .A0(N41), .A1(n221), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4X1M U227 ( .A(n177), .B(n10), .C(n11), .D(n9), .S0(N14), .S1(N13), .Y(N41) );
  MX4X1M U228 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n202), 
        .S1(n199), .Y(n177) );
  MX4X1M U229 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n202), .S1(n199), .Y(n10) );
  AO22X1M U230 ( .A0(N40), .A1(n221), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4X1M U231 ( .A(n181), .B(n179), .C(n180), .D(n178), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U232 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n202), 
        .S1(n199), .Y(n181) );
  MX4X1M U233 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n202), .S1(n199), .Y(n179) );
  AO22X1M U234 ( .A0(N39), .A1(n221), .B0(RdData[4]), .B1(n12), .Y(n44) );
  MX4X1M U235 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U236 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n203), 
        .S1(n199), .Y(n185) );
  MX4X1M U237 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n202), .S1(n199), .Y(n183) );
  INVX2M U238 ( .A(N11), .Y(n204) );
  INVX2M U239 ( .A(N12), .Y(n205) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n18), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n18), .Y(n5) );
  NAND2X2M U15 ( .A(n5), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n7) );
  NAND2X2M U17 ( .A(n5), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U18 ( .A(a[2]), .Y(n8) );
  NAND2X2M U19 ( .A(n5), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U20 ( .A(a[1]), .Y(n9) );
  NAND2X2M U21 ( .A(n5), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U22 ( .A(a[0]), .Y(n10) );
  NAND2X2M U23 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U24 ( .A(a[6]), .Y(n2) );
  INVX2M U25 ( .A(n18), .Y(n1) );
  XNOR2X2M U26 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(b[1]), .Y(n17) );
  INVX2M U29 ( .A(b[2]), .Y(n16) );
  INVX2M U30 ( .A(b[3]), .Y(n15) );
  INVX2M U31 ( .A(b[4]), .Y(n14) );
  INVX2M U32 ( .A(b[5]), .Y(n13) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [9:0] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n9), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n5), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n7), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n8), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n3), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n4), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2M U2 ( .A(B[6]), .Y(n4) );
  XNOR2X2M U3 ( .A(n10), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U4 ( .A(B[0]), .Y(n10) );
  INVX2M U5 ( .A(B[7]), .Y(n3) );
  INVX2M U6 ( .A(B[2]), .Y(n8) );
  INVX2M U7 ( .A(B[3]), .Y(n7) );
  INVX2M U8 ( .A(B[4]), .Y(n6) );
  INVX2M U9 ( .A(B[5]), .Y(n5) );
  INVX2M U10 ( .A(B[1]), .Y(n9) );
  NAND2X2M U11 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U12 ( .A(A[0]), .Y(n1) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20
;
  assign SUM[6] = A[6];
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  AOI21BX2M U2 ( .A0(n11), .A1(A[12]), .B0N(n12), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n8) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n2), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n2) );
  XNOR2X1M U7 ( .A(n3), .B(n4), .Y(SUM[9]) );
  NOR2X1M U8 ( .A(n5), .B(n6), .Y(n4) );
  CLKXOR2X2M U9 ( .A(n7), .B(n8), .Y(SUM[8]) );
  NAND2BX1M U10 ( .AN(n9), .B(n10), .Y(n7) );
  OAI21X1M U11 ( .A0(A[12]), .A1(n11), .B0(B[12]), .Y(n12) );
  XOR3XLM U12 ( .A(B[12]), .B(A[12]), .C(n11), .Y(SUM[12]) );
  OAI21BX1M U13 ( .A0(n13), .A1(n14), .B0N(n15), .Y(n11) );
  XNOR2X1M U14 ( .A(n14), .B(n16), .Y(SUM[11]) );
  NOR2X1M U15 ( .A(n15), .B(n13), .Y(n16) );
  NOR2X1M U16 ( .A(B[11]), .B(A[11]), .Y(n13) );
  AND2X1M U17 ( .A(B[11]), .B(A[11]), .Y(n15) );
  OA21X1M U18 ( .A0(n17), .A1(n18), .B0(n19), .Y(n14) );
  CLKXOR2X2M U19 ( .A(n20), .B(n18), .Y(SUM[10]) );
  AOI2BB1X1M U20 ( .A0N(n3), .A1N(n6), .B0(n5), .Y(n18) );
  AND2X1M U21 ( .A(B[9]), .B(A[9]), .Y(n5) );
  NOR2X1M U22 ( .A(B[9]), .B(A[9]), .Y(n6) );
  OA21X1M U23 ( .A0(n8), .A1(n9), .B0(n10), .Y(n3) );
  CLKNAND2X2M U24 ( .A(B[8]), .B(A[8]), .Y(n10) );
  NOR2X1M U25 ( .A(B[8]), .B(A[8]), .Y(n9) );
  NAND2BX1M U26 ( .AN(n17), .B(n19), .Y(n20) );
  CLKNAND2X2M U27 ( .A(B[10]), .B(A[10]), .Y(n19) );
  NOR2X1M U28 ( .A(B[10]), .B(A[10]), .Y(n17) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n15, n13, n14, n11, n12, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n5), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n7), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n6), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n3), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  AND2X2M U2 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U13 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U15 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U16 ( .A(\ab[0][7] ), .Y(n23) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U21 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U22 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  CLKXOR2X2M U23 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U24 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n14) );
  AND2X2M U25 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  INVX2M U27 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U28 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U29 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U30 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U31 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U32 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U33 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U34 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  INVX2M U35 ( .A(A[1]), .Y(n38) );
  INVX2M U36 ( .A(A[0]), .Y(n39) );
  INVX2M U37 ( .A(B[6]), .Y(n25) );
  XNOR2X2M U38 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U39 ( .A(A[3]), .Y(n36) );
  INVX2M U40 ( .A(A[2]), .Y(n37) );
  INVX2M U41 ( .A(A[4]), .Y(n35) );
  XNOR2X2M U42 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[6]), .Y(n33) );
  INVX2M U45 ( .A(A[5]), .Y(n34) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140;
  wire   [15:0] ALU_OUT_Comb;

  ALU_DW_div_uns_0 div_52 ( .a({n11, n10, n9, n8, n7, n6, n5, n4}), .b({B[7], 
        n3, B[5:0]}), .quotient({N132, N131, N130, N129, N128, N127, N126, 
        N125}) );
  ALU_DW01_sub_0 sub_46 ( .A({1'b0, n11, n10, n9, n8, n7, n6, n5, n4}), .B({
        1'b0, B[7], n3, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, N105, 
        N104, N103, N102, N101, N100}) );
  ALU_DW01_add_0 add_43 ( .A({1'b0, n11, n10, n9, n8, n7, n6, n5, n4}), .B({
        1'b0, B[7], n3, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92, N91}) );
  ALU_DW02_mult_0 mult_49 ( .A({n11, n10, n9, n8, n7, n6, n5, n4}), .B({B[7], 
        n3, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, N120, N119, 
        N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  NOR3BX2M U3 ( .AN(n105), .B(n138), .C(ALU_FUN[2]), .Y(n49) );
  BUFX2M U4 ( .A(A[6]), .Y(n10) );
  OAI2BB1X2M U7 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U8 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U9 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U10 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U11 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U12 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U13 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U14 ( .A0N(n139), .A1N(n105), .B0(n101), .Y(n47) );
  OAI2BB1X2M U15 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  NOR2BX2M U16 ( .AN(n106), .B(n136), .Y(n37) );
  NAND2X2M U17 ( .A(EN), .B(n123), .Y(n32) );
  AND2X2M U18 ( .A(n99), .B(n105), .Y(n42) );
  NOR2BX2M U19 ( .AN(n12), .B(n140), .Y(n31) );
  INVX2M U20 ( .A(ALU_FUN[0]), .Y(n135) );
  AND2X2M U21 ( .A(n106), .B(n105), .Y(n50) );
  BUFX2M U22 ( .A(n41), .Y(n13) );
  NOR2X2M U23 ( .A(n107), .B(n136), .Y(n41) );
  INVX2M U24 ( .A(n100), .Y(n136) );
  INVX2M U25 ( .A(n91), .Y(n137) );
  INVX2M U26 ( .A(n107), .Y(n139) );
  INVX2M U27 ( .A(EN), .Y(n140) );
  AOI31X2M U28 ( .A0(n93), .A1(n94), .A2(n95), .B0(n140), .Y(ALU_OUT_Comb[0])
         );
  AOI22X1M U29 ( .A0(N100), .A1(n50), .B0(N91), .B1(n37), .Y(n93) );
  AOI211X2M U30 ( .A0(n13), .A1(n134), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X1M U31 ( .A0(N109), .A1(n12), .B0(n4), .B1(n42), .C0(N125), .C1(n49), 
        .Y(n94) );
  AOI31X2M U32 ( .A0(n81), .A1(n82), .A2(n83), .B0(n140), .Y(ALU_OUT_Comb[1])
         );
  AOI222X1M U33 ( .A0(N92), .A1(n37), .B0(N110), .B1(n12), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI211X2M U34 ( .A0(n6), .A1(n137), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U35 ( .A0(N126), .A1(n49), .B0(n13), .B1(n133), .C0(n5), .C1(n42), 
        .Y(n82) );
  AOI31X2M U36 ( .A0(n75), .A1(n76), .A2(n77), .B0(n140), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U37 ( .A0(N102), .A1(n50), .B0(N93), .B1(n37), .Y(n75) );
  AOI221XLM U38 ( .A0(n7), .A1(n137), .B0(n13), .B1(n132), .C0(n78), .Y(n77)
         );
  AOI222X1M U39 ( .A0(N111), .A1(n12), .B0(n6), .B1(n42), .C0(N127), .C1(n49), 
        .Y(n76) );
  AOI31X2M U40 ( .A0(n69), .A1(n70), .A2(n71), .B0(n140), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U41 ( .A0(N103), .A1(n50), .B0(N94), .B1(n37), .Y(n69) );
  AOI221XLM U42 ( .A0(n8), .A1(n137), .B0(n13), .B1(n131), .C0(n72), .Y(n71)
         );
  AOI222X1M U43 ( .A0(N112), .A1(n12), .B0(n7), .B1(n42), .C0(N128), .C1(n49), 
        .Y(n70) );
  AOI31X2M U44 ( .A0(n63), .A1(n64), .A2(n65), .B0(n140), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U45 ( .A0(N104), .A1(n50), .B0(N95), .B1(n37), .Y(n63) );
  AOI221XLM U46 ( .A0(n137), .A1(n9), .B0(n13), .B1(n130), .C0(n66), .Y(n65)
         );
  AOI222X1M U47 ( .A0(N113), .A1(n12), .B0(n8), .B1(n42), .C0(N129), .C1(n49), 
        .Y(n64) );
  AOI31X2M U48 ( .A0(n57), .A1(n58), .A2(n59), .B0(n140), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U49 ( .A0(N105), .A1(n50), .B0(N96), .B1(n37), .Y(n57) );
  AOI221XLM U50 ( .A0(n137), .A1(n10), .B0(n13), .B1(n129), .C0(n60), .Y(n59)
         );
  AOI222X1M U51 ( .A0(N114), .A1(n12), .B0(n9), .B1(n42), .C0(N130), .C1(n49), 
        .Y(n58) );
  AOI31X2M U52 ( .A0(n38), .A1(n39), .A2(n40), .B0(n140), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U53 ( .A0(N107), .A1(n50), .B0(N98), .B1(n37), .Y(n38) );
  AOI221XLM U54 ( .A0(n13), .A1(n127), .B0(n42), .B1(n11), .C0(n43), .Y(n40)
         );
  AOI22X1M U55 ( .A0(N132), .A1(n49), .B0(N116), .B1(n12), .Y(n39) );
  AOI21X2M U56 ( .A0(n33), .A1(n34), .B0(n140), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U57 ( .A0(N99), .A1(n37), .B0(n123), .Y(n33) );
  AOI2BB2XLM U58 ( .B0(N117), .B1(n12), .A0N(n127), .A1N(n36), .Y(n34) );
  OAI222X1M U59 ( .A0(n55), .A1(n122), .B0(n3), .B1(n56), .C0(n36), .C1(n129), 
        .Y(n54) );
  AOI221XLM U60 ( .A0(n10), .A1(n46), .B0(n47), .B1(n128), .C0(n13), .Y(n56)
         );
  AOI221XLM U61 ( .A0(n46), .A1(n128), .B0(n10), .B1(n48), .C0(n42), .Y(n55)
         );
  NOR2X2M U62 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  INVX2M U63 ( .A(n25), .Y(n120) );
  AND3X2M U64 ( .A(n106), .B(n135), .C(ALU_FUN[3]), .Y(n46) );
  NAND3X2M U65 ( .A(n139), .B(n135), .C(ALU_FUN[3]), .Y(n36) );
  AOI31X2M U66 ( .A0(n51), .A1(n52), .A2(n53), .B0(n140), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U67 ( .A0(N106), .A1(n50), .B0(N97), .B1(n37), .Y(n51) );
  AOI221XLM U68 ( .A0(n137), .A1(n11), .B0(n13), .B1(n128), .C0(n54), .Y(n53)
         );
  AOI222X1M U69 ( .A0(N115), .A1(n12), .B0(n42), .B1(n10), .C0(N131), .C1(n49), 
        .Y(n52) );
  NOR2X2M U70 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n100) );
  NOR2X2M U71 ( .A(n135), .B(ALU_FUN[3]), .Y(n105) );
  INVX2M U72 ( .A(n92), .Y(n123) );
  AOI211X2M U73 ( .A0(N108), .A1(n50), .B0(n13), .C0(n47), .Y(n92) );
  NAND3X2M U74 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  NAND2X2M U75 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  INVX2M U76 ( .A(ALU_FUN[1]), .Y(n138) );
  INVX2M U77 ( .A(n116), .Y(N158) );
  INVX2M U78 ( .A(n3), .Y(n122) );
  NAND3X2M U79 ( .A(n106), .B(ALU_FUN[0]), .C(ALU_FUN[3]), .Y(n101) );
  AND4X2M U80 ( .A(N159), .B(n99), .C(ALU_FUN[3]), .D(n135), .Y(n90) );
  AND2X2M U81 ( .A(ALU_FUN[2]), .B(n138), .Y(n99) );
  BUFX2M U82 ( .A(n35), .Y(n12) );
  NOR3X2M U83 ( .A(n136), .B(ALU_FUN[2]), .C(n138), .Y(n35) );
  INVX2M U84 ( .A(n5), .Y(n133) );
  INVX2M U85 ( .A(n4), .Y(n134) );
  INVX2M U86 ( .A(n10), .Y(n128) );
  INVX2M U87 ( .A(n11), .Y(n127) );
  INVX2M U88 ( .A(n7), .Y(n131) );
  INVX2M U89 ( .A(n6), .Y(n132) );
  INVX2M U90 ( .A(n9), .Y(n129) );
  INVX2M U91 ( .A(n8), .Y(n130) );
  BUFX2M U92 ( .A(B[6]), .Y(n3) );
  BUFX2M U93 ( .A(A[7]), .Y(n11) );
  BUFX2M U94 ( .A(A[5]), .Y(n9) );
  BUFX2M U95 ( .A(A[4]), .Y(n8) );
  BUFX2M U96 ( .A(A[3]), .Y(n7) );
  BUFX2M U97 ( .A(A[2]), .Y(n6) );
  BUFX2M U98 ( .A(A[1]), .Y(n5) );
  BUFX2M U99 ( .A(A[0]), .Y(n4) );
  OAI2B2X1M U100 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n133), .Y(n97) );
  AOI221XLM U101 ( .A0(n46), .A1(n134), .B0(n4), .B1(n48), .C0(n42), .Y(n98)
         );
  OAI222X1M U102 ( .A0(n79), .A1(n119), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n133), .Y(n78) );
  AOI221XLM U103 ( .A0(n6), .A1(n46), .B0(n47), .B1(n132), .C0(n13), .Y(n80)
         );
  AOI221XLM U104 ( .A0(n46), .A1(n132), .B0(n6), .B1(n48), .C0(n42), .Y(n79)
         );
  OAI222X1M U105 ( .A0(n73), .A1(n121), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n132), .Y(n72) );
  AOI221XLM U106 ( .A0(n7), .A1(n46), .B0(n47), .B1(n131), .C0(n13), .Y(n74)
         );
  AOI221XLM U107 ( .A0(n46), .A1(n131), .B0(n7), .B1(n48), .C0(n42), .Y(n73)
         );
  OAI222X1M U108 ( .A0(n67), .A1(n126), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n131), .Y(n66) );
  INVX2M U109 ( .A(B[4]), .Y(n126) );
  AOI221XLM U110 ( .A0(n8), .A1(n46), .B0(n47), .B1(n130), .C0(n13), .Y(n68)
         );
  AOI221XLM U111 ( .A0(n46), .A1(n130), .B0(n8), .B1(n48), .C0(n42), .Y(n67)
         );
  OAI222X1M U112 ( .A0(n61), .A1(n125), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n130), .Y(n60) );
  INVX2M U113 ( .A(B[5]), .Y(n125) );
  AOI221XLM U114 ( .A0(n9), .A1(n46), .B0(n47), .B1(n129), .C0(n13), .Y(n62)
         );
  AOI221XLM U115 ( .A0(n46), .A1(n129), .B0(n9), .B1(n48), .C0(n42), .Y(n61)
         );
  OAI222X1M U116 ( .A0(n44), .A1(n124), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n128), .Y(n43) );
  INVX2M U117 ( .A(B[7]), .Y(n124) );
  AOI221XLM U118 ( .A0(n46), .A1(n11), .B0(n47), .B1(n127), .C0(n13), .Y(n45)
         );
  AOI221XLM U119 ( .A0(n46), .A1(n127), .B0(n11), .B1(n48), .C0(n42), .Y(n44)
         );
  INVX2M U120 ( .A(n14), .Y(n118) );
  OAI21X2M U121 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI221XLM U122 ( .A0(n4), .A1(n46), .B0(n47), .B1(n134), .C0(n13), .Y(n102)
         );
  AOI31X2M U123 ( .A0(N157), .A1(ALU_FUN[3]), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U124 ( .A(n138), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  OAI21X2M U125 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  AOI221XLM U126 ( .A0(n5), .A1(n46), .B0(n47), .B1(n133), .C0(n13), .Y(n87)
         );
  AOI31X2M U127 ( .A0(N158), .A1(ALU_FUN[3]), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U128 ( .A(n135), .B(ALU_FUN[2]), .C(n138), .Y(n89) );
  OAI2B2X1M U129 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n134), .Y(n85) );
  AOI221XLM U130 ( .A0(n46), .A1(n133), .B0(n5), .B1(n48), .C0(n42), .Y(n86)
         );
  INVX2M U131 ( .A(B[0]), .Y(n117) );
  INVX2M U132 ( .A(B[2]), .Y(n119) );
  INVX2M U133 ( .A(B[3]), .Y(n121) );
  NOR2X1M U134 ( .A(n127), .B(B[7]), .Y(n113) );
  NAND2BX1M U135 ( .AN(B[4]), .B(n8), .Y(n29) );
  NAND2BX1M U136 ( .AN(n8), .B(B[4]), .Y(n18) );
  CLKNAND2X2M U137 ( .A(n29), .B(n18), .Y(n108) );
  NOR2X1M U138 ( .A(n121), .B(n7), .Y(n26) );
  NOR2X1M U139 ( .A(n119), .B(n6), .Y(n17) );
  NOR2X1M U140 ( .A(n117), .B(n4), .Y(n14) );
  CLKNAND2X2M U141 ( .A(n6), .B(n119), .Y(n28) );
  NAND2BX1M U142 ( .AN(n17), .B(n28), .Y(n23) );
  AOI21X1M U143 ( .A0(n14), .A1(n133), .B0(B[1]), .Y(n15) );
  AOI211X1M U144 ( .A0(n5), .A1(n118), .B0(n23), .C0(n15), .Y(n16) );
  CLKNAND2X2M U145 ( .A(n7), .B(n121), .Y(n27) );
  OAI31X1M U146 ( .A0(n26), .A1(n17), .A2(n16), .B0(n27), .Y(n19) );
  NAND2BX1M U147 ( .AN(n9), .B(B[5]), .Y(n111) );
  OAI211X1M U148 ( .A0(n108), .A1(n19), .B0(n18), .C0(n111), .Y(n20) );
  NAND2BX1M U149 ( .AN(B[5]), .B(n9), .Y(n30) );
  XNOR2X1M U150 ( .A(n10), .B(n3), .Y(n110) );
  AOI32X1M U151 ( .A0(n20), .A1(n30), .A2(n110), .B0(n3), .B1(n128), .Y(n21)
         );
  CLKNAND2X2M U152 ( .A(B[7]), .B(n127), .Y(n114) );
  OAI21X1M U153 ( .A0(n113), .A1(n21), .B0(n114), .Y(N159) );
  CLKNAND2X2M U154 ( .A(n4), .B(n117), .Y(n24) );
  OA21X1M U155 ( .A0(n24), .A1(n133), .B0(B[1]), .Y(n22) );
  AOI211X1M U156 ( .A0(n24), .A1(n133), .B0(n23), .C0(n22), .Y(n25) );
  AOI31X1M U157 ( .A0(n120), .A1(n28), .A2(n27), .B0(n26), .Y(n109) );
  OAI2B11X1M U158 ( .A1N(n109), .A0(n108), .B0(n30), .C0(n29), .Y(n112) );
  AOI32X1M U159 ( .A0(n112), .A1(n111), .A2(n110), .B0(n10), .B1(n122), .Y(
        n115) );
  AOI2B1X1M U160 ( .A1N(n115), .A0(n114), .B0(n113), .Y(n116) );
  NOR2X1M U161 ( .A(N159), .B(N158), .Y(N157) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   SYNC_UART_RST, SYNC_REF_RST, UART_RX_V_OUT, UART_RX_V_SYNC,
         UART_TX_VLD, UART_TX_CLK, UART_TX_Busy_PULSE, FIFO_FULL,
         UART_TX_V_SYNC, UART_TX_Busy, UART_RX_CLK, RF_RdData_VLD, RF_WrEn,
         RF_RdEn, ALU_EN, ALU_OUT_VLD, CLKG_EN, ALU_CLK, n2, n3, n4, n5, n6;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_SYNC;
  wire   [7:0] UART_TX_IN;
  wire   [7:0] UART_TX_SYNC;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] UART_Config;
  wire   [7:0] DIV_RATIO_RX;
  wire   [7:0] RF_RdData;
  wire   [3:0] RF_Address;
  wire   [7:0] RF_WrData;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  RST_SYNC_NUM_STAGES2_0 U0_RST_SYNC ( .RST(RST_N), .CLK(UART_CLK), .SYNC_RST(
        SYNC_UART_RST) );
  RST_SYNC_NUM_STAGES2_1 U1_RST_SYNC ( .RST(RST_N), .CLK(REF_CLK), .SYNC_RST(
        SYNC_REF_RST) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 U0_ref_sync ( .CLK(REF_CLK), .RST(n2), 
        .unsync_bus(UART_RX_OUT), .bus_enable(UART_RX_V_OUT), .sync_bus(
        UART_RX_SYNC), .enable_pulse(UART_RX_V_SYNC) );
  FIFO_TOP_ADDR_WIDTH3_BUFFER_DEPTH8_BUFFER_WIDTH8 U0_UART_FIFO ( .w_CLK(
        REF_CLK), .r_CLK(UART_TX_CLK), .w_RST(n2), .r_RST(n4), .w_data(
        UART_TX_IN), .w_inc(UART_TX_VLD), .r_inc(UART_TX_Busy_PULSE), .w_full(
        FIFO_FULL), .r_empty(UART_TX_V_SYNC), .r_data(UART_TX_SYNC) );
  PULSE_GEN U0_PULSE_GEN ( .clk(UART_TX_CLK), .rst(n4), .lvl_sig(UART_TX_Busy), 
        .pulse_sig(UART_TX_Busy_PULSE) );
  clk_div_0 U0_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst_n(n4), .i_clk_en(1'b1), 
        .i_div_ratio(DIV_RATIO), .o_div_clk(UART_TX_CLK) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]})
         );
  clk_div_1 U1_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst_n(n4), .i_clk_en(1'b1), 
        .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX[3:0]}), .o_div_clk(
        UART_RX_CLK) );
  UART U0_UART ( .RST(n4), .TX_CLK(UART_TX_CLK), .RX_CLK(UART_RX_CLK), 
        .RX_IN_S(UART_RX_IN), .RX_OUT_P(UART_RX_OUT), .RX_OUT_V(UART_RX_V_OUT), 
        .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n6), .TX_OUT_S(UART_TX_O), .TX_OUT_V(
        UART_TX_Busy), .Prescale(UART_Config[7:2]), .parity_enable(
        UART_Config[0]), .parity_type(UART_Config[1]), .parity_error(
        parity_error), .framing_error(framing_error) );
  SYS_CTRL U0_SYS_CTRL ( .CLK(REF_CLK), .RST(n2), .RX_DATA(UART_RX_SYNC), 
        .RX_valid(UART_RX_V_SYNC), .FIFO_FULL(FIFO_FULL), .FIFO_wr_inc(
        UART_TX_VLD), .FIFO_wr_data(UART_TX_IN), .Reg_wr_en(RF_WrEn), 
        .Reg_ADDR(RF_Address), .Reg_wr_data(RF_WrData), .Reg_rd_en(RF_RdEn), 
        .Reg_rd_data(RF_RdData), .Reg_data_valid(RF_RdData_VLD), .ALU_out(
        ALU_OUT), .ALU_out_valid(ALU_OUT_VLD), .ALU_en(ALU_EN), .ALU_FUN(
        ALU_FUN), .ALU_GATE_EN(CLKG_EN) );
  RegFile U0_RegFile ( .CLK(REF_CLK), .RST(n2), .WrEn(RF_WrEn), .RdEn(RF_RdEn), 
        .Address(RF_Address), .WrData(RF_WrData), .RdData(RF_RdData), 
        .RdData_VLD(RF_RdData_VLD), .REG0(Operand_A), .REG1(Operand_B), .REG2(
        UART_Config), .REG3(DIV_RATIO) );
  ALU U0_ALU ( .A(Operand_A), .B(Operand_B), .EN(ALU_EN), .ALU_FUN(ALU_FUN), 
        .CLK(ALU_CLK), .RST(n2), .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_OUT_VLD) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLKG_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  INVX4M U2 ( .A(n3), .Y(n2) );
  INVX2M U3 ( .A(n5), .Y(n4) );
  INVX2M U4 ( .A(UART_TX_V_SYNC), .Y(n6) );
  INVX2M U5 ( .A(SYNC_REF_RST), .Y(n3) );
  INVX2M U6 ( .A(SYNC_UART_RST), .Y(n5) );
endmodule

