/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 16 03:20:06 2024
/////////////////////////////////////////////////////////////


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_6 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module RST_SYNC_NUM_STAGES2_test_0 ( RST, CLK, SYNC_RST, test_si, test_so, 
        test_se );
  input RST, CLK, test_si, test_se;
  output SYNC_RST, test_so;
  wire   \REG[1] ;
  assign test_so = \REG[1] ;

  SDFFRQX2M \REG_reg[1]  ( .D(1'b1), .SI(SYNC_RST), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\REG[1] ) );
  SDFFRQX1M \REG_reg[0]  ( .D(\REG[1] ), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC_RST) );
endmodule


module RST_SYNC_NUM_STAGES2_test_1 ( RST, CLK, SYNC_RST, test_si, test_so, 
        test_se );
  input RST, CLK, test_si, test_se;
  output SYNC_RST, test_so;
  wire   \REG[1] ;
  assign test_so = \REG[1] ;

  SDFFRQX2M \REG_reg[1]  ( .D(1'b1), .SI(SYNC_RST), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\REG[1] ) );
  SDFFRQX1M \REG_reg[0]  ( .D(\REG[1] ), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC_RST) );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8_test_1 ( CLK, RST, unsync_bus, 
        bus_enable, sync_bus, enable_pulse, test_si, test_se );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable, test_si, test_se;
  output enable_pulse;
  wire   pulse_reg, n1, n4, n6, n8, n10, n12, n14, n16, n18, n34;
  wire   [1:0] MFF;

  SDFFRQX1M \MFF_reg[1]  ( .D(bus_enable), .SI(MFF[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(MFF[1]) );
  SDFFRQX1M \MFF_reg[0]  ( .D(MFF[1]), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(MFF[0]) );
  SDFFRQX1M pulse_reg_reg ( .D(MFF[0]), .SI(enable_pulse), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(pulse_reg) );
  SDFFRQX1M enable_pulse_reg ( .D(n34), .SI(MFF[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(enable_pulse) );
  SDFFRQX1M \sync_bus_reg[7]  ( .D(n18), .SI(sync_bus[6]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[7]) );
  SDFFRQX1M \sync_bus_reg[6]  ( .D(n16), .SI(sync_bus[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[6]) );
  SDFFRQX1M \sync_bus_reg[5]  ( .D(n14), .SI(sync_bus[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[5]) );
  SDFFRQX1M \sync_bus_reg[4]  ( .D(n12), .SI(sync_bus[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[4]) );
  SDFFRQX1M \sync_bus_reg[3]  ( .D(n10), .SI(sync_bus[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[3]) );
  SDFFRQX1M \sync_bus_reg[2]  ( .D(n8), .SI(sync_bus[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[2]) );
  SDFFRQX1M \sync_bus_reg[1]  ( .D(n6), .SI(sync_bus[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[1]) );
  SDFFRQX1M \sync_bus_reg[0]  ( .D(n4), .SI(pulse_reg), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sync_bus[0]) );
  INVX2M U27 ( .A(n1), .Y(n34) );
  NAND2BX2M U28 ( .AN(pulse_reg), .B(MFF[0]), .Y(n1) );
  AO22X1M U29 ( .A0(unsync_bus[0]), .A1(n34), .B0(sync_bus[0]), .B1(n1), .Y(n4) );
  AO22X1M U30 ( .A0(unsync_bus[1]), .A1(n34), .B0(sync_bus[1]), .B1(n1), .Y(n6) );
  AO22X1M U31 ( .A0(unsync_bus[2]), .A1(n34), .B0(sync_bus[2]), .B1(n1), .Y(n8) );
  AO22X1M U32 ( .A0(unsync_bus[3]), .A1(n34), .B0(sync_bus[3]), .B1(n1), .Y(
        n10) );
  AO22X1M U33 ( .A0(unsync_bus[4]), .A1(n34), .B0(sync_bus[4]), .B1(n1), .Y(
        n12) );
  AO22X1M U34 ( .A0(unsync_bus[5]), .A1(n34), .B0(sync_bus[5]), .B1(n1), .Y(
        n14) );
  AO22X1M U35 ( .A0(unsync_bus[6]), .A1(n34), .B0(sync_bus[6]), .B1(n1), .Y(
        n16) );
  AO22X1M U36 ( .A0(unsync_bus[7]), .A1(n34), .B0(sync_bus[7]), .B1(n1), .Y(
        n18) );
endmodule


module FIFO_BUFFER_ADDR_WIDTH3_BUFFER_DEPTH8_BUFFER_WIDTH8_test_1 ( w_clk_en, 
        w_clk, w_rst, w_address, r_address, w_data, r_data, test_si2, test_si1, 
        test_so2, test_so1, test_se );
  input [2:0] w_address;
  input [2:0] r_address;
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk_en, w_clk, w_rst, test_si2, test_si1, test_se;
  output test_so2, test_so1;
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
         n18, n19, n20, n21, n22, n25, n27, n29, n31, n33, n35, n37, n39, n41,
         n43, n45, n47, n49, n51, n53, n55, n57, n59, n61, n63, n65, n67, n69,
         n71, n73, n75, n77, n79, n81, n83, n85, n87, n89, n91, n93, n95, n97,
         n99, n101, n103, n105, n107, n109, n111, n113, n115, n117, n119, n121,
         n123, n125, n127, n129, n131, n133, n135, n137, n139, n141, n143,
         n145, n147, n149, n151, n11, n16, n23, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n202;
  assign N10 = w_address[0];
  assign N11 = w_address[1];
  assign N12 = w_address[2];
  assign N13 = r_address[0];
  assign N14 = r_address[1];
  assign N15 = r_address[2];
  assign test_so2 = \memory[7][7] ;
  assign test_so1 = \memory[2][5] ;

  SDFFRQX2M \memory_reg[5][7]  ( .D(n119), .SI(\memory[5][6] ), .SE(n202), 
        .CK(w_clk), .RN(n191), .Q(\memory[5][7] ) );
  SDFFRQX2M \memory_reg[5][6]  ( .D(n117), .SI(\memory[5][5] ), .SE(n202), 
        .CK(w_clk), .RN(n191), .Q(\memory[5][6] ) );
  SDFFRQX2M \memory_reg[5][5]  ( .D(n115), .SI(\memory[5][4] ), .SE(n202), 
        .CK(w_clk), .RN(n191), .Q(\memory[5][5] ) );
  SDFFRQX2M \memory_reg[5][4]  ( .D(n113), .SI(\memory[5][3] ), .SE(n202), 
        .CK(w_clk), .RN(n191), .Q(\memory[5][4] ) );
  SDFFRQX2M \memory_reg[5][3]  ( .D(n111), .SI(\memory[5][2] ), .SE(n202), 
        .CK(w_clk), .RN(n191), .Q(\memory[5][3] ) );
  SDFFRQX2M \memory_reg[5][2]  ( .D(n109), .SI(\memory[5][1] ), .SE(n202), 
        .CK(w_clk), .RN(n191), .Q(\memory[5][2] ) );
  SDFFRQX2M \memory_reg[5][1]  ( .D(n107), .SI(\memory[5][0] ), .SE(n202), 
        .CK(w_clk), .RN(n191), .Q(\memory[5][1] ) );
  SDFFRQX2M \memory_reg[5][0]  ( .D(n105), .SI(\memory[4][7] ), .SE(n202), 
        .CK(w_clk), .RN(n191), .Q(\memory[5][0] ) );
  SDFFRQX2M \memory_reg[1][7]  ( .D(n55), .SI(\memory[1][6] ), .SE(n202), .CK(
        w_clk), .RN(n194), .Q(\memory[1][7] ) );
  SDFFRQX2M \memory_reg[1][6]  ( .D(n53), .SI(\memory[1][5] ), .SE(n202), .CK(
        w_clk), .RN(n194), .Q(\memory[1][6] ) );
  SDFFRQX2M \memory_reg[1][5]  ( .D(n51), .SI(\memory[1][4] ), .SE(n202), .CK(
        w_clk), .RN(n194), .Q(\memory[1][5] ) );
  SDFFRQX2M \memory_reg[1][4]  ( .D(n49), .SI(\memory[1][3] ), .SE(n202), .CK(
        w_clk), .RN(n194), .Q(\memory[1][4] ) );
  SDFFRQX2M \memory_reg[1][3]  ( .D(n47), .SI(\memory[1][2] ), .SE(n202), .CK(
        w_clk), .RN(n194), .Q(\memory[1][3] ) );
  SDFFRQX2M \memory_reg[1][2]  ( .D(n45), .SI(\memory[1][1] ), .SE(n202), .CK(
        w_clk), .RN(n194), .Q(\memory[1][2] ) );
  SDFFRQX2M \memory_reg[1][1]  ( .D(n43), .SI(\memory[1][0] ), .SE(n202), .CK(
        w_clk), .RN(n194), .Q(\memory[1][1] ) );
  SDFFRQX2M \memory_reg[1][0]  ( .D(n41), .SI(\memory[0][7] ), .SE(n202), .CK(
        w_clk), .RN(n194), .Q(\memory[1][0] ) );
  SDFFRQX2M \memory_reg[7][7]  ( .D(n151), .SI(\memory[7][6] ), .SE(n202), 
        .CK(w_clk), .RN(n190), .Q(\memory[7][7] ) );
  SDFFRQX2M \memory_reg[7][6]  ( .D(n149), .SI(\memory[7][5] ), .SE(n202), 
        .CK(w_clk), .RN(n190), .Q(\memory[7][6] ) );
  SDFFRQX2M \memory_reg[7][5]  ( .D(n147), .SI(\memory[7][4] ), .SE(n202), 
        .CK(w_clk), .RN(n190), .Q(\memory[7][5] ) );
  SDFFRQX2M \memory_reg[7][4]  ( .D(n145), .SI(\memory[7][3] ), .SE(n202), 
        .CK(w_clk), .RN(n190), .Q(\memory[7][4] ) );
  SDFFRQX2M \memory_reg[7][3]  ( .D(n143), .SI(\memory[7][2] ), .SE(n202), 
        .CK(w_clk), .RN(n190), .Q(\memory[7][3] ) );
  SDFFRQX2M \memory_reg[7][2]  ( .D(n141), .SI(\memory[7][1] ), .SE(n202), 
        .CK(w_clk), .RN(n190), .Q(\memory[7][2] ) );
  SDFFRQX2M \memory_reg[7][1]  ( .D(n139), .SI(\memory[7][0] ), .SE(n202), 
        .CK(w_clk), .RN(n190), .Q(\memory[7][1] ) );
  SDFFRQX2M \memory_reg[7][0]  ( .D(n137), .SI(\memory[6][7] ), .SE(n202), 
        .CK(w_clk), .RN(n190), .Q(\memory[7][0] ) );
  SDFFRQX2M \memory_reg[3][7]  ( .D(n87), .SI(\memory[3][6] ), .SE(n202), .CK(
        w_clk), .RN(n192), .Q(\memory[3][7] ) );
  SDFFRQX2M \memory_reg[3][6]  ( .D(n85), .SI(\memory[3][5] ), .SE(n202), .CK(
        w_clk), .RN(n192), .Q(\memory[3][6] ) );
  SDFFRQX2M \memory_reg[3][5]  ( .D(n83), .SI(\memory[3][4] ), .SE(n202), .CK(
        w_clk), .RN(n192), .Q(\memory[3][5] ) );
  SDFFRQX2M \memory_reg[3][4]  ( .D(n81), .SI(\memory[3][3] ), .SE(n202), .CK(
        w_clk), .RN(n192), .Q(\memory[3][4] ) );
  SDFFRQX2M \memory_reg[3][3]  ( .D(n79), .SI(\memory[3][2] ), .SE(n202), .CK(
        w_clk), .RN(n193), .Q(\memory[3][3] ) );
  SDFFRQX2M \memory_reg[3][2]  ( .D(n77), .SI(\memory[3][1] ), .SE(n202), .CK(
        w_clk), .RN(n193), .Q(\memory[3][2] ) );
  SDFFRQX2M \memory_reg[3][1]  ( .D(n75), .SI(\memory[3][0] ), .SE(n202), .CK(
        w_clk), .RN(n193), .Q(\memory[3][1] ) );
  SDFFRQX2M \memory_reg[3][0]  ( .D(n73), .SI(\memory[2][7] ), .SE(n202), .CK(
        w_clk), .RN(n193), .Q(\memory[3][0] ) );
  SDFFRQX2M \memory_reg[6][7]  ( .D(n135), .SI(\memory[6][6] ), .SE(n202), 
        .CK(w_clk), .RN(n190), .Q(\memory[6][7] ) );
  SDFFRQX2M \memory_reg[6][6]  ( .D(n133), .SI(\memory[6][5] ), .SE(test_se), 
        .CK(w_clk), .RN(n190), .Q(\memory[6][6] ) );
  SDFFRQX2M \memory_reg[6][5]  ( .D(n131), .SI(\memory[6][4] ), .SE(test_se), 
        .CK(w_clk), .RN(n190), .Q(\memory[6][5] ) );
  SDFFRQX2M \memory_reg[6][4]  ( .D(n129), .SI(\memory[6][3] ), .SE(test_se), 
        .CK(w_clk), .RN(n190), .Q(\memory[6][4] ) );
  SDFFRQX2M \memory_reg[6][3]  ( .D(n127), .SI(\memory[6][2] ), .SE(test_se), 
        .CK(w_clk), .RN(n191), .Q(\memory[6][3] ) );
  SDFFRQX2M \memory_reg[6][2]  ( .D(n125), .SI(\memory[6][1] ), .SE(test_se), 
        .CK(w_clk), .RN(n191), .Q(\memory[6][2] ) );
  SDFFRQX2M \memory_reg[6][1]  ( .D(n123), .SI(\memory[6][0] ), .SE(test_se), 
        .CK(w_clk), .RN(n191), .Q(\memory[6][1] ) );
  SDFFRQX2M \memory_reg[6][0]  ( .D(n121), .SI(\memory[5][7] ), .SE(test_se), 
        .CK(w_clk), .RN(n191), .Q(\memory[6][0] ) );
  SDFFRQX2M \memory_reg[2][7]  ( .D(n71), .SI(\memory[2][6] ), .SE(test_se), 
        .CK(w_clk), .RN(n193), .Q(\memory[2][7] ) );
  SDFFRQX2M \memory_reg[2][6]  ( .D(n69), .SI(test_si2), .SE(test_se), .CK(
        w_clk), .RN(n193), .Q(\memory[2][6] ) );
  SDFFRQX2M \memory_reg[2][5]  ( .D(n67), .SI(\memory[2][4] ), .SE(test_se), 
        .CK(w_clk), .RN(n193), .Q(\memory[2][5] ) );
  SDFFRQX2M \memory_reg[2][4]  ( .D(n65), .SI(\memory[2][3] ), .SE(test_se), 
        .CK(w_clk), .RN(n193), .Q(\memory[2][4] ) );
  SDFFRQX2M \memory_reg[2][3]  ( .D(n63), .SI(\memory[2][2] ), .SE(test_se), 
        .CK(w_clk), .RN(n193), .Q(\memory[2][3] ) );
  SDFFRQX2M \memory_reg[2][2]  ( .D(n61), .SI(\memory[2][1] ), .SE(test_se), 
        .CK(w_clk), .RN(n193), .Q(\memory[2][2] ) );
  SDFFRQX2M \memory_reg[2][1]  ( .D(n59), .SI(\memory[2][0] ), .SE(test_se), 
        .CK(w_clk), .RN(n193), .Q(\memory[2][1] ) );
  SDFFRQX2M \memory_reg[2][0]  ( .D(n57), .SI(\memory[1][7] ), .SE(test_se), 
        .CK(w_clk), .RN(n193), .Q(\memory[2][0] ) );
  SDFFRQX2M \memory_reg[4][7]  ( .D(n103), .SI(\memory[4][6] ), .SE(test_se), 
        .CK(w_clk), .RN(n192), .Q(\memory[4][7] ) );
  SDFFRQX2M \memory_reg[4][6]  ( .D(n101), .SI(\memory[4][5] ), .SE(test_se), 
        .CK(w_clk), .RN(n192), .Q(\memory[4][6] ) );
  SDFFRQX2M \memory_reg[4][5]  ( .D(n99), .SI(\memory[4][4] ), .SE(test_se), 
        .CK(w_clk), .RN(n192), .Q(\memory[4][5] ) );
  SDFFRQX2M \memory_reg[4][4]  ( .D(n97), .SI(\memory[4][3] ), .SE(test_se), 
        .CK(w_clk), .RN(n192), .Q(\memory[4][4] ) );
  SDFFRQX2M \memory_reg[4][3]  ( .D(n95), .SI(\memory[4][2] ), .SE(test_se), 
        .CK(w_clk), .RN(n192), .Q(\memory[4][3] ) );
  SDFFRQX2M \memory_reg[4][2]  ( .D(n93), .SI(\memory[4][1] ), .SE(test_se), 
        .CK(w_clk), .RN(n192), .Q(\memory[4][2] ) );
  SDFFRQX2M \memory_reg[4][1]  ( .D(n91), .SI(\memory[4][0] ), .SE(test_se), 
        .CK(w_clk), .RN(n192), .Q(\memory[4][1] ) );
  SDFFRQX2M \memory_reg[4][0]  ( .D(n89), .SI(\memory[3][7] ), .SE(test_se), 
        .CK(w_clk), .RN(n192), .Q(\memory[4][0] ) );
  SDFFRQX2M \memory_reg[0][7]  ( .D(n39), .SI(\memory[0][6] ), .SE(test_se), 
        .CK(w_clk), .RN(n194), .Q(\memory[0][7] ) );
  SDFFRQX2M \memory_reg[0][6]  ( .D(n37), .SI(\memory[0][5] ), .SE(test_se), 
        .CK(w_clk), .RN(n194), .Q(\memory[0][6] ) );
  SDFFRQX2M \memory_reg[0][5]  ( .D(n35), .SI(\memory[0][4] ), .SE(test_se), 
        .CK(w_clk), .RN(n194), .Q(\memory[0][5] ) );
  SDFFRQX2M \memory_reg[0][4]  ( .D(n33), .SI(\memory[0][3] ), .SE(test_se), 
        .CK(w_clk), .RN(n194), .Q(\memory[0][4] ) );
  SDFFRQX2M \memory_reg[0][3]  ( .D(n31), .SI(\memory[0][2] ), .SE(test_se), 
        .CK(w_clk), .RN(n195), .Q(\memory[0][3] ) );
  SDFFRQX2M \memory_reg[0][2]  ( .D(n29), .SI(\memory[0][1] ), .SE(test_se), 
        .CK(w_clk), .RN(n195), .Q(\memory[0][2] ) );
  SDFFRQX2M \memory_reg[0][1]  ( .D(n27), .SI(\memory[0][0] ), .SE(test_se), 
        .CK(w_clk), .RN(n195), .Q(\memory[0][1] ) );
  SDFFRQX2M \memory_reg[0][0]  ( .D(n25), .SI(test_si1), .SE(test_se), .CK(
        w_clk), .RN(n195), .Q(\memory[0][0] ) );
  BUFX2M U2 ( .A(n15), .Y(n186) );
  BUFX2M U3 ( .A(n19), .Y(n185) );
  BUFX2M U4 ( .A(n12), .Y(n187) );
  BUFX2M U5 ( .A(n22), .Y(n184) );
  INVX2M U6 ( .A(w_clk_en), .Y(n196) );
  BUFX2M U7 ( .A(n189), .Y(n194) );
  BUFX2M U8 ( .A(n189), .Y(n193) );
  BUFX2M U9 ( .A(n188), .Y(n192) );
  BUFX2M U10 ( .A(n188), .Y(n191) );
  BUFX2M U11 ( .A(n188), .Y(n190) );
  BUFX2M U12 ( .A(n189), .Y(n195) );
  BUFX2M U13 ( .A(w_rst), .Y(n189) );
  BUFX2M U14 ( .A(w_rst), .Y(n188) );
  NAND2X2M U15 ( .A(n10), .B(n197), .Y(n2) );
  NAND2X2M U16 ( .A(n14), .B(n197), .Y(n13) );
  NAND2X2M U17 ( .A(n18), .B(n197), .Y(n17) );
  NAND2X2M U18 ( .A(n21), .B(n197), .Y(n20) );
  AOI22X1M U19 ( .A0(w_data[0]), .A1(w_clk_en), .B0(N25), .B1(n196), .Y(n1) );
  MX2X2M U20 ( .A(n16), .B(n11), .S0(N12), .Y(N25) );
  AOI22X1M U21 ( .A0(w_data[1]), .A1(w_clk_en), .B0(N24), .B1(n196), .Y(n3) );
  MX2X2M U22 ( .A(n152), .B(n23), .S0(N12), .Y(N24) );
  AOI22X1M U23 ( .A0(w_data[2]), .A1(w_clk_en), .B0(N23), .B1(n196), .Y(n4) );
  MX2X2M U24 ( .A(n154), .B(n153), .S0(N12), .Y(N23) );
  AOI22X1M U25 ( .A0(w_data[3]), .A1(w_clk_en), .B0(N22), .B1(n196), .Y(n5) );
  MX2X2M U26 ( .A(n156), .B(n155), .S0(N12), .Y(N22) );
  AOI22X1M U27 ( .A0(w_data[4]), .A1(w_clk_en), .B0(N21), .B1(n196), .Y(n6) );
  MX2X2M U28 ( .A(n158), .B(n157), .S0(N12), .Y(N21) );
  AOI22X1M U29 ( .A0(w_data[5]), .A1(w_clk_en), .B0(N20), .B1(n196), .Y(n7) );
  MX2X2M U30 ( .A(n160), .B(n159), .S0(N12), .Y(N20) );
  AOI22X1M U31 ( .A0(w_data[6]), .A1(w_clk_en), .B0(N19), .B1(n196), .Y(n8) );
  MX2X2M U32 ( .A(n162), .B(n161), .S0(N12), .Y(N19) );
  AOI22X1M U33 ( .A0(w_data[7]), .A1(w_clk_en), .B0(N18), .B1(n196), .Y(n9) );
  MX2X2M U34 ( .A(n164), .B(n163), .S0(N12), .Y(N18) );
  OAI2BB2X1M U35 ( .B0(n1), .B1(n2), .A0N(\memory[0][0] ), .A1N(n2), .Y(n25)
         );
  OAI2BB2X1M U36 ( .B0(n3), .B1(n2), .A0N(\memory[0][1] ), .A1N(n2), .Y(n27)
         );
  OAI2BB2X1M U37 ( .B0(n4), .B1(n2), .A0N(\memory[0][2] ), .A1N(n2), .Y(n29)
         );
  OAI2BB2X1M U38 ( .B0(n5), .B1(n2), .A0N(\memory[0][3] ), .A1N(n2), .Y(n31)
         );
  OAI2BB2X1M U39 ( .B0(n6), .B1(n2), .A0N(\memory[0][4] ), .A1N(n2), .Y(n33)
         );
  OAI2BB2X1M U40 ( .B0(n7), .B1(n2), .A0N(\memory[0][5] ), .A1N(n2), .Y(n35)
         );
  OAI2BB2X1M U41 ( .B0(n8), .B1(n2), .A0N(\memory[0][6] ), .A1N(n2), .Y(n37)
         );
  OAI2BB2X1M U42 ( .B0(n9), .B1(n2), .A0N(\memory[0][7] ), .A1N(n2), .Y(n39)
         );
  OAI2BB2X1M U43 ( .B0(n1), .B1(n187), .A0N(\memory[1][0] ), .A1N(n187), .Y(
        n41) );
  OAI2BB2X1M U44 ( .B0(n3), .B1(n187), .A0N(\memory[1][1] ), .A1N(n187), .Y(
        n43) );
  OAI2BB2X1M U45 ( .B0(n4), .B1(n187), .A0N(\memory[1][2] ), .A1N(n187), .Y(
        n45) );
  OAI2BB2X1M U46 ( .B0(n5), .B1(n187), .A0N(\memory[1][3] ), .A1N(n187), .Y(
        n47) );
  OAI2BB2X1M U47 ( .B0(n6), .B1(n187), .A0N(\memory[1][4] ), .A1N(n187), .Y(
        n49) );
  OAI2BB2X1M U48 ( .B0(n7), .B1(n187), .A0N(\memory[1][5] ), .A1N(n187), .Y(
        n51) );
  OAI2BB2X1M U49 ( .B0(n8), .B1(n187), .A0N(\memory[1][6] ), .A1N(n187), .Y(
        n53) );
  OAI2BB2X1M U50 ( .B0(n9), .B1(n187), .A0N(\memory[1][7] ), .A1N(n187), .Y(
        n55) );
  OAI2BB2X1M U51 ( .B0(n1), .B1(n13), .A0N(\memory[2][0] ), .A1N(n13), .Y(n57)
         );
  OAI2BB2X1M U52 ( .B0(n3), .B1(n13), .A0N(\memory[2][1] ), .A1N(n13), .Y(n59)
         );
  OAI2BB2X1M U53 ( .B0(n4), .B1(n13), .A0N(\memory[2][2] ), .A1N(n13), .Y(n61)
         );
  OAI2BB2X1M U54 ( .B0(n5), .B1(n13), .A0N(\memory[2][3] ), .A1N(n13), .Y(n63)
         );
  OAI2BB2X1M U55 ( .B0(n6), .B1(n13), .A0N(\memory[2][4] ), .A1N(n13), .Y(n65)
         );
  OAI2BB2X1M U56 ( .B0(n7), .B1(n13), .A0N(\memory[2][5] ), .A1N(n13), .Y(n67)
         );
  OAI2BB2X1M U57 ( .B0(n8), .B1(n13), .A0N(\memory[2][6] ), .A1N(n13), .Y(n69)
         );
  OAI2BB2X1M U58 ( .B0(n9), .B1(n13), .A0N(\memory[2][7] ), .A1N(n13), .Y(n71)
         );
  OAI2BB2X1M U59 ( .B0(n1), .B1(n186), .A0N(\memory[3][0] ), .A1N(n186), .Y(
        n73) );
  OAI2BB2X1M U60 ( .B0(n3), .B1(n186), .A0N(\memory[3][1] ), .A1N(n186), .Y(
        n75) );
  OAI2BB2X1M U61 ( .B0(n4), .B1(n186), .A0N(\memory[3][2] ), .A1N(n186), .Y(
        n77) );
  OAI2BB2X1M U62 ( .B0(n5), .B1(n186), .A0N(\memory[3][3] ), .A1N(n186), .Y(
        n79) );
  OAI2BB2X1M U63 ( .B0(n6), .B1(n186), .A0N(\memory[3][4] ), .A1N(n186), .Y(
        n81) );
  OAI2BB2X1M U64 ( .B0(n7), .B1(n186), .A0N(\memory[3][5] ), .A1N(n186), .Y(
        n83) );
  OAI2BB2X1M U65 ( .B0(n8), .B1(n186), .A0N(\memory[3][6] ), .A1N(n186), .Y(
        n85) );
  OAI2BB2X1M U66 ( .B0(n9), .B1(n186), .A0N(\memory[3][7] ), .A1N(n186), .Y(
        n87) );
  OAI2BB2X1M U67 ( .B0(n1), .B1(n17), .A0N(\memory[4][0] ), .A1N(n17), .Y(n89)
         );
  OAI2BB2X1M U68 ( .B0(n3), .B1(n17), .A0N(\memory[4][1] ), .A1N(n17), .Y(n91)
         );
  OAI2BB2X1M U69 ( .B0(n4), .B1(n17), .A0N(\memory[4][2] ), .A1N(n17), .Y(n93)
         );
  OAI2BB2X1M U70 ( .B0(n5), .B1(n17), .A0N(\memory[4][3] ), .A1N(n17), .Y(n95)
         );
  OAI2BB2X1M U71 ( .B0(n6), .B1(n17), .A0N(\memory[4][4] ), .A1N(n17), .Y(n97)
         );
  OAI2BB2X1M U72 ( .B0(n7), .B1(n17), .A0N(\memory[4][5] ), .A1N(n17), .Y(n99)
         );
  OAI2BB2X1M U73 ( .B0(n8), .B1(n17), .A0N(\memory[4][6] ), .A1N(n17), .Y(n101) );
  OAI2BB2X1M U74 ( .B0(n9), .B1(n17), .A0N(\memory[4][7] ), .A1N(n17), .Y(n103) );
  OAI2BB2X1M U75 ( .B0(n1), .B1(n185), .A0N(\memory[5][0] ), .A1N(n185), .Y(
        n105) );
  OAI2BB2X1M U76 ( .B0(n3), .B1(n185), .A0N(\memory[5][1] ), .A1N(n185), .Y(
        n107) );
  OAI2BB2X1M U77 ( .B0(n4), .B1(n185), .A0N(\memory[5][2] ), .A1N(n185), .Y(
        n109) );
  OAI2BB2X1M U78 ( .B0(n5), .B1(n185), .A0N(\memory[5][3] ), .A1N(n185), .Y(
        n111) );
  OAI2BB2X1M U79 ( .B0(n6), .B1(n185), .A0N(\memory[5][4] ), .A1N(n185), .Y(
        n113) );
  OAI2BB2X1M U80 ( .B0(n7), .B1(n185), .A0N(\memory[5][5] ), .A1N(n185), .Y(
        n115) );
  OAI2BB2X1M U81 ( .B0(n8), .B1(n185), .A0N(\memory[5][6] ), .A1N(n185), .Y(
        n117) );
  OAI2BB2X1M U82 ( .B0(n9), .B1(n185), .A0N(\memory[5][7] ), .A1N(n185), .Y(
        n119) );
  OAI2BB2X1M U83 ( .B0(n1), .B1(n20), .A0N(\memory[6][0] ), .A1N(n20), .Y(n121) );
  OAI2BB2X1M U84 ( .B0(n3), .B1(n20), .A0N(\memory[6][1] ), .A1N(n20), .Y(n123) );
  OAI2BB2X1M U85 ( .B0(n4), .B1(n20), .A0N(\memory[6][2] ), .A1N(n20), .Y(n125) );
  OAI2BB2X1M U86 ( .B0(n5), .B1(n20), .A0N(\memory[6][3] ), .A1N(n20), .Y(n127) );
  OAI2BB2X1M U87 ( .B0(n6), .B1(n20), .A0N(\memory[6][4] ), .A1N(n20), .Y(n129) );
  OAI2BB2X1M U88 ( .B0(n7), .B1(n20), .A0N(\memory[6][5] ), .A1N(n20), .Y(n131) );
  OAI2BB2X1M U153 ( .B0(n8), .B1(n20), .A0N(\memory[6][6] ), .A1N(n20), .Y(
        n133) );
  OAI2BB2X1M U154 ( .B0(n9), .B1(n20), .A0N(\memory[6][7] ), .A1N(n20), .Y(
        n135) );
  OAI2BB2X1M U155 ( .B0(n1), .B1(n184), .A0N(\memory[7][0] ), .A1N(n184), .Y(
        n137) );
  OAI2BB2X1M U156 ( .B0(n3), .B1(n184), .A0N(\memory[7][1] ), .A1N(n184), .Y(
        n139) );
  OAI2BB2X1M U157 ( .B0(n4), .B1(n184), .A0N(\memory[7][2] ), .A1N(n184), .Y(
        n141) );
  OAI2BB2X1M U158 ( .B0(n5), .B1(n184), .A0N(\memory[7][3] ), .A1N(n184), .Y(
        n143) );
  OAI2BB2X1M U159 ( .B0(n6), .B1(n184), .A0N(\memory[7][4] ), .A1N(n184), .Y(
        n145) );
  OAI2BB2X1M U160 ( .B0(n7), .B1(n184), .A0N(\memory[7][5] ), .A1N(n184), .Y(
        n147) );
  OAI2BB2X1M U161 ( .B0(n8), .B1(n184), .A0N(\memory[7][6] ), .A1N(n184), .Y(
        n149) );
  OAI2BB2X1M U162 ( .B0(n9), .B1(n184), .A0N(\memory[7][7] ), .A1N(n184), .Y(
        n151) );
  BUFX4M U163 ( .A(N10), .Y(n165) );
  MX2X2M U164 ( .A(n173), .B(n172), .S0(N15), .Y(r_data[3]) );
  MX4X1M U165 ( .A(\memory[4][3] ), .B(\memory[5][3] ), .C(\memory[6][3] ), 
        .D(\memory[7][3] ), .S0(n182), .S1(N14), .Y(n172) );
  MX4X1M U166 ( .A(\memory[0][3] ), .B(\memory[1][3] ), .C(\memory[2][3] ), 
        .D(\memory[3][3] ), .S0(n183), .S1(N14), .Y(n173) );
  MX2X2M U167 ( .A(n179), .B(n178), .S0(N15), .Y(r_data[6]) );
  MX4X1M U168 ( .A(\memory[4][6] ), .B(\memory[5][6] ), .C(\memory[6][6] ), 
        .D(\memory[7][6] ), .S0(n182), .S1(N14), .Y(n178) );
  MX4X1M U169 ( .A(\memory[0][6] ), .B(\memory[1][6] ), .C(\memory[2][6] ), 
        .D(\memory[3][6] ), .S0(n183), .S1(N14), .Y(n179) );
  MX2X2M U170 ( .A(n167), .B(n166), .S0(N15), .Y(r_data[0]) );
  MX4X1M U171 ( .A(\memory[4][0] ), .B(\memory[5][0] ), .C(\memory[6][0] ), 
        .D(\memory[7][0] ), .S0(n182), .S1(N14), .Y(n166) );
  MX4X1M U172 ( .A(\memory[0][0] ), .B(\memory[1][0] ), .C(\memory[2][0] ), 
        .D(\memory[3][0] ), .S0(n183), .S1(N14), .Y(n167) );
  MX2X2M U173 ( .A(n175), .B(n174), .S0(N15), .Y(r_data[4]) );
  MX4X1M U174 ( .A(\memory[4][4] ), .B(\memory[5][4] ), .C(\memory[6][4] ), 
        .D(\memory[7][4] ), .S0(n182), .S1(N14), .Y(n174) );
  MX4X1M U175 ( .A(\memory[0][4] ), .B(\memory[1][4] ), .C(\memory[2][4] ), 
        .D(\memory[3][4] ), .S0(n183), .S1(N14), .Y(n175) );
  MX2X2M U176 ( .A(n169), .B(n168), .S0(N15), .Y(r_data[1]) );
  MX4X1M U177 ( .A(\memory[4][1] ), .B(\memory[5][1] ), .C(\memory[6][1] ), 
        .D(\memory[7][1] ), .S0(n182), .S1(N14), .Y(n168) );
  MX4X1M U178 ( .A(\memory[0][1] ), .B(\memory[1][1] ), .C(\memory[2][1] ), 
        .D(\memory[3][1] ), .S0(n183), .S1(N14), .Y(n169) );
  MX2X2M U179 ( .A(n177), .B(n176), .S0(N15), .Y(r_data[5]) );
  MX4X1M U180 ( .A(\memory[4][5] ), .B(\memory[5][5] ), .C(\memory[6][5] ), 
        .D(\memory[7][5] ), .S0(n182), .S1(N14), .Y(n176) );
  MX4X1M U181 ( .A(\memory[0][5] ), .B(\memory[1][5] ), .C(\memory[2][5] ), 
        .D(\memory[3][5] ), .S0(n183), .S1(N14), .Y(n177) );
  MX2X2M U182 ( .A(n181), .B(n180), .S0(N15), .Y(r_data[7]) );
  MX4X1M U183 ( .A(\memory[4][7] ), .B(\memory[5][7] ), .C(\memory[6][7] ), 
        .D(\memory[7][7] ), .S0(n182), .S1(N14), .Y(n180) );
  MX4X1M U184 ( .A(\memory[0][7] ), .B(\memory[1][7] ), .C(\memory[2][7] ), 
        .D(\memory[3][7] ), .S0(n183), .S1(N14), .Y(n181) );
  MX4X1M U185 ( .A(\memory[0][0] ), .B(\memory[1][0] ), .C(\memory[2][0] ), 
        .D(\memory[3][0] ), .S0(n165), .S1(N11), .Y(n16) );
  MX4X1M U186 ( .A(\memory[0][1] ), .B(\memory[1][1] ), .C(\memory[2][1] ), 
        .D(\memory[3][1] ), .S0(n165), .S1(N11), .Y(n152) );
  MX4X1M U187 ( .A(\memory[0][2] ), .B(\memory[1][2] ), .C(\memory[2][2] ), 
        .D(\memory[3][2] ), .S0(n165), .S1(N11), .Y(n154) );
  MX4X1M U188 ( .A(\memory[0][3] ), .B(\memory[1][3] ), .C(\memory[2][3] ), 
        .D(\memory[3][3] ), .S0(n165), .S1(N11), .Y(n156) );
  MX4X1M U189 ( .A(\memory[0][4] ), .B(\memory[1][4] ), .C(\memory[2][4] ), 
        .D(\memory[3][4] ), .S0(n165), .S1(N11), .Y(n158) );
  MX4X1M U190 ( .A(\memory[0][5] ), .B(\memory[1][5] ), .C(\memory[2][5] ), 
        .D(\memory[3][5] ), .S0(n165), .S1(N11), .Y(n160) );
  MX4X1M U191 ( .A(\memory[0][6] ), .B(\memory[1][6] ), .C(\memory[2][6] ), 
        .D(\memory[3][6] ), .S0(n165), .S1(N11), .Y(n162) );
  MX4X1M U192 ( .A(\memory[0][7] ), .B(\memory[1][7] ), .C(\memory[2][7] ), 
        .D(\memory[3][7] ), .S0(n165), .S1(N11), .Y(n164) );
  MX4X1M U193 ( .A(\memory[4][0] ), .B(\memory[5][0] ), .C(\memory[6][0] ), 
        .D(\memory[7][0] ), .S0(n165), .S1(N11), .Y(n11) );
  MX4X1M U194 ( .A(\memory[4][1] ), .B(\memory[5][1] ), .C(\memory[6][1] ), 
        .D(\memory[7][1] ), .S0(n165), .S1(N11), .Y(n23) );
  MX4X1M U195 ( .A(\memory[4][2] ), .B(\memory[5][2] ), .C(\memory[6][2] ), 
        .D(\memory[7][2] ), .S0(n165), .S1(N11), .Y(n153) );
  MX4X1M U196 ( .A(\memory[4][3] ), .B(\memory[5][3] ), .C(\memory[6][3] ), 
        .D(\memory[7][3] ), .S0(n165), .S1(N11), .Y(n155) );
  MX4X1M U197 ( .A(\memory[4][4] ), .B(\memory[5][4] ), .C(\memory[6][4] ), 
        .D(\memory[7][4] ), .S0(n165), .S1(N11), .Y(n157) );
  MX4X1M U198 ( .A(\memory[4][5] ), .B(\memory[5][5] ), .C(\memory[6][5] ), 
        .D(\memory[7][5] ), .S0(n165), .S1(N11), .Y(n159) );
  MX4X1M U199 ( .A(\memory[4][6] ), .B(\memory[5][6] ), .C(\memory[6][6] ), 
        .D(\memory[7][6] ), .S0(n165), .S1(N11), .Y(n161) );
  MX4X1M U200 ( .A(\memory[4][7] ), .B(\memory[5][7] ), .C(\memory[6][7] ), 
        .D(\memory[7][7] ), .S0(n165), .S1(N11), .Y(n163) );
  BUFX2M U201 ( .A(N13), .Y(n183) );
  BUFX2M U202 ( .A(N13), .Y(n182) );
  MX2X2M U203 ( .A(n171), .B(n170), .S0(N15), .Y(r_data[2]) );
  MX4X1M U204 ( .A(\memory[4][2] ), .B(\memory[5][2] ), .C(\memory[6][2] ), 
        .D(\memory[7][2] ), .S0(n182), .S1(N14), .Y(n170) );
  MX4X1M U205 ( .A(\memory[0][2] ), .B(\memory[1][2] ), .C(\memory[2][2] ), 
        .D(\memory[3][2] ), .S0(n183), .S1(N14), .Y(n171) );
  NOR2X2M U206 ( .A(N12), .B(N11), .Y(n10) );
  NOR2X2M U207 ( .A(n198), .B(N12), .Y(n14) );
  INVX2M U208 ( .A(N10), .Y(n197) );
  INVX2M U209 ( .A(N11), .Y(n198) );
  NAND2X2M U210 ( .A(n14), .B(N10), .Y(n15) );
  NAND2X2M U211 ( .A(n18), .B(N10), .Y(n19) );
  NAND2X2M U212 ( .A(n21), .B(N10), .Y(n22) );
  NAND2X2M U213 ( .A(N10), .B(n10), .Y(n12) );
  AND2X2M U214 ( .A(N12), .B(N11), .Y(n21) );
  AND2X2M U215 ( .A(N12), .B(n198), .Y(n18) );
  DLY1X1M U216 ( .A(test_se), .Y(n202) );
endmodule


module FIFO_RD_ADDR_WIDTH3_test_1 ( r_CLK, r_RST, r_inc, w_ptr, r_empty, 
        r_ptr_grey, r_addr, test_si, test_se );
  input [3:0] w_ptr;
  output [3:0] r_ptr_grey;
  output [2:0] r_addr;
  input r_CLK, r_RST, r_inc, test_si, test_se;
  output r_empty;
  wire   n1, n2, n3, n4, n6, n7, n8, n10, n12, n14, n16, n20;

  SDFFRQX1M \r_ptr_reg[0]  ( .D(n16), .SI(test_si), .SE(test_se), .CK(r_CLK), 
        .RN(r_RST), .Q(r_addr[0]) );
  SDFFRQX1M \r_ptr_reg[1]  ( .D(n14), .SI(r_addr[0]), .SE(test_se), .CK(r_CLK), 
        .RN(r_RST), .Q(r_addr[1]) );
  SDFFRQX1M \r_ptr_reg[3]  ( .D(n10), .SI(r_addr[2]), .SE(test_se), .CK(r_CLK), 
        .RN(r_RST), .Q(r_ptr_grey[3]) );
  SDFFRQX1M \r_ptr_reg[2]  ( .D(n12), .SI(n20), .SE(test_se), .CK(r_CLK), .RN(
        r_RST), .Q(r_addr[2]) );
  NOR2X2M U7 ( .A(n8), .B(n20), .Y(n7) );
  CLKXOR2X2M U8 ( .A(n20), .B(n8), .Y(n14) );
  XNOR2X2M U9 ( .A(r_addr[0]), .B(n20), .Y(r_ptr_grey[0]) );
  NOR4X1M U10 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(r_empty) );
  CLKXOR2X2M U11 ( .A(w_ptr[3]), .B(r_ptr_grey[3]), .Y(n2) );
  INVX2M U12 ( .A(r_addr[1]), .Y(n20) );
  CLKXOR2X2M U13 ( .A(w_ptr[0]), .B(r_ptr_grey[0]), .Y(n3) );
  CLKXOR2X2M U14 ( .A(w_ptr[1]), .B(r_ptr_grey[1]), .Y(n4) );
  CLKXOR2X2M U15 ( .A(w_ptr[2]), .B(r_ptr_grey[2]), .Y(n1) );
  CLKXOR2X2M U16 ( .A(r_addr[1]), .B(r_addr[2]), .Y(r_ptr_grey[1]) );
  CLKXOR2X2M U17 ( .A(r_ptr_grey[3]), .B(r_addr[2]), .Y(r_ptr_grey[2]) );
  XNOR2X2M U18 ( .A(r_ptr_grey[3]), .B(n6), .Y(n10) );
  NAND2X2M U23 ( .A(n7), .B(r_addr[2]), .Y(n6) );
  NAND2X2M U24 ( .A(r_inc), .B(r_addr[0]), .Y(n8) );
  CLKXOR2X2M U25 ( .A(r_addr[2]), .B(n7), .Y(n12) );
  CLKXOR2X2M U26 ( .A(r_inc), .B(r_addr[0]), .Y(n16) );
endmodule


module FIFO_WR_ADDR_WIDTH3_test_1 ( w_CLK, w_RST, w_inc, r_ptr, w_full, 
        w_ptr_grey, w_addr, w_clk_en, test_si, test_se );
  input [3:0] r_ptr;
  output [3:0] w_ptr_grey;
  output [2:0] w_addr;
  input w_CLK, w_RST, w_inc, test_si, test_se;
  output w_full, w_clk_en;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;

  SDFFRQX2M \w_ptr_reg[3]  ( .D(n15), .SI(w_addr[2]), .SE(test_se), .CK(w_CLK), 
        .RN(w_RST), .Q(w_ptr_grey[3]) );
  SDFFRQX2M \w_ptr_reg[2]  ( .D(n16), .SI(w_addr[1]), .SE(test_se), .CK(w_CLK), 
        .RN(w_RST), .Q(w_addr[2]) );
  SDFFRQX2M \w_ptr_reg[1]  ( .D(n17), .SI(w_addr[0]), .SE(test_se), .CK(w_CLK), 
        .RN(w_RST), .Q(w_addr[1]) );
  SDFFRX1M \w_ptr_reg[0]  ( .D(n18), .SI(test_si), .SE(test_se), .CK(w_CLK), 
        .RN(w_RST), .Q(w_addr[0]), .QN(n5) );
  INVX2M U8 ( .A(n7), .Y(w_clk_en) );
  NAND2X2M U9 ( .A(w_inc), .B(n6), .Y(n7) );
  INVX2M U10 ( .A(n6), .Y(w_full) );
  XNOR2X2M U11 ( .A(w_ptr_grey[1]), .B(r_ptr[1]), .Y(n11) );
  NAND4X2M U12 ( .A(n11), .B(n12), .C(n13), .D(n14), .Y(n6) );
  CLKXOR2X2M U13 ( .A(w_ptr_grey[3]), .B(r_ptr[3]), .Y(n14) );
  CLKXOR2X2M U14 ( .A(r_ptr[2]), .B(w_ptr_grey[2]), .Y(n13) );
  XNOR2X2M U15 ( .A(w_ptr_grey[0]), .B(r_ptr[0]), .Y(n12) );
  CLKXOR2X2M U16 ( .A(w_ptr_grey[3]), .B(w_addr[2]), .Y(w_ptr_grey[2]) );
  CLKXOR2X2M U17 ( .A(w_addr[1]), .B(w_addr[2]), .Y(w_ptr_grey[1]) );
  XNOR2X2M U18 ( .A(n5), .B(w_addr[1]), .Y(w_ptr_grey[0]) );
  NOR2X2M U19 ( .A(n7), .B(n5), .Y(n10) );
  XNOR2X2M U20 ( .A(w_addr[2]), .B(n9), .Y(n16) );
  XNOR2X2M U21 ( .A(w_ptr_grey[3]), .B(n8), .Y(n15) );
  NAND2BX2M U22 ( .AN(n9), .B(w_addr[2]), .Y(n8) );
  NAND2X2M U23 ( .A(n10), .B(w_addr[1]), .Y(n9) );
  CLKXOR2X2M U24 ( .A(w_addr[1]), .B(n10), .Y(n17) );
  CLKXOR2X2M U25 ( .A(n5), .B(n7), .Y(n18) );
endmodule


module FIFO_DFF_ptr_width4_test_0 ( ptr, CLK, RST, sync_ptr, test_si, test_se
 );
  input [3:0] ptr;
  output [3:0] sync_ptr;
  input CLK, RST, test_si, test_se;

  wire   [3:0] R0;

  SDFFRQX1M \R1_reg[3]  ( .D(R0[3]), .SI(sync_ptr[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sync_ptr[3]) );
  SDFFRQX1M \R1_reg[2]  ( .D(R0[2]), .SI(sync_ptr[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sync_ptr[2]) );
  SDFFRQX1M \R1_reg[1]  ( .D(R0[1]), .SI(sync_ptr[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sync_ptr[1]) );
  SDFFRQX1M \R1_reg[0]  ( .D(R0[0]), .SI(R0[3]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(sync_ptr[0]) );
  SDFFRQX1M \R0_reg[3]  ( .D(ptr[3]), .SI(R0[2]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(R0[3]) );
  SDFFRQX1M \R0_reg[2]  ( .D(ptr[2]), .SI(R0[1]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(R0[2]) );
  SDFFRQX1M \R0_reg[0]  ( .D(ptr[0]), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(R0[0]) );
  SDFFRQX1M \R0_reg[1]  ( .D(ptr[1]), .SI(R0[0]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(R0[1]) );
endmodule


module FIFO_DFF_ptr_width4_test_1 ( ptr, CLK, RST, sync_ptr, test_si, test_se
 );
  input [3:0] ptr;
  output [3:0] sync_ptr;
  input CLK, RST, test_si, test_se;

  wire   [3:0] R0;

  SDFFRQX2M \R1_reg[1]  ( .D(R0[1]), .SI(sync_ptr[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sync_ptr[1]) );
  SDFFRQX2M \R1_reg[0]  ( .D(R0[0]), .SI(R0[3]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(sync_ptr[0]) );
  SDFFRQX2M \R1_reg[3]  ( .D(R0[3]), .SI(sync_ptr[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sync_ptr[3]) );
  SDFFRQX2M \R1_reg[2]  ( .D(R0[2]), .SI(sync_ptr[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sync_ptr[2]) );
  SDFFRQX2M \R0_reg[3]  ( .D(ptr[3]), .SI(R0[2]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(R0[3]) );
  SDFFRQX2M \R0_reg[2]  ( .D(ptr[2]), .SI(R0[1]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(R0[2]) );
  SDFFRQX2M \R0_reg[1]  ( .D(ptr[1]), .SI(R0[0]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(R0[1]) );
  SDFFRQX2M \R0_reg[0]  ( .D(ptr[0]), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(R0[0]) );
endmodule


module FIFO_TOP_ADDR_WIDTH3_BUFFER_DEPTH8_BUFFER_WIDTH8_test_1 ( w_CLK, r_CLK, 
        w_RST, r_RST, w_data, w_inc, r_inc, w_full, r_empty, r_data, test_si2, 
        test_si1, test_so2, test_so1, test_se );
  input [7:0] w_data;
  output [7:0] r_data;
  input w_CLK, r_CLK, w_RST, r_RST, w_inc, r_inc, test_si2, test_si1, test_se;
  output w_full, r_empty, test_so2, test_so1;
  wire   w_clk_en, n1, n2, n3;
  wire   [2:0] w_addr;
  wire   [2:0] r_addr;
  wire   [3:0] w_ptr_grey_sync;
  wire   [3:0] r_ptr_grey;
  wire   [3:0] r_ptr_grey_sync;
  wire   [3:0] w_ptr_grey;
  assign test_so2 = r_ptr_grey_sync[3];

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(w_RST), .Y(n2) );
  FIFO_BUFFER_ADDR_WIDTH3_BUFFER_DEPTH8_BUFFER_WIDTH8_test_1 U0_buffer ( 
        .w_clk_en(w_clk_en), .w_clk(w_CLK), .w_rst(n1), .w_address(w_addr), 
        .r_address(r_addr), .w_data(w_data), .r_data(r_data), .test_si2(
        test_si2), .test_si1(test_si1), .test_so2(n3), .test_so1(test_so1), 
        .test_se(test_se) );
  FIFO_RD_ADDR_WIDTH3_test_1 U0_read ( .r_CLK(r_CLK), .r_RST(r_RST), .r_inc(
        r_inc), .w_ptr(w_ptr_grey_sync), .r_empty(r_empty), .r_ptr_grey(
        r_ptr_grey), .r_addr(r_addr), .test_si(n3), .test_se(test_se) );
  FIFO_WR_ADDR_WIDTH3_test_1 U0_write ( .w_CLK(w_CLK), .w_RST(n1), .w_inc(
        w_inc), .r_ptr(r_ptr_grey_sync), .w_full(w_full), .w_ptr_grey(
        w_ptr_grey), .w_addr(w_addr), .w_clk_en(w_clk_en), .test_si(
        w_ptr_grey_sync[3]), .test_se(test_se) );
  FIFO_DFF_ptr_width4_test_0 U0_w2r ( .ptr(w_ptr_grey), .CLK(r_CLK), .RST(
        r_RST), .sync_ptr(w_ptr_grey_sync), .test_si(r_ptr_grey[3]), .test_se(
        test_se) );
  FIFO_DFF_ptr_width4_test_1 U1_r2w ( .ptr(r_ptr_grey), .CLK(w_CLK), .RST(n1), 
        .sync_ptr(r_ptr_grey_sync), .test_si(w_ptr_grey[3]), .test_se(test_se)
         );
endmodule


module PULSE_GEN_test_1 ( clk, rst, lvl_sig, pulse_sig, test_si, test_so, 
        test_se );
  input clk, rst, lvl_sig, test_si, test_se;
  output pulse_sig, test_so;
  wire   pls_flop, rcv_flop;
  assign test_so = rcv_flop;

  SDFFRQX1M rcv_flop_reg ( .D(lvl_sig), .SI(pls_flop), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(rcv_flop) );
  SDFFRQX1M pls_flop_reg ( .D(rcv_flop), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(pls_flop) );
  NOR2BX2M U7 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
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
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module clk_div_test_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n2, n3, n4, n5, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  assign test_so = odd_edge_tog;

  SDFFRQX2M div_clk_reg ( .D(n27), .SI(count[6]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(div_clk) );
  SDFFRQX2M \count_reg[6]  ( .D(n28), .SI(count[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[6]) );
  SDFFRQX2M \count_reg[0]  ( .D(n34), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[0]) );
  SDFFRQX2M \count_reg[5]  ( .D(n29), .SI(count[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[5]) );
  SDFFRQX2M \count_reg[4]  ( .D(n30), .SI(count[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[4]) );
  SDFFRQX2M \count_reg[3]  ( .D(n31), .SI(count[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[3]) );
  SDFFRQX2M \count_reg[2]  ( .D(n32), .SI(count[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[2]) );
  SDFFRQX2M \count_reg[1]  ( .D(n33), .SI(count[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[1]) );
  SDFFSQX1M odd_edge_tog_reg ( .D(n26), .SI(div_clk), .SE(test_se), .CK(
        i_ref_clk), .SN(i_rst_n), .Q(odd_edge_tog) );
  OR2X2M U6 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n2) );
  NAND2BX2M U11 ( .AN(n51), .B(i_clk_en), .Y(n17) );
  INVX2M U15 ( .A(i_div_ratio[5]), .Y(n16) );
  MX2X2M U16 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  CLKINVX1M U17 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U18 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n2), .Y(
        edge_flip_half[1]) );
  OR2X1M U19 ( .A(n2), .B(i_div_ratio[3]), .Y(n3) );
  OAI2BB1X1M U20 ( .A0N(n2), .A1N(i_div_ratio[3]), .B0(n3), .Y(
        edge_flip_half[2]) );
  NOR2X1M U21 ( .A(n3), .B(i_div_ratio[4]), .Y(n4) );
  AO21XLM U22 ( .A0(n3), .A1(i_div_ratio[4]), .B0(n4), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U23 ( .A(n4), .B(n16), .Y(n5) );
  OAI21X1M U24 ( .A0(n4), .A1(n16), .B0(n5), .Y(edge_flip_half[4]) );
  XNOR2X1M U25 ( .A(i_div_ratio[6]), .B(n5), .Y(edge_flip_half[5]) );
  NOR2X1M U26 ( .A(i_div_ratio[6]), .B(n5), .Y(n15) );
  CLKXOR2X2M U27 ( .A(i_div_ratio[7]), .B(n15), .Y(edge_flip_half[6]) );
  AO22X1M U28 ( .A0(n17), .A1(count[0]), .B0(N16), .B1(n18), .Y(n34) );
  AO22X1M U29 ( .A0(n17), .A1(count[1]), .B0(N17), .B1(n18), .Y(n33) );
  AO22X1M U30 ( .A0(n17), .A1(count[2]), .B0(N18), .B1(n18), .Y(n32) );
  AO22X1M U31 ( .A0(n17), .A1(count[3]), .B0(N19), .B1(n18), .Y(n31) );
  AO22X1M U32 ( .A0(n17), .A1(count[4]), .B0(N20), .B1(n18), .Y(n30) );
  AO22X1M U33 ( .A0(n17), .A1(count[5]), .B0(N21), .B1(n18), .Y(n29) );
  AO22X1M U34 ( .A0(n17), .A1(count[6]), .B0(N22), .B1(n18), .Y(n28) );
  AND3X1M U35 ( .A(n19), .B(n20), .C(N2), .Y(n18) );
  CLKXOR2X2M U36 ( .A(div_clk), .B(n21), .Y(n27) );
  AOI21X1M U37 ( .A0(n20), .A1(n19), .B0(n17), .Y(n21) );
  OR2X1M U38 ( .A(n22), .B(i_div_ratio[0]), .Y(n19) );
  XNOR2X1M U39 ( .A(odd_edge_tog), .B(n23), .Y(n26) );
  OR2X1M U40 ( .A(n20), .B(n17), .Y(n23) );
  CLKNAND2X2M U41 ( .A(n24), .B(i_div_ratio[0]), .Y(n20) );
  MXI2X1M U42 ( .A(n25), .B(n22), .S0(odd_edge_tog), .Y(n24) );
  NAND4X1M U43 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n22) );
  NOR4X1M U44 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n38) );
  CLKXOR2X2M U45 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n42) );
  CLKXOR2X2M U46 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n41) );
  CLKXOR2X2M U47 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n40) );
  CLKXOR2X2M U48 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n39) );
  XNOR2X1M U49 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n37) );
  XNOR2X1M U50 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n36) );
  XNOR2X1M U51 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n35) );
  NAND4X1M U52 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n25) );
  NOR4X1M U53 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n46) );
  CLKXOR2X2M U54 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n50) );
  CLKXOR2X2M U55 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n49) );
  CLKXOR2X2M U56 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n48) );
  CLKXOR2X2M U57 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n47) );
  XNOR2X1M U58 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n45) );
  XNOR2X1M U59 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n44) );
  XNOR2X1M U60 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n43) );
  CLKINVX1M U61 ( .A(n17), .Y(N2) );
  NOR4BX1M U62 ( .AN(n52), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n51) );
  NOR4X1M U63 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n52) );
  clk_div_0_DW01_inc_0 add_46 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  NAND4BX1M U11 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX1M U12 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NOR3X2M U13 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR3X2M U14 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  INVX2M U15 ( .A(IN[2]), .Y(n15) );
  INVX2M U16 ( .A(IN[5]), .Y(n14) );
  NOR4X1M U17 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U18 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  INVX2M U19 ( .A(IN[0]), .Y(n17) );
  INVX2M U20 ( .A(IN[1]), .Y(n16) );
  OAI211X2M U21 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NAND2X2M U22 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U23 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
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
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module clk_div_test_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n2, n3,
         n4, n5, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  assign test_so = odd_edge_tog;

  SDFFRQX2M div_clk_reg ( .D(n60), .SI(count[6]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(div_clk) );
  SDFFRQX2M \count_reg[6]  ( .D(n59), .SI(count[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[6]) );
  SDFFRQX2M \count_reg[0]  ( .D(n53), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[0]) );
  SDFFRQX2M \count_reg[5]  ( .D(n58), .SI(count[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[5]) );
  SDFFRQX2M \count_reg[4]  ( .D(n57), .SI(count[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[4]) );
  SDFFRQX2M \count_reg[3]  ( .D(n56), .SI(count[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[3]) );
  SDFFRQX2M \count_reg[2]  ( .D(n55), .SI(count[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[2]) );
  SDFFRQX2M \count_reg[1]  ( .D(n54), .SI(count[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[1]) );
  SDFFSQX1M odd_edge_tog_reg ( .D(n61), .SI(div_clk), .SE(test_se), .CK(
        i_ref_clk), .SN(i_rst_n), .Q(odd_edge_tog) );
  OR2X2M U6 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n2) );
  NAND2BX2M U11 ( .AN(n51), .B(i_clk_en), .Y(n17) );
  INVX2M U15 ( .A(i_div_ratio[5]), .Y(n16) );
  MX2X2M U16 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  CLKINVX1M U17 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U18 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n2), .Y(
        edge_flip_half[1]) );
  OR2X1M U19 ( .A(n2), .B(i_div_ratio[3]), .Y(n3) );
  OAI2BB1X1M U20 ( .A0N(n2), .A1N(i_div_ratio[3]), .B0(n3), .Y(
        edge_flip_half[2]) );
  NOR2X1M U21 ( .A(n3), .B(i_div_ratio[4]), .Y(n4) );
  AO21XLM U22 ( .A0(n3), .A1(i_div_ratio[4]), .B0(n4), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U23 ( .A(n4), .B(n16), .Y(n5) );
  OAI21X1M U24 ( .A0(n4), .A1(n16), .B0(n5), .Y(edge_flip_half[4]) );
  XNOR2X1M U25 ( .A(i_div_ratio[6]), .B(n5), .Y(edge_flip_half[5]) );
  NOR2X1M U26 ( .A(i_div_ratio[6]), .B(n5), .Y(n15) );
  CLKXOR2X2M U27 ( .A(i_div_ratio[7]), .B(n15), .Y(edge_flip_half[6]) );
  AO22X1M U28 ( .A0(n17), .A1(count[0]), .B0(N16), .B1(n18), .Y(n53) );
  AO22X1M U29 ( .A0(n17), .A1(count[1]), .B0(N17), .B1(n18), .Y(n54) );
  AO22X1M U30 ( .A0(n17), .A1(count[2]), .B0(N18), .B1(n18), .Y(n55) );
  AO22X1M U31 ( .A0(n17), .A1(count[3]), .B0(N19), .B1(n18), .Y(n56) );
  AO22X1M U32 ( .A0(n17), .A1(count[4]), .B0(N20), .B1(n18), .Y(n57) );
  AO22X1M U33 ( .A0(n17), .A1(count[5]), .B0(N21), .B1(n18), .Y(n58) );
  AO22X1M U34 ( .A0(n17), .A1(count[6]), .B0(N22), .B1(n18), .Y(n59) );
  AND3X1M U35 ( .A(n19), .B(n20), .C(N2), .Y(n18) );
  CLKXOR2X2M U36 ( .A(div_clk), .B(n21), .Y(n60) );
  AOI21X1M U37 ( .A0(n20), .A1(n19), .B0(n17), .Y(n21) );
  OR2X1M U38 ( .A(n22), .B(i_div_ratio[0]), .Y(n19) );
  XNOR2X1M U39 ( .A(odd_edge_tog), .B(n23), .Y(n61) );
  OR2X1M U40 ( .A(n20), .B(n17), .Y(n23) );
  CLKNAND2X2M U41 ( .A(n24), .B(i_div_ratio[0]), .Y(n20) );
  MXI2X1M U42 ( .A(n25), .B(n22), .S0(odd_edge_tog), .Y(n24) );
  NAND4X1M U43 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n22) );
  NOR4X1M U44 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n38) );
  CLKXOR2X2M U45 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n42) );
  CLKXOR2X2M U46 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n41) );
  CLKXOR2X2M U47 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n40) );
  CLKXOR2X2M U48 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n39) );
  XNOR2X1M U49 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n37) );
  XNOR2X1M U50 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n36) );
  XNOR2X1M U51 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n35) );
  NAND4X1M U52 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n25) );
  NOR4X1M U53 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n46) );
  CLKXOR2X2M U54 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n50) );
  CLKXOR2X2M U55 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n49) );
  CLKXOR2X2M U56 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n48) );
  CLKXOR2X2M U57 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n47) );
  XNOR2X1M U58 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n45) );
  XNOR2X1M U59 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n44) );
  XNOR2X1M U60 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n43) );
  CLKINVX1M U61 ( .A(n17), .Y(N2) );
  NOR4BX1M U62 ( .AN(n52), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n51) );
  NOR4X1M U63 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n52) );
  clk_div_1_DW01_inc_0 add_46 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
endmodule


module UART_TX_DATA_WIDTH8_test_1 ( P_DATA, DATA_VALID, PAR_EN, PAR_TYP, CLK, 
        RST, TX_OUT, BUSY, test_si2, test_si1, test_so1, test_se );
  input [7:0] P_DATA;
  input DATA_VALID, PAR_EN, PAR_TYP, CLK, RST, test_si2, test_si1, test_se;
  output TX_OUT, BUSY, test_so1;
  wire   N31, N33, PARITY_BIT, BUSY_comb, N38, TX_OUT_comb, \SR[0] , N109,
         N110, N111, N112, N113, N114, N115, N116, n25, n26, n27, n28, n29,
         n30, n31, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n33, n34, n35, n36, n37, n38, n39, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n76, n77;
  wire   [2:0] current_state;
  wire   [2:0] counter;
  wire   [2:0] next_state;
  assign test_so1 = n39;

  SDFFRX1M \SR_reg[6]  ( .D(N115), .SI(n68), .SE(n77), .CK(CLK), .RN(RST), .Q(
        n67), .QN(n26) );
  SDFFRX1M \SR_reg[5]  ( .D(N114), .SI(n69), .SE(n77), .CK(CLK), .RN(RST), .Q(
        n68), .QN(n27) );
  SDFFRX1M \SR_reg[4]  ( .D(N113), .SI(n70), .SE(n77), .CK(CLK), .RN(RST), .Q(
        n69), .QN(n28) );
  SDFFRX1M \SR_reg[3]  ( .D(N112), .SI(n71), .SE(n77), .CK(CLK), .RN(RST), .Q(
        n70), .QN(n29) );
  SDFFRX1M \SR_reg[2]  ( .D(N111), .SI(n72), .SE(n77), .CK(CLK), .RN(RST), .Q(
        n71), .QN(n30) );
  SDFFRX1M \SR_reg[1]  ( .D(N110), .SI(n58), .SE(n77), .CK(CLK), .RN(RST), .Q(
        n72), .QN(n31) );
  SDFFRX1M \SR_reg[7]  ( .D(N116), .SI(n67), .SE(n77), .CK(CLK), .RN(RST), .Q(
        n66), .QN(n25) );
  SDFFQX2M \counter_reg[1]  ( .D(n34), .SI(counter[0]), .SE(n77), .CK(CLK), 
        .Q(counter[1]) );
  SDFFQX2M \counter_reg[0]  ( .D(N31), .SI(n66), .SE(n77), .CK(CLK), .Q(
        counter[0]) );
  SDFFQX1M \counter_reg[2]  ( .D(N33), .SI(counter[1]), .SE(n77), .CK(CLK), 
        .Q(counter[2]) );
  SDFFRQX1M BUSY_reg ( .D(BUSY_comb), .SI(test_si1), .SE(n77), .CK(CLK), .RN(
        RST), .Q(BUSY) );
  SDFFRQX1M \current_state_reg[1]  ( .D(next_state[1]), .SI(n35), .SE(n77), 
        .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX1M \current_state_reg[2]  ( .D(next_state[2]), .SI(n38), .SE(n77), 
        .CK(CLK), .RN(RST), .Q(current_state[2]) );
  SDFFRQX1M \current_state_reg[0]  ( .D(next_state[0]), .SI(counter[2]), .SE(
        n77), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  SDFFRQX1M \SR_reg[0]  ( .D(N109), .SI(PARITY_BIT), .SE(n77), .CK(CLK), .RN(
        RST), .Q(\SR[0] ) );
  SDFFRQX1M PARITY_BIT_reg ( .D(N38), .SI(BUSY), .SE(n77), .CK(CLK), .RN(RST), 
        .Q(PARITY_BIT) );
  NAND2X2M U28 ( .A(n41), .B(n44), .Y(n56) );
  CLKXOR2X2M U29 ( .A(n63), .B(P_DATA[3]), .Y(n52) );
  CLKXOR2X2M U30 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n51) );
  INVX2M U31 ( .A(n41), .Y(n33) );
  INVX2M U32 ( .A(n54), .Y(n37) );
  OAI222X1M U33 ( .A0(n41), .A1(n31), .B0(n56), .B1(n58), .C0(n65), .C1(n44), 
        .Y(N109) );
  INVX2M U34 ( .A(\SR[0] ), .Y(n58) );
  INVX2M U35 ( .A(P_DATA[0]), .Y(n65) );
  OAI222X1M U36 ( .A0(n41), .A1(n30), .B0(n56), .B1(n31), .C0(n64), .C1(n44), 
        .Y(N110) );
  INVX2M U37 ( .A(P_DATA[1]), .Y(n64) );
  OAI222X1M U38 ( .A0(n41), .A1(n29), .B0(n56), .B1(n30), .C0(n63), .C1(n44), 
        .Y(N111) );
  OAI222X1M U39 ( .A0(n41), .A1(n28), .B0(n56), .B1(n29), .C0(n62), .C1(n44), 
        .Y(N112) );
  INVX2M U40 ( .A(P_DATA[3]), .Y(n62) );
  OAI222X1M U41 ( .A0(n41), .A1(n27), .B0(n56), .B1(n28), .C0(n61), .C1(n44), 
        .Y(N113) );
  INVX2M U42 ( .A(P_DATA[4]), .Y(n61) );
  OAI222X1M U43 ( .A0(n41), .A1(n26), .B0(n56), .B1(n27), .C0(n60), .C1(n44), 
        .Y(N114) );
  INVX2M U44 ( .A(P_DATA[5]), .Y(n60) );
  OAI222X1M U45 ( .A0(n41), .A1(n25), .B0(n56), .B1(n26), .C0(n59), .C1(n44), 
        .Y(N115) );
  INVX2M U46 ( .A(P_DATA[6]), .Y(n59) );
  AOI211X2M U47 ( .A0(n43), .A1(n44), .B0(current_state[2]), .C0(
        current_state[0]), .Y(next_state[0]) );
  NAND2X2M U48 ( .A(n42), .B(current_state[1]), .Y(n43) );
  NAND2BX2M U49 ( .AN(BUSY_comb), .B(DATA_VALID), .Y(n44) );
  OAI2B2X1M U50 ( .A1N(P_DATA[7]), .A0(n44), .B0(n56), .B1(n25), .Y(N116) );
  OAI2BB2X1M U51 ( .B0(n48), .B1(n44), .A0N(n44), .A1N(PARITY_BIT), .Y(N38) );
  CLKXOR2X2M U52 ( .A(n49), .B(n50), .Y(n48) );
  XOR3XLM U53 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n51), .Y(n50) );
  XOR3XLM U54 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n52), .Y(n49) );
  INVX2M U55 ( .A(P_DATA[2]), .Y(n63) );
  NOR3BX2M U56 ( .AN(PAR_EN), .B(n37), .C(counter[2]), .Y(n42) );
  OAI32X1M U57 ( .A0(n35), .A1(current_state[2]), .A2(current_state[1]), .B0(
        n40), .B1(n41), .Y(next_state[1]) );
  NOR3X2M U58 ( .A(n42), .B(counter[2]), .C(n37), .Y(n40) );
  NAND3X2M U59 ( .A(n35), .B(n39), .C(current_state[1]), .Y(n41) );
  AOI211X2M U60 ( .A0(n35), .A1(n36), .B0(n38), .C0(current_state[2]), .Y(
        next_state[2]) );
  INVX2M U61 ( .A(n40), .Y(n36) );
  NOR2X2M U62 ( .A(counter[1]), .B(counter[0]), .Y(n54) );
  INVX2M U63 ( .A(current_state[0]), .Y(n35) );
  INVX2M U64 ( .A(current_state[1]), .Y(n38) );
  INVX2M U65 ( .A(n55), .Y(n34) );
  AOI211X2M U66 ( .A0(counter[0]), .A1(counter[1]), .B0(n54), .C0(n41), .Y(n55) );
  INVX2M U67 ( .A(current_state[2]), .Y(n39) );
  NAND3X2M U68 ( .A(n45), .B(n39), .C(n46), .Y(TX_OUT_comb) );
  NAND3X2M U69 ( .A(current_state[1]), .B(n47), .C(current_state[0]), .Y(n45)
         );
  OAI21X2M U70 ( .A0(\SR[0] ), .A1(n38), .B0(n35), .Y(n46) );
  CLKXOR2X2M U71 ( .A(PAR_TYP), .B(PARITY_BIT), .Y(n47) );
  NAND2X2M U72 ( .A(counter[0]), .B(n33), .Y(N31) );
  CLKXOR2X2M U73 ( .A(n57), .B(current_state[2]), .Y(BUSY_comb) );
  NAND2X2M U74 ( .A(n38), .B(n35), .Y(n57) );
  NAND2X2M U75 ( .A(n53), .B(n33), .Y(N33) );
  CLKXOR2X2M U76 ( .A(n37), .B(counter[2]), .Y(n53) );
  INVXLM U77 ( .A(test_se), .Y(n76) );
  INVXLM U78 ( .A(n76), .Y(n77) );
  SDFFRQX2M TX_OUT_reg ( .D(TX_OUT_comb), .SI(test_si2), .SE(n77), .CK(CLK), 
        .RN(RST), .Q(TX_OUT) );
endmodule


module UART_RX_FSM_test_1 ( CLK, RST, RX_IN, PARITY_EN, par_err, strt_err, 
        bit_done, bit_over, stop_err, data_done, edge_cnt, bit_cnt, par_chk_en, 
        strt_chk_en, stop_chk_en, deser_en, DATA_VALID, cnt_en, sampler_en, 
        test_si, test_so, test_se );
  input [4:0] edge_cnt;
  input [3:0] bit_cnt;
  input CLK, RST, RX_IN, PARITY_EN, par_err, strt_err, bit_done, bit_over,
         stop_err, data_done, test_si, test_se;
  output par_chk_en, strt_chk_en, stop_chk_en, deser_en, DATA_VALID, cnt_en,
         sampler_en, test_so;
  wire   DATA_VALID_delay, n12, n13, n14, n15, n16, n17, n18, n19, n9, n10,
         n11, n20, n21, n22;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = current_state[2];

  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n21), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(n22), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[2]) );
  SDFFQX2M DATA_VALID_delay_reg ( .D(deser_en), .SI(test_si), .SE(test_se), 
        .CK(CLK), .Q(DATA_VALID_delay) );
  SDFFRQX1M DATA_VALID_reg ( .D(DATA_VALID_delay), .SI(DATA_VALID_delay), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(DATA_VALID) );
  SDFFRQX1M \current_state_reg[0]  ( .D(next_state[0]), .SI(DATA_VALID), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  OAI22X1M U10 ( .A0(current_state[2]), .A1(n21), .B0(current_state[0]), .B1(
        n22), .Y(cnt_en) );
  NOR3BX2M U11 ( .AN(stop_chk_en), .B(stop_err), .C(n11), .Y(deser_en) );
  INVX2M U12 ( .A(bit_done), .Y(n11) );
  AND2X2M U13 ( .A(n12), .B(n21), .Y(par_chk_en) );
  OAI32X1M U14 ( .A0(n13), .A1(current_state[0]), .A2(bit_done), .B0(n14), 
        .B1(n11), .Y(next_state[2]) );
  AOI32X1M U15 ( .A0(bit_cnt[3]), .A1(n12), .A2(n15), .B0(par_chk_en), .B1(n9), 
        .Y(n14) );
  NOR2X2M U16 ( .A(PARITY_EN), .B(n21), .Y(n15) );
  INVX2M U17 ( .A(par_err), .Y(n9) );
  OAI32X1M U18 ( .A0(n22), .A1(current_state[0]), .A2(bit_done), .B0(
        current_state[2]), .B1(n16), .Y(next_state[1]) );
  AOI31X2M U19 ( .A0(current_state[0]), .A1(n10), .A2(bit_done), .B0(n17), .Y(
        n16) );
  AOI21X2M U20 ( .A0(par_err), .A1(n21), .B0(n22), .Y(n17) );
  NOR2BX2M U21 ( .AN(n18), .B(current_state[2]), .Y(next_state[0]) );
  OAI32X1M U22 ( .A0(RX_IN), .A1(current_state[1]), .A2(current_state[0]), 
        .B0(n19), .B1(n21), .Y(n18) );
  AOI221XLM U23 ( .A0(current_state[1]), .A1(n20), .B0(n22), .B1(n10), .C0(n11), .Y(n19) );
  INVX2M U24 ( .A(bit_cnt[3]), .Y(n20) );
  INVX2M U25 ( .A(strt_err), .Y(n10) );
  NOR3X2M U26 ( .A(n21), .B(current_state[2]), .C(n12), .Y(strt_chk_en) );
  NOR2X2M U27 ( .A(n22), .B(current_state[2]), .Y(n12) );
  INVX2M U28 ( .A(current_state[0]), .Y(n21) );
  NAND2X2M U29 ( .A(current_state[2]), .B(current_state[1]), .Y(n13) );
  NOR2X2M U30 ( .A(n13), .B(current_state[0]), .Y(stop_chk_en) );
  INVX2M U31 ( .A(current_state[1]), .Y(n22) );
  BUFX2M U32 ( .A(cnt_en), .Y(sampler_en) );
endmodule


module PARITY_CHECKER_test_1 ( CLK, RST, bit_cnt, par_chk_en, sampled_bit, 
        PARITY_TYPE, odd_parity, even_parity, bit_done, par_err, PAR_err, 
        test_si, test_se );
  input [3:0] bit_cnt;
  input CLK, RST, par_chk_en, sampled_bit, PARITY_TYPE, odd_parity,
         even_parity, bit_done, test_si, test_se;
  output par_err, PAR_err;
  wire   n2, n3, n4;

  SDFFRQX2M PAR_err_reg ( .D(par_err), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(PAR_err) );
  AND3X2M U5 ( .A(bit_done), .B(n2), .C(par_chk_en), .Y(par_err) );
  OAI2B2X1M U6 ( .A1N(PARITY_TYPE), .A0(n3), .B0(PARITY_TYPE), .B1(n4), .Y(n2)
         );
  XNOR2X2M U7 ( .A(sampled_bit), .B(odd_parity), .Y(n3) );
  XNOR2X2M U8 ( .A(sampled_bit), .B(even_parity), .Y(n4) );
endmodule


module START_CHECKER ( CLK, RST, strt_chk_en, sampled_bit, bit_done, strt_err
 );
  input CLK, RST, strt_chk_en, sampled_bit, bit_done;
  output strt_err;


  AND3X2M U1 ( .A(sampled_bit), .B(bit_done), .C(strt_chk_en), .Y(strt_err) );
endmodule


module STOP_CHECKER_test_1 ( CLK, RST, stop_chk_en, sampled_bit, bit_done, 
        stop_err, STOP_err, test_si, test_se );
  input CLK, RST, stop_chk_en, sampled_bit, bit_done, test_si, test_se;
  output stop_err, STOP_err;
  wire   n2;

  SDFFRQX2M STOP_err_reg ( .D(stop_err), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(STOP_err) );
  INVX2M U5 ( .A(n2), .Y(stop_err) );
  NAND3BX2M U6 ( .AN(sampled_bit), .B(bit_done), .C(stop_chk_en), .Y(n2) );
endmodule


module DATA_SAMPLER_test_1 ( CLK, RST, edge_cnt, sampler_en, RX_IN, PRESCALE, 
        sampled_bit, test_si, test_so, test_se );
  input [4:0] edge_cnt;
  input [5:0] PRESCALE;
  input CLK, RST, sampler_en, RX_IN, test_si, test_se;
  output sampled_bit, test_so;
  wire   sampled_bit_c, n9, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n89, n90, n91, n92, n93, n94, n95, n96;
  wire   [6:0] samples;

  SDFFRX1M \samples_reg[6]  ( .D(n82), .SI(samples[5]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(test_so), .QN(n9) );
  SDFFRQX1M sampled_bit_reg ( .D(sampled_bit_c), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(sampled_bit) );
  SDFFRQX1M \samples_reg[5]  ( .D(n83), .SI(samples[4]), .SE(test_se), .CK(CLK), .RN(RST), .Q(samples[5]) );
  SDFFRQX1M \samples_reg[1]  ( .D(n87), .SI(n27), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(samples[1]) );
  SDFFRQX1M \samples_reg[0]  ( .D(n88), .SI(sampled_bit), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(samples[0]) );
  SDFFRQX1M \samples_reg[3]  ( .D(n85), .SI(samples[2]), .SE(test_se), .CK(CLK), .RN(RST), .Q(samples[3]) );
  SDFFRQX1M \samples_reg[4]  ( .D(n84), .SI(samples[3]), .SE(test_se), .CK(CLK), .RN(RST), .Q(samples[4]) );
  SDFFRQX1M \samples_reg[2]  ( .D(n86), .SI(samples[1]), .SE(test_se), .CK(CLK), .RN(RST), .Q(samples[2]) );
  NOR2X2M U19 ( .A(PRESCALE[1]), .B(PRESCALE[0]), .Y(n37) );
  INVX2M U20 ( .A(n58), .Y(n91) );
  NOR2X2M U21 ( .A(n96), .B(n92), .Y(n58) );
  INVX2M U22 ( .A(n49), .Y(n90) );
  NAND4BX1M U23 ( .AN(n72), .B(n94), .C(n35), .D(n92), .Y(n67) );
  OAI31X1M U24 ( .A0(n35), .A1(n68), .A2(n27), .B0(n67), .Y(n79) );
  NOR3X2M U25 ( .A(n20), .B(n53), .C(n54), .Y(n36) );
  NAND2X2M U26 ( .A(n72), .B(n37), .Y(n54) );
  NOR3X2M U27 ( .A(n62), .B(n96), .C(n94), .Y(n31) );
  OAI211X2M U28 ( .A0(n92), .A1(n62), .B0(n35), .C0(n67), .Y(n75) );
  NAND2X2M U29 ( .A(n37), .B(n67), .Y(n49) );
  NAND2X2M U30 ( .A(n58), .B(n23), .Y(n50) );
  INVX2M U31 ( .A(n37), .Y(n96) );
  INVX2M U32 ( .A(n68), .Y(n20) );
  INVX2M U33 ( .A(n45), .Y(n22) );
  INVX2M U34 ( .A(n80), .Y(n92) );
  INVX2M U35 ( .A(n71), .Y(n94) );
  AND2X2M U36 ( .A(n67), .B(n37), .Y(n44) );
  INVX2M U37 ( .A(n38), .Y(n26) );
  NOR4BX1M U38 ( .AN(PRESCALE[4]), .B(PRESCALE[2]), .C(PRESCALE[3]), .D(
        PRESCALE[5]), .Y(n72) );
  OAI32X1M U39 ( .A0(n34), .A1(n27), .A2(n35), .B0(n26), .B1(n19), .Y(n33) );
  NAND3X2M U40 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .C(n37), .Y(n34) );
  INVX2M U41 ( .A(n36), .Y(n19) );
  OAI32X1M U42 ( .A0(n28), .A1(n29), .A2(n91), .B0(n30), .B1(n89), .Y(
        sampled_bit_c) );
  INVX2M U43 ( .A(sampler_en), .Y(n89) );
  AOI21X2M U44 ( .A0(samples[5]), .A1(n38), .B0(n39), .Y(n29) );
  AOI21X2M U45 ( .A0(n31), .A1(n32), .B0(n33), .Y(n30) );
  NOR2BX2M U46 ( .AN(n44), .B(RX_IN), .Y(n43) );
  NOR4X1M U47 ( .A(n95), .B(PRESCALE[2]), .C(PRESCALE[4]), .D(PRESCALE[5]), 
        .Y(n71) );
  NAND4BX1M U48 ( .AN(PRESCALE[4]), .B(PRESCALE[2]), .C(n95), .D(n93), .Y(n35)
         );
  INVX2M U49 ( .A(edge_cnt[1]), .Y(n21) );
  NOR3X2M U50 ( .A(n18), .B(edge_cnt[2]), .C(n21), .Y(n46) );
  INVX2M U51 ( .A(edge_cnt[0]), .Y(n18) );
  OAI21X2M U52 ( .A0(n77), .A1(n91), .B0(sampler_en), .Y(n45) );
  AOI222X1M U53 ( .A0(edge_cnt[3]), .A1(edge_cnt[4]), .B0(n23), .B1(n25), .C0(
        edge_cnt[2]), .C1(n24), .Y(n77) );
  INVX2M U54 ( .A(edge_cnt[4]), .Y(n25) );
  NOR4X1M U55 ( .A(n93), .B(PRESCALE[2]), .C(PRESCALE[3]), .D(PRESCALE[4]), 
        .Y(n80) );
  NAND2X2M U56 ( .A(edge_cnt[3]), .B(n23), .Y(n53) );
  NOR2X2M U57 ( .A(n21), .B(edge_cnt[0]), .Y(n68) );
  NAND3X2M U58 ( .A(edge_cnt[0]), .B(n21), .C(edge_cnt[2]), .Y(n62) );
  OAI2B2X1M U59 ( .A1N(n42), .A0(n43), .B0(n9), .B1(n42), .Y(n82) );
  OAI22X1M U60 ( .A0(n44), .A1(n45), .B0(n91), .B1(n28), .Y(n42) );
  INVX2M U61 ( .A(edge_cnt[2]), .Y(n23) );
  NAND2X2M U62 ( .A(edge_cnt[2]), .B(n58), .Y(n63) );
  NAND4X2M U63 ( .A(n71), .B(edge_cnt[2]), .C(n18), .D(n21), .Y(n70) );
  NAND3X2M U64 ( .A(edge_cnt[0]), .B(n24), .C(edge_cnt[1]), .Y(n69) );
  NAND4X2M U65 ( .A(sampler_en), .B(edge_cnt[4]), .C(n46), .D(n24), .Y(n28) );
  INVX2M U66 ( .A(edge_cnt[3]), .Y(n24) );
  INVX2M U67 ( .A(PRESCALE[5]), .Y(n93) );
  INVX2M U68 ( .A(PRESCALE[3]), .Y(n95) );
  OAI2BB2X1M U69 ( .B0(n43), .B1(n47), .A0N(n47), .A1N(samples[5]), .Y(n83) );
  OAI21X2M U70 ( .A0(n48), .A1(n49), .B0(n22), .Y(n47) );
  NOR2X2M U71 ( .A(n20), .B(n50), .Y(n48) );
  OAI2BB2X1M U72 ( .B0(n73), .B1(n74), .A0N(n74), .A1N(samples[0]), .Y(n88) );
  NOR3BX2M U73 ( .AN(n78), .B(n79), .C(n96), .Y(n73) );
  OAI31X1M U74 ( .A0(n75), .A1(n96), .A2(n76), .B0(n22), .Y(n74) );
  OAI31X1M U75 ( .A0(n68), .A1(n80), .A2(n76), .B0(RX_IN), .Y(n78) );
  OAI2BB2X1M U76 ( .B0(n43), .B1(n64), .A0N(n64), .A1N(samples[1]), .Y(n87) );
  OAI31X1M U77 ( .A0(n65), .A1(n66), .A2(n49), .B0(n22), .Y(n64) );
  NOR2X2M U78 ( .A(n20), .B(n63), .Y(n66) );
  OAI31X1M U79 ( .A0(n69), .A1(n54), .A2(n23), .B0(n70), .Y(n65) );
  OAI2BB2X1M U80 ( .B0(n43), .B1(n59), .A0N(n59), .A1N(samples[2]), .Y(n86) );
  OAI31X1M U81 ( .A0(n60), .A1(n31), .A2(n61), .B0(n22), .Y(n59) );
  NOR4X1M U82 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .C(n53), .D(n54), .Y(n61) );
  OAI31X1M U83 ( .A0(n63), .A1(n18), .A2(n21), .B0(n90), .Y(n60) );
  OAI2BB2X1M U84 ( .B0(n43), .B1(n55), .A0N(n55), .A1N(samples[3]), .Y(n85) );
  OAI31X1M U85 ( .A0(n49), .A1(n56), .A2(n57), .B0(n22), .Y(n55) );
  NOR3X2M U86 ( .A(n50), .B(edge_cnt[1]), .C(edge_cnt[0]), .Y(n56) );
  NOR4X1M U87 ( .A(edge_cnt[1]), .B(n18), .C(n53), .D(n54), .Y(n57) );
  OAI2BB2X1M U88 ( .B0(n43), .B1(n51), .A0N(n51), .A1N(samples[4]), .Y(n84) );
  OAI31X1M U89 ( .A0(n49), .A1(n36), .A2(n52), .B0(n22), .Y(n51) );
  NOR3X2M U90 ( .A(n50), .B(edge_cnt[1]), .C(n18), .Y(n52) );
  OAI2BB1X2M U91 ( .A0N(n46), .A1N(n71), .B0(n81), .Y(n76) );
  NAND4X2M U92 ( .A(edge_cnt[2]), .B(n68), .C(n72), .D(n24), .Y(n81) );
  OAI2BB1X2M U93 ( .A0N(n32), .A1N(samples[3]), .B0(n40), .Y(n38) );
  OAI21X2M U94 ( .A0(samples[3]), .A1(n32), .B0(samples[4]), .Y(n40) );
  OAI2BB1X2M U95 ( .A0N(samples[0]), .A1N(samples[1]), .B0(n41), .Y(n32) );
  OAI21X2M U96 ( .A0(samples[0]), .A1(samples[1]), .B0(samples[2]), .Y(n41) );
  AOI2B1X1M U97 ( .A1N(samples[5]), .A0(n26), .B0(n9), .Y(n39) );
  INVX2M U98 ( .A(samples[0]), .Y(n27) );
endmodule


module DESERIALIZER_test_1 ( CLK, RST, sampled_bit, deser_en, bit_done, 
        PARITY_EN, bit_cnt, P_DATA, even_parity, odd_parity, test_si, test_so, 
        test_se );
  input [3:0] bit_cnt;
  output [7:0] P_DATA;
  input CLK, RST, sampled_bit, deser_en, bit_done, PARITY_EN, test_si, test_se;
  output even_parity, odd_parity, test_so;
  wire   n5, n6, n8, n9, n11, n14, n16, n18, n20, n22, n24, n26, n28, n29, n30,
         n32, n33, n34, n35, n36, n39, n42, n44, n46, n48, n50, n52, n54, n56,
         n58, n68, n69, n70, n71, n72, n73, n74, n75, n76, n38, n40, n41, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n87, n88, n89, n92, n93;
  wire   [10:2] all_frame;

  SDFFRX1M \all_frame_reg[10]  ( .D(n76), .SI(n78), .SE(n93), .CK(CLK), .RN(
        RST), .Q(test_so), .QN(n77) );
  SDFFRX1M \all_frame_reg[9]  ( .D(n75), .SI(n79), .SE(n93), .CK(CLK), .RN(RST), .Q(n42), .QN(n78) );
  SDFFRX1M \all_frame_reg[7]  ( .D(n73), .SI(n81), .SE(n93), .CK(CLK), .RN(RST), .Q(n87), .QN(n80) );
  SDFFRX1M \all_frame_reg[6]  ( .D(n72), .SI(n82), .SE(n93), .CK(CLK), .RN(RST), .Q(n39), .QN(n81) );
  SDFFRX1M \all_frame_reg[3]  ( .D(n69), .SI(n89), .SE(n93), .CK(CLK), .RN(RST), .Q(n88), .QN(n84) );
  SDFFRX1M \all_frame_reg[2]  ( .D(n68), .SI(P_DATA[7]), .SE(n93), .CK(CLK), 
        .RN(RST), .Q(n89), .QN(n85) );
  SDFFRQX1M \all_frame_reg[8]  ( .D(n74), .SI(n87), .SE(n93), .CK(CLK), .RN(
        RST), .Q(all_frame[8]) );
  SDFFRQX1M \all_frame_reg[5]  ( .D(n71), .SI(n83), .SE(n93), .CK(CLK), .RN(
        RST), .Q(all_frame[5]) );
  SDFFRQX1M \all_frame_reg[4]  ( .D(n70), .SI(n88), .SE(n93), .CK(CLK), .RN(
        RST), .Q(all_frame[4]) );
  SDFFRQX1M \P_DATA_reg[7]  ( .D(n58), .SI(P_DATA[6]), .SE(n93), .CK(CLK), 
        .RN(RST), .Q(P_DATA[7]) );
  SDFFRQX1M \P_DATA_reg[6]  ( .D(n56), .SI(P_DATA[5]), .SE(n93), .CK(CLK), 
        .RN(RST), .Q(P_DATA[6]) );
  SDFFRQX1M \P_DATA_reg[5]  ( .D(n54), .SI(P_DATA[4]), .SE(n93), .CK(CLK), 
        .RN(RST), .Q(P_DATA[5]) );
  SDFFRQX1M \P_DATA_reg[4]  ( .D(n52), .SI(P_DATA[3]), .SE(n93), .CK(CLK), 
        .RN(RST), .Q(P_DATA[4]) );
  SDFFRQX1M \P_DATA_reg[3]  ( .D(n50), .SI(P_DATA[2]), .SE(n93), .CK(CLK), 
        .RN(RST), .Q(P_DATA[3]) );
  SDFFRQX1M \P_DATA_reg[2]  ( .D(n48), .SI(P_DATA[1]), .SE(n93), .CK(CLK), 
        .RN(RST), .Q(P_DATA[2]) );
  SDFFRQX1M \P_DATA_reg[1]  ( .D(n46), .SI(P_DATA[0]), .SE(n93), .CK(CLK), 
        .RN(RST), .Q(P_DATA[1]) );
  SDFFRQX1M \P_DATA_reg[0]  ( .D(n44), .SI(test_si), .SE(n93), .CK(CLK), .RN(
        RST), .Q(P_DATA[0]) );
  INVX2M U20 ( .A(deser_en), .Y(n40) );
  OAI22X1M U21 ( .A0(n38), .A1(n83), .B0(n82), .B1(n28), .Y(n70) );
  OAI22X1M U22 ( .A0(n38), .A1(n82), .B0(n81), .B1(n28), .Y(n71) );
  OAI22X1M U23 ( .A0(n38), .A1(n79), .B0(n78), .B1(n28), .Y(n74) );
  OAI22X1M U24 ( .A0(n38), .A1(n85), .B0(n84), .B1(n28), .Y(n68) );
  OAI22X1M U25 ( .A0(n38), .A1(n84), .B0(n83), .B1(n28), .Y(n69) );
  OAI22X1M U26 ( .A0(n38), .A1(n81), .B0(n80), .B1(n28), .Y(n72) );
  OAI22X1M U27 ( .A0(n38), .A1(n80), .B0(n79), .B1(n28), .Y(n73) );
  OAI22X1M U28 ( .A0(n38), .A1(n78), .B0(n77), .B1(n28), .Y(n75) );
  NOR2BX2M U29 ( .AN(n5), .B(n6), .Y(even_parity) );
  INVX2M U30 ( .A(n28), .Y(n38) );
  NOR2X2M U31 ( .A(n5), .B(n6), .Y(odd_parity) );
  OAI221X1M U32 ( .A0(n83), .A1(n8), .B0(n84), .B1(n9), .C0(n14), .Y(n46) );
  NAND2X2M U33 ( .A(P_DATA[1]), .B(n40), .Y(n14) );
  OAI221X1M U34 ( .A0(n82), .A1(n8), .B0(n83), .B1(n9), .C0(n16), .Y(n48) );
  NAND2X2M U35 ( .A(P_DATA[2]), .B(n40), .Y(n16) );
  OAI221X1M U36 ( .A0(n81), .A1(n8), .B0(n82), .B1(n9), .C0(n18), .Y(n50) );
  NAND2X2M U37 ( .A(P_DATA[3]), .B(n40), .Y(n18) );
  OAI221X1M U38 ( .A0(n80), .A1(n8), .B0(n81), .B1(n9), .C0(n20), .Y(n52) );
  NAND2X2M U39 ( .A(P_DATA[4]), .B(n40), .Y(n20) );
  OAI221X1M U40 ( .A0(n79), .A1(n8), .B0(n80), .B1(n9), .C0(n22), .Y(n54) );
  NAND2X2M U41 ( .A(P_DATA[5]), .B(n40), .Y(n22) );
  OAI221X1M U42 ( .A0(n78), .A1(n8), .B0(n79), .B1(n9), .C0(n24), .Y(n56) );
  NAND2X2M U43 ( .A(P_DATA[6]), .B(n40), .Y(n24) );
  OAI221X1M U44 ( .A0(n77), .A1(n8), .B0(n78), .B1(n9), .C0(n26), .Y(n58) );
  NAND2X2M U45 ( .A(P_DATA[7]), .B(n40), .Y(n26) );
  OAI221X1M U46 ( .A0(n84), .A1(n8), .B0(n9), .B1(n85), .C0(n11), .Y(n44) );
  NAND2X2M U47 ( .A(P_DATA[0]), .B(n40), .Y(n11) );
  NAND2X2M U48 ( .A(bit_done), .B(n29), .Y(n28) );
  OAI21X2M U49 ( .A0(n30), .A1(bit_cnt[2]), .B0(bit_cnt[3]), .Y(n29) );
  AOI2B1X1M U50 ( .A1N(bit_cnt[0]), .A0(PARITY_EN), .B0(n41), .Y(n30) );
  INVX2M U51 ( .A(bit_cnt[1]), .Y(n41) );
  NAND2X2M U52 ( .A(PARITY_EN), .B(deser_en), .Y(n9) );
  NAND4X2M U53 ( .A(bit_done), .B(bit_cnt[3]), .C(n32), .D(bit_cnt[0]), .Y(n6)
         );
  NOR2X2M U71 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n32) );
  NAND2BX2M U72 ( .AN(PARITY_EN), .B(deser_en), .Y(n8) );
  OAI2BB2X1M U73 ( .B0(n38), .B1(n77), .A0N(sampled_bit), .A1N(n38), .Y(n76)
         );
  XNOR2X2M U74 ( .A(n33), .B(n34), .Y(n5) );
  XOR3XLM U75 ( .A(n82), .B(n83), .C(n36), .Y(n33) );
  XOR3XLM U76 ( .A(n80), .B(n77), .C(n35), .Y(n34) );
  XNOR2X2M U77 ( .A(all_frame[8]), .B(n42), .Y(n36) );
  XNOR2X2M U78 ( .A(n84), .B(n39), .Y(n35) );
  INVX2M U79 ( .A(all_frame[4]), .Y(n83) );
  INVX2M U80 ( .A(all_frame[5]), .Y(n82) );
  INVX2M U81 ( .A(all_frame[8]), .Y(n79) );
  INVXLM U82 ( .A(test_se), .Y(n92) );
  INVXLM U83 ( .A(n92), .Y(n93) );
endmodule


module EDGE_BIT_COUNTER_test_1 ( cnt_en, CLK, PRESCALE, deser_en, bit_cnt, 
        edge_cnt, bit_done, bit_over, data_done, test_si, test_so, test_se );
  input [5:0] PRESCALE;
  output [3:0] bit_cnt;
  output [4:0] edge_cnt;
  input cnt_en, CLK, deser_en, test_si, test_se;
  output bit_done, bit_over, data_done, test_so;
  wire   N10, N11, N12, N13, N58, N59, N60, N61, n11, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         \add_19/carry[4] , \add_19/carry[3] , \add_19/carry[2] , n13, n19,
         n20, n39, n40, n41, n42, n43, n44, n45, n46, n48, n49;

  SDFFQX2M \bit_cnt_reg[0]  ( .D(N58), .SI(test_si), .SE(test_se), .CK(CLK), 
        .Q(bit_cnt[0]) );
  SDFFQX2M \bit_cnt_reg[3]  ( .D(N61), .SI(n41), .SE(test_se), .CK(CLK), .Q(
        bit_cnt[3]) );
  SDFFQX2M \bit_cnt_reg[2]  ( .D(N60), .SI(n40), .SE(test_se), .CK(CLK), .Q(
        bit_cnt[2]) );
  SDFFQX2M \bit_cnt_reg[1]  ( .D(N59), .SI(n39), .SE(test_se), .CK(CLK), .Q(
        bit_cnt[1]) );
  SDFFTRX1M \edge_cnt_reg[3]  ( .RN(cnt_en), .D(N12), .SI(edge_cnt[2]), .SE(
        test_se), .CK(CLK), .Q(edge_cnt[3]), .QN(n48) );
  SDFFTRX1M \edge_cnt_reg[4]  ( .RN(cnt_en), .D(N13), .SI(n48), .SE(test_se), 
        .CK(CLK), .Q(edge_cnt[4]), .QN(test_so) );
  SDFFTRX1M \edge_cnt_reg[1]  ( .RN(cnt_en), .D(N10), .SI(n13), .SE(test_se), 
        .CK(CLK), .Q(edge_cnt[1]), .QN(n49) );
  SDFFTRX1M \edge_cnt_reg[0]  ( .RN(cnt_en), .D(n13), .SI(n42), .SE(test_se), 
        .CK(CLK), .Q(edge_cnt[0]), .QN(n13) );
  INVX2M U19 ( .A(n35), .Y(n20) );
  INVX2M U20 ( .A(n33), .Y(n19) );
  INVX2M U21 ( .A(cnt_en), .Y(n43) );
  AOI33X2M U22 ( .A0(edge_cnt[4]), .A1(PRESCALE[5]), .A2(n27), .B0(edge_cnt[1]), .B1(n44), .B2(PRESCALE[3]), .Y(n26) );
  INVX2M U23 ( .A(PRESCALE[5]), .Y(n44) );
  NOR3X2M U24 ( .A(PRESCALE[3]), .B(edge_cnt[3]), .C(edge_cnt[1]), .Y(n27) );
  OAI21X2M U25 ( .A0(PRESCALE[2]), .A1(n21), .B0(n22), .Y(bit_done) );
  AOI33X2M U26 ( .A0(edge_cnt[2]), .A1(n23), .A2(n24), .B0(edge_cnt[3]), .B1(
        PRESCALE[4]), .B2(n25), .Y(n21) );
  NOR3X2M U27 ( .A(n20), .B(edge_cnt[2]), .C(PRESCALE[3]), .Y(n25) );
  NOR3X2M U28 ( .A(n26), .B(edge_cnt[0]), .C(PRESCALE[4]), .Y(n24) );
  NAND3X2M U29 ( .A(edge_cnt[0]), .B(n23), .C(edge_cnt[1]), .Y(n38) );
  NOR2X2M U30 ( .A(n38), .B(PRESCALE[5]), .Y(n35) );
  OAI32X1M U31 ( .A0(n39), .A1(n19), .A2(n43), .B0(bit_cnt[0]), .B1(n33), .Y(
        N58) );
  INVX2M U32 ( .A(bit_cnt[0]), .Y(n39) );
  OAI22X1M U33 ( .A0(bit_cnt[0]), .A1(n33), .B0(n19), .B1(n43), .Y(n31) );
  NAND2X2M U34 ( .A(cnt_en), .B(bit_over), .Y(n33) );
  OAI31X1M U35 ( .A0(n11), .A1(PRESCALE[2]), .A2(n34), .B0(n22), .Y(bit_over)
         );
  AOI33X2M U36 ( .A0(n36), .A1(n46), .A2(edge_cnt[3]), .B0(n35), .B1(n45), 
        .B2(PRESCALE[3]), .Y(n34) );
  OAI32X1M U37 ( .A0(n37), .A1(PRESCALE[4]), .A2(n38), .B0(n20), .B1(n45), .Y(
        n36) );
  NAND4X2M U38 ( .A(PRESCALE[2]), .B(n35), .C(n46), .D(n45), .Y(n22) );
  NOR2X2M U39 ( .A(PRESCALE[1]), .B(PRESCALE[0]), .Y(n23) );
  INVX2M U40 ( .A(PRESCALE[4]), .Y(n45) );
  INVX2M U41 ( .A(PRESCALE[3]), .Y(n46) );
  OAI2BB2X1M U42 ( .B0(bit_cnt[1]), .B1(n28), .A0N(n31), .A1N(bit_cnt[1]), .Y(
        N59) );
  OAI32X1M U43 ( .A0(n28), .A1(bit_cnt[2]), .A2(n40), .B0(n32), .B1(n41), .Y(
        N60) );
  INVX2M U44 ( .A(bit_cnt[2]), .Y(n41) );
  AOI21X2M U45 ( .A0(n19), .A1(n40), .B0(n31), .Y(n32) );
  INVX2M U46 ( .A(bit_cnt[1]), .Y(n40) );
  OAI32X1M U47 ( .A0(n28), .A1(bit_cnt[3]), .A2(n29), .B0(n30), .B1(n42), .Y(
        N61) );
  INVX2M U48 ( .A(bit_cnt[3]), .Y(n42) );
  AOI21X2M U49 ( .A0(n19), .A1(n29), .B0(n31), .Y(n30) );
  NAND2X2M U50 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n29) );
  NAND2X2M U51 ( .A(bit_cnt[0]), .B(n19), .Y(n28) );
  NAND2X2M U52 ( .A(edge_cnt[4]), .B(PRESCALE[5]), .Y(n37) );
  ADDHX1M U53 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_19/carry[2] ), .S(
        N10) );
  ADDHX1M U54 ( .A(edge_cnt[2]), .B(\add_19/carry[2] ), .CO(\add_19/carry[3] ), 
        .S(N11) );
  ADDHX1M U55 ( .A(edge_cnt[3]), .B(\add_19/carry[3] ), .CO(\add_19/carry[4] ), 
        .S(N12) );
  CLKXOR2X2M U56 ( .A(\add_19/carry[4] ), .B(edge_cnt[4]), .Y(N13) );
  SDFFTRX1M \edge_cnt_reg[2]  ( .RN(cnt_en), .D(N11), .SI(n49), .SE(test_se), 
        .CK(CLK), .Q(edge_cnt[2]), .QN(n11) );
  INVX2M U3 ( .A(1'b1), .Y(data_done) );
endmodule


module UART_RX_test_1 ( CLK, RST, RX_IN, PARITY_EN, PARITY_TYPE, PRESCALE, 
        P_DATA, DATA_VALID, stop_err, par_err, test_si, test_se );
  input [5:0] PRESCALE;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, PARITY_EN, PARITY_TYPE, test_si, test_se;
  output DATA_VALID, stop_err, par_err;
  wire   PAR_err, strt_err, STOP_err, par_chk_en, strt_chk_en, stop_chk_en,
         bit_over, bit_done, deser_en, sampler_en, cnt_en, sampled_bit,
         even_parity, odd_parity, n1, n2, n3, n4, n5, n6;
  wire   [3:0] bit_cnt;
  wire   [4:0] edge_cnt;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  UART_RX_FSM_test_1 U0_rx_fsm ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), 
        .PARITY_EN(PARITY_EN), .par_err(PAR_err), .strt_err(strt_err), 
        .bit_done(bit_done), .bit_over(bit_over), .stop_err(STOP_err), 
        .data_done(1'b0), .edge_cnt(edge_cnt), .bit_cnt(bit_cnt), .par_chk_en(
        par_chk_en), .strt_chk_en(strt_chk_en), .stop_chk_en(stop_chk_en), 
        .deser_en(deser_en), .DATA_VALID(DATA_VALID), .cnt_en(cnt_en), 
        .sampler_en(sampler_en), .test_si(par_err), .test_so(n3), .test_se(
        test_se) );
  PARITY_CHECKER_test_1 U0_parity_checker ( .CLK(CLK), .RST(n1), .bit_cnt(
        bit_cnt), .par_chk_en(par_chk_en), .sampled_bit(sampled_bit), 
        .PARITY_TYPE(PARITY_TYPE), .odd_parity(odd_parity), .even_parity(
        even_parity), .bit_done(bit_done), .par_err(PAR_err), .PAR_err(par_err), .test_si(n4), .test_se(test_se) );
  START_CHECKER U0_start_checker ( .CLK(CLK), .RST(n1), .strt_chk_en(
        strt_chk_en), .sampled_bit(sampled_bit), .bit_done(bit_done), 
        .strt_err(strt_err) );
  STOP_CHECKER_test_1 U0_stop_checker ( .CLK(CLK), .RST(n1), .stop_chk_en(
        stop_chk_en), .sampled_bit(sampled_bit), .bit_done(bit_done), 
        .stop_err(STOP_err), .STOP_err(stop_err), .test_si(n3), .test_se(
        test_se) );
  DATA_SAMPLER_test_1 U0_data_sampler ( .CLK(CLK), .RST(n1), .edge_cnt(
        edge_cnt), .sampler_en(sampler_en), .RX_IN(RX_IN), .PRESCALE(PRESCALE), 
        .sampled_bit(sampled_bit), .test_si(test_si), .test_so(n6), .test_se(
        test_se) );
  DESERIALIZER_test_1 U0_deserializer ( .CLK(CLK), .RST(n1), .sampled_bit(
        sampled_bit), .deser_en(deser_en), .bit_done(bit_done), .PARITY_EN(
        PARITY_EN), .bit_cnt(bit_cnt), .P_DATA(P_DATA), .even_parity(
        even_parity), .odd_parity(odd_parity), .test_si(n6), .test_so(n5), 
        .test_se(test_se) );
  EDGE_BIT_COUNTER_test_1 U0_edge_bit_counter ( .cnt_en(cnt_en), .CLK(CLK), 
        .PRESCALE(PRESCALE), .deser_en(deser_en), .bit_cnt(bit_cnt), 
        .edge_cnt(edge_cnt), .bit_done(bit_done), .bit_over(bit_over), 
        .test_si(n5), .test_so(n4), .test_se(test_se) );
endmodule


module UART_test_1 ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error, test_si2, test_si1, test_so1, test_se );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type,
         test_si2, test_si1, test_se;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error, test_so1;
  wire   n1, n2;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  UART_TX_DATA_WIDTH8_test_1 U0_UART_TX ( .P_DATA(TX_IN_P), .DATA_VALID(
        TX_IN_V), .PAR_EN(parity_enable), .PAR_TYP(parity_type), .CLK(TX_CLK), 
        .RST(n1), .TX_OUT(TX_OUT_S), .BUSY(TX_OUT_V), .test_si2(test_si2), 
        .test_si1(framing_error), .test_so1(test_so1), .test_se(test_se) );
  UART_RX_test_1 U0_UART_RX ( .CLK(RX_CLK), .RST(n1), .RX_IN(RX_IN_S), 
        .PARITY_EN(parity_enable), .PARITY_TYPE(parity_type), .PRESCALE(
        Prescale), .P_DATA(RX_OUT_P), .DATA_VALID(RX_OUT_V), .stop_err(
        framing_error), .par_err(parity_error), .test_si(test_si1), .test_se(
        test_se) );
endmodule


module SYS_CTRL_test_1 ( CLK, RST, RX_DATA, RX_valid, FIFO_FULL, FIFO_wr_inc, 
        FIFO_wr_data, Reg_wr_en, Reg_ADDR, Reg_wr_data, Reg_rd_en, Reg_rd_data, 
        Reg_data_valid, ALU_out, ALU_out_valid, ALU_en, ALU_FUN, CLK_DIV_EN, 
        ALU_GATE_EN, test_si2, test_si1, test_so2, test_so1, test_se );
  input [7:0] RX_DATA;
  output [7:0] FIFO_wr_data;
  output [3:0] Reg_ADDR;
  output [7:0] Reg_wr_data;
  input [7:0] Reg_rd_data;
  input [15:0] ALU_out;
  output [3:0] ALU_FUN;
  input CLK, RST, RX_valid, FIFO_FULL, Reg_data_valid, ALU_out_valid, test_si2,
         test_si1, test_se;
  output FIFO_wr_inc, Reg_wr_en, Reg_rd_en, ALU_en, CLK_DIV_EN, ALU_GATE_EN,
         test_so2, test_so1;
  wire   N55, N56, N57, N58, N59, N60, N61, N62, N64, N65, N66, N67, N69, N70,
         N71, N72, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n146, n147, n148, n149, n150, n151, n152, n153, n155, n156;
  wire   [3:0] NS;
  wire   [3:0] CS;
  wire   [3:0] alu_fun;

  SDFFRX1M \rf_data_reg[7]  ( .D(N62), .SI(n146), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(test_so2), .QN(n21) );
  SDFFRX1M \rf_data_reg[6]  ( .D(N61), .SI(n147), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(n146), .QN(n22) );
  SDFFRX1M \rf_data_reg[5]  ( .D(N60), .SI(n148), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(n147), .QN(n23) );
  SDFFRX1M \rf_data_reg[4]  ( .D(N59), .SI(n149), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(n148), .QN(n24) );
  SDFFRX1M \rf_data_reg[3]  ( .D(N58), .SI(n150), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(n149), .QN(n25) );
  SDFFRX1M \rf_data_reg[2]  ( .D(N57), .SI(n151), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(n150), .QN(n26) );
  SDFFRX1M \rf_data_reg[1]  ( .D(N56), .SI(n152), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(n151), .QN(n27) );
  SDFFRX1M \rf_data_reg[0]  ( .D(N55), .SI(n153), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(n152), .QN(n28) );
  SDFFRX1M \rf_addr_reg[0]  ( .D(N64), .SI(alu_fun[3]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n156), .QN(n32) );
  SDFFRX1M \rf_addr_reg[3]  ( .D(N67), .SI(test_si2), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n153), .QN(n29) );
  SDFFRX1M \rf_addr_reg[1]  ( .D(N65), .SI(n156), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(n155), .QN(n31) );
  SDFFRQX1M \CS_reg[2]  ( .D(NS[2]), .SI(n43), .SE(test_se), .CK(CLK), .RN(RST), .Q(CS[2]) );
  SDFFRQX1M \CS_reg[0]  ( .D(NS[0]), .SI(test_si1), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(CS[0]) );
  SDFFRQX1M \CS_reg[3]  ( .D(NS[3]), .SI(n135), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(CS[3]) );
  SDFFRQX1M \CS_reg[1]  ( .D(NS[1]), .SI(n45), .SE(test_se), .CK(CLK), .RN(RST), .Q(CS[1]) );
  SDFFRQX1M \alu_fun_reg[3]  ( .D(N72), .SI(alu_fun[2]), .SE(test_se), .CK(CLK), .RN(RST), .Q(alu_fun[3]) );
  SDFFRQX1M \alu_fun_reg[2]  ( .D(N71), .SI(alu_fun[1]), .SE(test_se), .CK(CLK), .RN(RST), .Q(alu_fun[2]) );
  SDFFRQX1M \alu_fun_reg[1]  ( .D(N70), .SI(alu_fun[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(alu_fun[1]) );
  SDFFRQX1M \alu_fun_reg[0]  ( .D(N69), .SI(n44), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(alu_fun[0]) );
  OAI31X1M U25 ( .A0(n132), .A1(n70), .A2(n133), .B0(n97), .Y(ALU_en) );
  BUFX2M U34 ( .A(CS[3]), .Y(n44) );
  OAI211X2M U35 ( .A0(ALU_out_valid), .A1(n74), .B0(n82), .C0(n83), .Y(NS[0])
         );
  NAND4BBX1M U36 ( .AN(n107), .BN(n68), .C(n91), .D(n108), .Y(NS[1]) );
  BUFX2M U37 ( .A(CS[0]), .Y(n45) );
  NOR2X2M U38 ( .A(n66), .B(n30), .Y(Reg_ADDR[2]) );
  INVX2M U39 ( .A(Reg_rd_en), .Y(n129) );
  NAND2X2M U40 ( .A(n106), .B(n130), .Y(Reg_rd_en) );
  INVX2M U41 ( .A(n73), .Y(n57) );
  NOR2X2M U42 ( .A(n63), .B(n62), .Y(n65) );
  NOR2X2M U43 ( .A(n128), .B(n133), .Y(n73) );
  AND3X2M U44 ( .A(n67), .B(n129), .C(n48), .Y(n66) );
  INVX2M U45 ( .A(n62), .Y(n131) );
  NAND2X2M U46 ( .A(n115), .B(n132), .Y(n67) );
  INVX2M U47 ( .A(n47), .Y(n49) );
  AOI21X2M U48 ( .A0(n96), .A1(n97), .B0(n55), .Y(n95) );
  INVX2M U49 ( .A(n77), .Y(n130) );
  INVX2M U50 ( .A(n75), .Y(n51) );
  OR3X2M U51 ( .A(n94), .B(n58), .C(n46), .Y(n127) );
  INVX2M U52 ( .A(n126), .Y(n134) );
  NAND2BX2M U53 ( .AN(n84), .B(n126), .Y(n106) );
  INVX2M U54 ( .A(n105), .Y(n58) );
  INVX2M U55 ( .A(n81), .Y(n56) );
  NAND3BX2M U56 ( .AN(n46), .B(n104), .C(n105), .Y(FIFO_wr_inc) );
  NAND3BX2M U57 ( .AN(NS[1]), .B(n106), .C(Reg_rd_en), .Y(n104) );
  INVX2M U58 ( .A(FIFO_FULL), .Y(n55) );
  NOR3X2M U59 ( .A(n135), .B(n133), .C(n84), .Y(n77) );
  BUFX2M U60 ( .A(n78), .Y(n47) );
  OAI31X1M U61 ( .A0(n60), .A1(NS[1]), .A2(n79), .B0(n80), .Y(n78) );
  NAND4X2M U62 ( .A(NS[1]), .B(n50), .C(n53), .D(n52), .Y(n80) );
  AOI22X1M U63 ( .A0(n131), .A1(n50), .B0(NS[0]), .B1(n81), .Y(n79) );
  NOR3X2M U64 ( .A(n134), .B(n45), .C(n132), .Y(n62) );
  NOR3X2M U65 ( .A(n133), .B(n45), .C(n135), .Y(n115) );
  NOR3X2M U66 ( .A(n45), .B(n44), .C(n134), .Y(n63) );
  NAND4X2M U67 ( .A(n72), .B(NS[3]), .C(NS[0]), .D(NS[1]), .Y(n71) );
  OAI2BB2X1M U68 ( .B0(NS[2]), .B1(n73), .A0N(n74), .A1N(NS[2]), .Y(n72) );
  NAND4X2M U69 ( .A(n76), .B(NS[0]), .C(NS[1]), .D(n52), .Y(n75) );
  OAI22X1M U70 ( .A0(NS[2]), .A1(n68), .B0(n77), .B1(n53), .Y(n76) );
  NOR2X2M U71 ( .A(n135), .B(n43), .Y(n126) );
  OAI21X2M U72 ( .A0(n59), .A1(n60), .B0(n61), .Y(Reg_wr_en) );
  AOI21X2M U73 ( .A0(n62), .A1(NS[0]), .B0(n63), .Y(n59) );
  NAND2X2M U74 ( .A(n45), .B(n132), .Y(n84) );
  NAND3X2M U75 ( .A(n44), .B(n126), .C(n45), .Y(n81) );
  INVX2M U76 ( .A(n43), .Y(n133) );
  NAND2X2M U77 ( .A(n115), .B(n44), .Y(n96) );
  NAND3X2M U78 ( .A(n43), .B(n70), .C(n44), .Y(n88) );
  INVX2M U79 ( .A(n44), .Y(n132) );
  NAND3X2M U80 ( .A(n70), .B(n133), .C(n44), .Y(n105) );
  INVX2M U81 ( .A(NS[0]), .Y(n50) );
  NAND3X2M U82 ( .A(n44), .B(n135), .C(n45), .Y(n128) );
  NAND4X2M U83 ( .A(n81), .B(n57), .C(n88), .D(n74), .Y(n94) );
  NAND3X2M U84 ( .A(n70), .B(n132), .C(n43), .Y(n61) );
  AND4X2M U85 ( .A(n142), .B(n138), .C(n110), .D(n111), .Y(n103) );
  NOR3X2M U86 ( .A(n144), .B(n141), .C(n137), .Y(n111) );
  NAND3X2M U87 ( .A(n133), .B(n135), .C(n44), .Y(n97) );
  BUFX2M U88 ( .A(n64), .Y(n48) );
  NOR3BX2M U89 ( .AN(n61), .B(n68), .C(n69), .Y(n64) );
  INVX2M U90 ( .A(NS[3]), .Y(n52) );
  NAND2X2M U91 ( .A(NS[2]), .B(NS[3]), .Y(n60) );
  INVX2M U92 ( .A(NS[2]), .Y(n53) );
  BUFX2M U93 ( .A(n98), .Y(n46) );
  OAI21X2M U94 ( .A0(n43), .A1(n128), .B0(n96), .Y(n98) );
  INVX2M U95 ( .A(n100), .Y(ALU_FUN[0]) );
  OAI21X2M U96 ( .A0(n45), .A1(n134), .B0(n132), .Y(ALU_GATE_EN) );
  OAI21X2M U97 ( .A0(n129), .A1(n28), .B0(n125), .Y(FIFO_wr_data[0]) );
  AOI22X1M U98 ( .A0(ALU_out[0]), .A1(n46), .B0(ALU_out[8]), .B1(n58), .Y(n125) );
  OAI21X2M U99 ( .A0(n129), .A1(n27), .B0(n124), .Y(FIFO_wr_data[1]) );
  AOI22X1M U100 ( .A0(ALU_out[1]), .A1(n46), .B0(ALU_out[9]), .B1(n58), .Y(
        n124) );
  OAI21X2M U101 ( .A0(n129), .A1(n26), .B0(n123), .Y(FIFO_wr_data[2]) );
  AOI22X1M U102 ( .A0(ALU_out[2]), .A1(n46), .B0(ALU_out[10]), .B1(n58), .Y(
        n123) );
  OAI21X2M U103 ( .A0(n129), .A1(n25), .B0(n122), .Y(FIFO_wr_data[3]) );
  AOI22X1M U104 ( .A0(ALU_out[3]), .A1(n46), .B0(ALU_out[11]), .B1(n58), .Y(
        n122) );
  OAI21X2M U105 ( .A0(n129), .A1(n24), .B0(n121), .Y(FIFO_wr_data[4]) );
  AOI22X1M U106 ( .A0(ALU_out[4]), .A1(n46), .B0(ALU_out[12]), .B1(n58), .Y(
        n121) );
  OAI21X2M U107 ( .A0(n129), .A1(n23), .B0(n120), .Y(FIFO_wr_data[5]) );
  AOI22X1M U108 ( .A0(ALU_out[5]), .A1(n46), .B0(ALU_out[13]), .B1(n58), .Y(
        n120) );
  OAI21X2M U109 ( .A0(n129), .A1(n22), .B0(n119), .Y(FIFO_wr_data[6]) );
  AOI22X1M U110 ( .A0(ALU_out[6]), .A1(n46), .B0(ALU_out[14]), .B1(n58), .Y(
        n119) );
  OAI21X2M U111 ( .A0(n129), .A1(n21), .B0(n118), .Y(FIFO_wr_data[7]) );
  AOI22X1M U112 ( .A0(ALU_out[7]), .A1(n46), .B0(ALU_out[15]), .B1(n58), .Y(
        n118) );
  AOI21BX2M U113 ( .A0(RX_valid), .A1(n109), .B0N(n88), .Y(n108) );
  OAI221X1M U114 ( .A0(Reg_data_valid), .A1(n130), .B0(ALU_out_valid), .B1(n57), .C0(n54), .Y(n107) );
  OAI21X2M U115 ( .A0(CS[2]), .A1(n84), .B0(n81), .Y(n109) );
  INVX2M U116 ( .A(n112), .Y(n54) );
  OAI211X2M U117 ( .A0(n55), .A1(n96), .B0(n113), .C0(n114), .Y(n112) );
  AND2X2M U118 ( .A(n67), .B(n74), .Y(n114) );
  NAND4X2M U119 ( .A(RX_DATA[4]), .B(RX_DATA[0]), .C(n89), .D(n116), .Y(n113)
         );
  NOR4X1M U120 ( .A(n73), .B(n77), .C(n56), .D(n69), .Y(n83) );
  AOI32X1M U121 ( .A0(n85), .A1(n135), .A2(n45), .B0(RX_valid), .B1(n86), .Y(
        n82) );
  NAND4X2M U122 ( .A(n87), .B(n131), .C(n67), .D(n88), .Y(n86) );
  NOR2X4M U123 ( .A(n66), .B(n29), .Y(Reg_ADDR[3]) );
  NOR3X2M U124 ( .A(n43), .B(CS[2]), .C(n84), .Y(n69) );
  NOR2X2M U125 ( .A(CS[2]), .B(n45), .Y(n70) );
  NOR3X2M U126 ( .A(n133), .B(CS[2]), .C(n84), .Y(n68) );
  NOR3X2M U127 ( .A(n144), .B(RX_DATA[6]), .C(RX_DATA[2]), .Y(n116) );
  NAND4X2M U128 ( .A(n131), .B(n91), .C(n92), .D(n93), .Y(NS[3]) );
  NAND4X2M U129 ( .A(ALU_FUN[1]), .B(n46), .C(n99), .D(n100), .Y(n92) );
  AOI211X2M U130 ( .A0(n63), .A1(RX_valid), .B0(n94), .C0(n95), .Y(n93) );
  NOR2X2M U131 ( .A(ALU_FUN[3]), .B(ALU_FUN[2]), .Y(n99) );
  OAI22X1M U132 ( .A0(RX_valid), .A1(n44), .B0(n43), .B1(n55), .Y(n85) );
  NAND3X2M U133 ( .A(n54), .B(n65), .C(n101), .Y(NS[2]) );
  AOI211X2M U134 ( .A0(n102), .A1(n103), .B0(n77), .C0(n56), .Y(n101) );
  NOR2X2M U135 ( .A(RX_DATA[4]), .B(RX_DATA[0]), .Y(n102) );
  AND2X2M U136 ( .A(alu_fun[3]), .B(n127), .Y(ALU_FUN[3]) );
  OAI22X1M U137 ( .A0(n49), .A1(n143), .B0(n28), .B1(n47), .Y(N55) );
  OAI22X1M U138 ( .A0(n49), .A1(n142), .B0(n27), .B1(n47), .Y(N56) );
  OAI22X1M U139 ( .A0(n49), .A1(n141), .B0(n26), .B1(n47), .Y(N57) );
  OAI22X1M U140 ( .A0(n49), .A1(n140), .B0(n25), .B1(n47), .Y(N58) );
  OAI22X1M U141 ( .A0(n49), .A1(n139), .B0(n24), .B1(n47), .Y(N59) );
  OAI22X1M U142 ( .A0(n49), .A1(n138), .B0(n23), .B1(n47), .Y(N60) );
  OAI22X1M U143 ( .A0(n49), .A1(n137), .B0(n22), .B1(n47), .Y(N61) );
  OAI22X1M U144 ( .A0(n49), .A1(n136), .B0(n21), .B1(n47), .Y(N62) );
  OAI22X1M U145 ( .A0(n143), .A1(n75), .B0(n51), .B1(n32), .Y(N64) );
  OAI22X1M U146 ( .A0(n142), .A1(n75), .B0(n51), .B1(n31), .Y(N65) );
  OAI22X1M U147 ( .A0(n141), .A1(n75), .B0(n51), .B1(n30), .Y(N66) );
  OAI22X1M U148 ( .A0(n140), .A1(n75), .B0(n51), .B1(n29), .Y(N67) );
  AND2X2M U149 ( .A(alu_fun[2]), .B(n127), .Y(ALU_FUN[2]) );
  NAND4X2M U150 ( .A(n45), .B(n44), .C(CS[2]), .D(n43), .Y(n74) );
  INVX2M U151 ( .A(CS[2]), .Y(n135) );
  AND3X2M U152 ( .A(n110), .B(RX_DATA[1]), .C(RX_DATA[5]), .Y(n89) );
  OAI2BB2X1M U153 ( .B0(n143), .B1(n71), .A0N(n71), .A1N(alu_fun[0]), .Y(N69)
         );
  OAI2BB2X1M U154 ( .B0(n142), .B1(n71), .A0N(n71), .A1N(alu_fun[1]), .Y(N70)
         );
  OAI2BB2X1M U155 ( .B0(n141), .B1(n71), .A0N(n71), .A1N(alu_fun[2]), .Y(N71)
         );
  OAI2BB2X1M U156 ( .B0(n140), .B1(n71), .A0N(n71), .A1N(alu_fun[3]), .Y(N72)
         );
  AND2X2M U157 ( .A(alu_fun[1]), .B(n127), .Y(ALU_FUN[1]) );
  BUFX2M U158 ( .A(CS[1]), .Y(n43) );
  NAND3X2M U159 ( .A(RX_DATA[0]), .B(n103), .C(RX_DATA[4]), .Y(n91) );
  INVX2M U160 ( .A(RX_DATA[2]), .Y(n141) );
  NAND2X2M U161 ( .A(alu_fun[0]), .B(n127), .Y(n100) );
  NAND3X2M U162 ( .A(n89), .B(n143), .C(n90), .Y(n87) );
  NOR3X2M U163 ( .A(RX_DATA[2]), .B(RX_DATA[6]), .C(RX_DATA[4]), .Y(n90) );
  INVX2M U164 ( .A(RX_DATA[6]), .Y(n137) );
  INVX2M U165 ( .A(RX_DATA[1]), .Y(n142) );
  INVX2M U166 ( .A(RX_valid), .Y(n144) );
  AND4X2M U167 ( .A(RX_DATA[7]), .B(RX_DATA[3]), .C(n117), .D(n70), .Y(n110)
         );
  NOR2X2M U168 ( .A(n44), .B(n43), .Y(n117) );
  INVX2M U169 ( .A(RX_DATA[5]), .Y(n138) );
  OAI21X2M U170 ( .A0(n66), .A1(n32), .B0(n131), .Y(Reg_ADDR[0]) );
  NOR2X2M U171 ( .A(n66), .B(n31), .Y(Reg_ADDR[1]) );
  OAI22X1M U172 ( .A0(n48), .A1(n28), .B0(n65), .B1(n143), .Y(Reg_wr_data[0])
         );
  OAI22X1M U173 ( .A0(n48), .A1(n27), .B0(n65), .B1(n142), .Y(Reg_wr_data[1])
         );
  OAI22X1M U174 ( .A0(n48), .A1(n26), .B0(n65), .B1(n141), .Y(Reg_wr_data[2])
         );
  OAI22X1M U175 ( .A0(n48), .A1(n25), .B0(n65), .B1(n140), .Y(Reg_wr_data[3])
         );
  OAI22X1M U176 ( .A0(n48), .A1(n24), .B0(n65), .B1(n139), .Y(Reg_wr_data[4])
         );
  OAI22X1M U177 ( .A0(n48), .A1(n23), .B0(n65), .B1(n138), .Y(Reg_wr_data[5])
         );
  OAI22X1M U178 ( .A0(n48), .A1(n22), .B0(n65), .B1(n137), .Y(Reg_wr_data[6])
         );
  OAI22X1M U179 ( .A0(n48), .A1(n21), .B0(n65), .B1(n136), .Y(Reg_wr_data[7])
         );
  INVX2M U180 ( .A(RX_DATA[0]), .Y(n143) );
  INVX2M U181 ( .A(RX_DATA[4]), .Y(n139) );
  INVX2M U182 ( .A(RX_DATA[3]), .Y(n140) );
  INVX2M U183 ( .A(RX_DATA[7]), .Y(n136) );
  SDFFRX2M \rf_addr_reg[2]  ( .D(N66), .SI(n155), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(test_so1), .QN(n30) );
  INVX2M U3 ( .A(1'b0), .Y(CLK_DIV_EN) );
endmodule


module RegFile_test_1 ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, 
        RdData_VLD, REG0, REG1, REG2, REG3, test_si2, test_si1, test_so2, 
        test_so1, test_se );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn, test_si2, test_si1, test_se;
  output RdData_VLD, test_so2, test_so1;
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
         \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n369, n370, n371, n372;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];
  assign test_so2 = \regArr[15][7] ;
  assign test_so1 = \regArr[6][1] ;

  SDFFRQX2M \RdData_reg[7]  ( .D(n184), .SI(RdData[6]), .SE(n369), .CK(CLK), 
        .RN(n342), .Q(RdData[7]) );
  SDFFRQX2M \RdData_reg[6]  ( .D(n183), .SI(RdData[5]), .SE(n372), .CK(CLK), 
        .RN(n342), .Q(RdData[6]) );
  SDFFRQX2M \RdData_reg[5]  ( .D(n182), .SI(RdData[4]), .SE(n371), .CK(CLK), 
        .RN(n342), .Q(RdData[5]) );
  SDFFRQX2M \RdData_reg[4]  ( .D(n181), .SI(RdData[3]), .SE(n370), .CK(CLK), 
        .RN(n342), .Q(RdData[4]) );
  SDFFRQX2M \RdData_reg[3]  ( .D(n180), .SI(RdData[2]), .SE(n369), .CK(CLK), 
        .RN(n342), .Q(RdData[3]) );
  SDFFRQX2M \RdData_reg[2]  ( .D(n179), .SI(RdData[1]), .SE(n372), .CK(CLK), 
        .RN(n342), .Q(RdData[2]) );
  SDFFRQX2M \RdData_reg[1]  ( .D(n178), .SI(RdData[0]), .SE(n371), .CK(CLK), 
        .RN(n342), .Q(RdData[1]) );
  SDFFRQX2M \RdData_reg[0]  ( .D(n177), .SI(RdData_VLD), .SE(n370), .CK(CLK), 
        .RN(n346), .Q(RdData[0]) );
  SDFFRQX2M \regArr_reg[13][7]  ( .D(n297), .SI(\regArr[13][6] ), .SE(n369), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][7] ) );
  SDFFRQX2M \regArr_reg[13][6]  ( .D(n296), .SI(\regArr[13][5] ), .SE(n372), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][6] ) );
  SDFFRQX2M \regArr_reg[13][5]  ( .D(n295), .SI(\regArr[13][4] ), .SE(n371), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][5] ) );
  SDFFRQX2M \regArr_reg[13][4]  ( .D(n294), .SI(\regArr[13][3] ), .SE(n370), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][4] ) );
  SDFFRQX2M \regArr_reg[13][3]  ( .D(n293), .SI(\regArr[13][2] ), .SE(n369), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][3] ) );
  SDFFRQX2M \regArr_reg[13][2]  ( .D(n292), .SI(\regArr[13][1] ), .SE(n372), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][2] ) );
  SDFFRQX2M \regArr_reg[13][1]  ( .D(n291), .SI(\regArr[13][0] ), .SE(n371), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][1] ) );
  SDFFRQX2M \regArr_reg[13][0]  ( .D(n290), .SI(\regArr[12][7] ), .SE(n370), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][0] ) );
  SDFFRQX2M \regArr_reg[9][7]  ( .D(n265), .SI(\regArr[9][6] ), .SE(n369), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][7] ) );
  SDFFRQX2M \regArr_reg[9][6]  ( .D(n264), .SI(\regArr[9][5] ), .SE(n372), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][6] ) );
  SDFFRQX2M \regArr_reg[9][5]  ( .D(n263), .SI(\regArr[9][4] ), .SE(n371), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][5] ) );
  SDFFRQX2M \regArr_reg[9][4]  ( .D(n262), .SI(\regArr[9][3] ), .SE(n370), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][4] ) );
  SDFFRQX2M \regArr_reg[9][3]  ( .D(n261), .SI(\regArr[9][2] ), .SE(n369), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][3] ) );
  SDFFRQX2M \regArr_reg[9][2]  ( .D(n260), .SI(\regArr[9][1] ), .SE(n372), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][2] ) );
  SDFFRQX2M \regArr_reg[9][1]  ( .D(n259), .SI(\regArr[9][0] ), .SE(n371), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][1] ) );
  SDFFRQX2M \regArr_reg[9][0]  ( .D(n258), .SI(\regArr[8][7] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\regArr[9][0] ) );
  SDFFRQX2M \regArr_reg[5][7]  ( .D(n233), .SI(\regArr[5][6] ), .SE(n369), 
        .CK(CLK), .RN(n346), .Q(\regArr[5][7] ) );
  SDFFRQX2M \regArr_reg[5][6]  ( .D(n232), .SI(\regArr[5][5] ), .SE(n372), 
        .CK(CLK), .RN(n346), .Q(\regArr[5][6] ) );
  SDFFRQX2M \regArr_reg[5][5]  ( .D(n231), .SI(\regArr[5][4] ), .SE(n371), 
        .CK(CLK), .RN(n345), .Q(\regArr[5][5] ) );
  SDFFRQX2M \regArr_reg[5][4]  ( .D(n230), .SI(\regArr[5][3] ), .SE(n370), 
        .CK(CLK), .RN(n345), .Q(\regArr[5][4] ) );
  SDFFRQX2M \regArr_reg[5][3]  ( .D(n229), .SI(\regArr[5][2] ), .SE(n369), 
        .CK(CLK), .RN(n345), .Q(\regArr[5][3] ) );
  SDFFRQX2M \regArr_reg[5][2]  ( .D(n228), .SI(\regArr[5][1] ), .SE(n372), 
        .CK(CLK), .RN(n345), .Q(\regArr[5][2] ) );
  SDFFRQX2M \regArr_reg[5][1]  ( .D(n227), .SI(\regArr[5][0] ), .SE(n371), 
        .CK(CLK), .RN(n345), .Q(\regArr[5][1] ) );
  SDFFRQX2M \regArr_reg[5][0]  ( .D(n226), .SI(\regArr[4][7] ), .SE(n370), 
        .CK(CLK), .RN(n345), .Q(\regArr[5][0] ) );
  SDFFRQX2M \regArr_reg[15][7]  ( .D(n313), .SI(\regArr[15][6] ), .SE(n369), 
        .CK(CLK), .RN(n342), .Q(\regArr[15][7] ) );
  SDFFRQX2M \regArr_reg[15][6]  ( .D(n312), .SI(\regArr[15][5] ), .SE(n372), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][6] ) );
  SDFFRQX2M \regArr_reg[15][5]  ( .D(n311), .SI(\regArr[15][4] ), .SE(n371), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][5] ) );
  SDFFRQX2M \regArr_reg[15][4]  ( .D(n310), .SI(\regArr[15][3] ), .SE(n370), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][4] ) );
  SDFFRQX2M \regArr_reg[15][3]  ( .D(n309), .SI(\regArr[15][2] ), .SE(n369), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][3] ) );
  SDFFRQX2M \regArr_reg[15][2]  ( .D(n308), .SI(\regArr[15][1] ), .SE(n372), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][2] ) );
  SDFFRQX2M \regArr_reg[15][1]  ( .D(n307), .SI(\regArr[15][0] ), .SE(n371), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][1] ) );
  SDFFRQX2M \regArr_reg[15][0]  ( .D(n306), .SI(\regArr[14][7] ), .SE(n370), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][0] ) );
  SDFFRQX2M \regArr_reg[11][7]  ( .D(n281), .SI(\regArr[11][6] ), .SE(n369), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][7] ) );
  SDFFRQX2M \regArr_reg[11][6]  ( .D(n280), .SI(\regArr[11][5] ), .SE(n372), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][6] ) );
  SDFFRQX2M \regArr_reg[11][5]  ( .D(n279), .SI(\regArr[11][4] ), .SE(n371), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][5] ) );
  SDFFRQX2M \regArr_reg[11][4]  ( .D(n278), .SI(\regArr[11][3] ), .SE(n370), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][4] ) );
  SDFFRQX2M \regArr_reg[11][3]  ( .D(n277), .SI(\regArr[11][2] ), .SE(n369), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][3] ) );
  SDFFRQX2M \regArr_reg[11][2]  ( .D(n276), .SI(\regArr[11][1] ), .SE(n372), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][2] ) );
  SDFFRQX2M \regArr_reg[11][1]  ( .D(n275), .SI(\regArr[11][0] ), .SE(n371), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][1] ) );
  SDFFRQX2M \regArr_reg[11][0]  ( .D(n274), .SI(\regArr[10][7] ), .SE(n370), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][0] ) );
  SDFFRQX2M \regArr_reg[7][7]  ( .D(n249), .SI(\regArr[7][6] ), .SE(n369), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][7] ) );
  SDFFRQX2M \regArr_reg[7][6]  ( .D(n248), .SI(\regArr[7][5] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][6] ) );
  SDFFRQX2M \regArr_reg[7][5]  ( .D(n247), .SI(\regArr[7][4] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][5] ) );
  SDFFRQX2M \regArr_reg[7][4]  ( .D(n246), .SI(\regArr[7][3] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][4] ) );
  SDFFRQX2M \regArr_reg[7][3]  ( .D(n245), .SI(\regArr[7][2] ), .SE(n369), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][3] ) );
  SDFFRQX2M \regArr_reg[7][2]  ( .D(n244), .SI(\regArr[7][1] ), .SE(n372), 
        .CK(CLK), .RN(n346), .Q(\regArr[7][2] ) );
  SDFFRQX2M \regArr_reg[7][1]  ( .D(n243), .SI(\regArr[7][0] ), .SE(n371), 
        .CK(CLK), .RN(n346), .Q(\regArr[7][1] ) );
  SDFFRQX2M \regArr_reg[7][0]  ( .D(n242), .SI(\regArr[6][7] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\regArr[7][0] ) );
  SDFFRQX2M \regArr_reg[14][7]  ( .D(n305), .SI(\regArr[14][6] ), .SE(n369), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][7] ) );
  SDFFRQX2M \regArr_reg[14][6]  ( .D(n304), .SI(\regArr[14][5] ), .SE(n372), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][6] ) );
  SDFFRQX2M \regArr_reg[14][5]  ( .D(n303), .SI(\regArr[14][4] ), .SE(n371), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][5] ) );
  SDFFRQX2M \regArr_reg[14][4]  ( .D(n302), .SI(\regArr[14][3] ), .SE(n370), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][4] ) );
  SDFFRQX2M \regArr_reg[14][3]  ( .D(n301), .SI(\regArr[14][2] ), .SE(n369), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][3] ) );
  SDFFRQX2M \regArr_reg[14][2]  ( .D(n300), .SI(\regArr[14][1] ), .SE(n372), 
        .CK(CLK), .RN(n350), .Q(\regArr[14][2] ) );
  SDFFRQX2M \regArr_reg[14][1]  ( .D(n299), .SI(\regArr[14][0] ), .SE(n371), 
        .CK(CLK), .RN(n350), .Q(\regArr[14][1] ) );
  SDFFRQX2M \regArr_reg[14][0]  ( .D(n298), .SI(\regArr[13][7] ), .SE(n370), 
        .CK(CLK), .RN(n350), .Q(\regArr[14][0] ) );
  SDFFRQX2M \regArr_reg[10][7]  ( .D(n273), .SI(\regArr[10][6] ), .SE(n369), 
        .CK(CLK), .RN(n349), .Q(\regArr[10][7] ) );
  SDFFRQX2M \regArr_reg[10][6]  ( .D(n272), .SI(\regArr[10][5] ), .SE(n372), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][6] ) );
  SDFFRQX2M \regArr_reg[10][5]  ( .D(n271), .SI(\regArr[10][4] ), .SE(n371), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][5] ) );
  SDFFRQX2M \regArr_reg[10][4]  ( .D(n270), .SI(\regArr[10][3] ), .SE(n370), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][4] ) );
  SDFFRQX2M \regArr_reg[10][3]  ( .D(n269), .SI(\regArr[10][2] ), .SE(n369), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][3] ) );
  SDFFRQX2M \regArr_reg[10][2]  ( .D(n268), .SI(\regArr[10][1] ), .SE(n372), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][2] ) );
  SDFFRQX2M \regArr_reg[10][1]  ( .D(n267), .SI(\regArr[10][0] ), .SE(n371), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][1] ) );
  SDFFRQX2M \regArr_reg[10][0]  ( .D(n266), .SI(\regArr[9][7] ), .SE(n370), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][0] ) );
  SDFFRQX2M \regArr_reg[6][7]  ( .D(n241), .SI(\regArr[6][6] ), .SE(n369), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][7] ) );
  SDFFRQX2M \regArr_reg[6][6]  ( .D(n240), .SI(\regArr[6][5] ), .SE(n372), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][6] ) );
  SDFFRQX2M \regArr_reg[6][5]  ( .D(n239), .SI(\regArr[6][4] ), .SE(n371), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][5] ) );
  SDFFRQX2M \regArr_reg[6][4]  ( .D(n238), .SI(\regArr[6][3] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][4] ) );
  SDFFRQX2M \regArr_reg[6][3]  ( .D(n237), .SI(\regArr[6][2] ), .SE(n369), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][3] ) );
  SDFFRQX2M \regArr_reg[6][2]  ( .D(n236), .SI(test_si2), .SE(n372), .CK(CLK), 
        .RN(n346), .Q(\regArr[6][2] ) );
  SDFFRQX2M \regArr_reg[6][1]  ( .D(n235), .SI(\regArr[6][0] ), .SE(n371), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][1] ) );
  SDFFRQX2M \regArr_reg[6][0]  ( .D(n234), .SI(\regArr[5][7] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][0] ) );
  SDFFRQX2M \regArr_reg[12][7]  ( .D(n289), .SI(\regArr[12][6] ), .SE(n369), 
        .CK(CLK), .RN(n350), .Q(\regArr[12][7] ) );
  SDFFRQX2M \regArr_reg[12][6]  ( .D(n288), .SI(\regArr[12][5] ), .SE(n372), 
        .CK(CLK), .RN(n350), .Q(\regArr[12][6] ) );
  SDFFRQX2M \regArr_reg[12][5]  ( .D(n287), .SI(\regArr[12][4] ), .SE(n371), 
        .CK(CLK), .RN(n350), .Q(\regArr[12][5] ) );
  SDFFRQX2M \regArr_reg[12][4]  ( .D(n286), .SI(\regArr[12][3] ), .SE(n370), 
        .CK(CLK), .RN(n349), .Q(\regArr[12][4] ) );
  SDFFRQX2M \regArr_reg[12][3]  ( .D(n285), .SI(\regArr[12][2] ), .SE(n369), 
        .CK(CLK), .RN(n349), .Q(\regArr[12][3] ) );
  SDFFRQX2M \regArr_reg[12][2]  ( .D(n284), .SI(\regArr[12][1] ), .SE(n372), 
        .CK(CLK), .RN(n349), .Q(\regArr[12][2] ) );
  SDFFRQX2M \regArr_reg[12][1]  ( .D(n283), .SI(\regArr[12][0] ), .SE(n371), 
        .CK(CLK), .RN(n349), .Q(\regArr[12][1] ) );
  SDFFRQX2M \regArr_reg[12][0]  ( .D(n282), .SI(\regArr[11][7] ), .SE(n370), 
        .CK(CLK), .RN(n349), .Q(\regArr[12][0] ) );
  SDFFRQX2M \regArr_reg[8][7]  ( .D(n257), .SI(\regArr[8][6] ), .SE(n369), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][7] ) );
  SDFFRQX2M \regArr_reg[8][6]  ( .D(n256), .SI(\regArr[8][5] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][6] ) );
  SDFFRQX2M \regArr_reg[8][5]  ( .D(n255), .SI(\regArr[8][4] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][5] ) );
  SDFFRQX2M \regArr_reg[8][4]  ( .D(n254), .SI(\regArr[8][3] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][4] ) );
  SDFFRQX2M \regArr_reg[8][3]  ( .D(n253), .SI(\regArr[8][2] ), .SE(n369), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][3] ) );
  SDFFRQX2M \regArr_reg[8][2]  ( .D(n252), .SI(\regArr[8][1] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][2] ) );
  SDFFRQX2M \regArr_reg[8][1]  ( .D(n251), .SI(\regArr[8][0] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][1] ) );
  SDFFRQX2M \regArr_reg[8][0]  ( .D(n250), .SI(\regArr[7][7] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][0] ) );
  SDFFRQX2M \regArr_reg[4][7]  ( .D(n225), .SI(\regArr[4][6] ), .SE(n369), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][7] ) );
  SDFFRQX2M \regArr_reg[4][6]  ( .D(n224), .SI(\regArr[4][5] ), .SE(n372), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][6] ) );
  SDFFRQX2M \regArr_reg[4][5]  ( .D(n223), .SI(\regArr[4][4] ), .SE(n371), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][5] ) );
  SDFFRQX2M \regArr_reg[4][4]  ( .D(n222), .SI(\regArr[4][3] ), .SE(n370), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][4] ) );
  SDFFRQX2M \regArr_reg[4][3]  ( .D(n221), .SI(\regArr[4][2] ), .SE(n369), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][3] ) );
  SDFFRQX2M \regArr_reg[4][2]  ( .D(n220), .SI(\regArr[4][1] ), .SE(n372), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][2] ) );
  SDFFRQX2M \regArr_reg[4][1]  ( .D(n219), .SI(\regArr[4][0] ), .SE(n371), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][1] ) );
  SDFFRQX2M \regArr_reg[4][0]  ( .D(n218), .SI(REG3[7]), .SE(n370), .CK(CLK), 
        .RN(n345), .Q(\regArr[4][0] ) );
  SDFFRQX2M \regArr_reg[3][0]  ( .D(n210), .SI(REG2[7]), .SE(n369), .CK(CLK), 
        .RN(n344), .Q(REG3[0]) );
  SDFFRQX2M \regArr_reg[1][6]  ( .D(n200), .SI(REG1[5]), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(REG1[6]) );
  SDFFRQX2M \regArr_reg[0][7]  ( .D(n193), .SI(REG0[6]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(REG0[7]) );
  SDFFRQX2M \regArr_reg[0][6]  ( .D(n192), .SI(REG0[5]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(REG0[6]) );
  SDFFRQX2M \regArr_reg[0][5]  ( .D(n191), .SI(REG0[4]), .SE(n369), .CK(CLK), 
        .RN(n343), .Q(REG0[5]) );
  SDFFRQX2M \regArr_reg[0][4]  ( .D(n190), .SI(REG0[3]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(REG0[4]) );
  SDFFRQX2M \regArr_reg[0][3]  ( .D(n189), .SI(REG0[2]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(REG0[3]) );
  SDFFRQX2M \regArr_reg[0][2]  ( .D(n188), .SI(REG0[1]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(REG0[2]) );
  SDFFRQX2M \regArr_reg[0][1]  ( .D(n187), .SI(REG0[0]), .SE(n369), .CK(CLK), 
        .RN(n342), .Q(REG0[1]) );
  SDFFRQX2M \regArr_reg[0][0]  ( .D(n186), .SI(RdData[7]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(REG0[0]) );
  SDFFRQX2M \regArr_reg[2][1]  ( .D(n203), .SI(REG2[0]), .SE(n371), .CK(CLK), 
        .RN(n344), .Q(REG2[1]) );
  SDFFSQX2M \regArr_reg[2][0]  ( .D(n202), .SI(REG1[7]), .SE(test_se), .CK(CLK), .SN(n342), .Q(REG2[0]) );
  SDFFRQX2M \regArr_reg[1][1]  ( .D(n195), .SI(REG1[0]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(REG1[1]) );
  SDFFRQX2M \regArr_reg[1][5]  ( .D(n199), .SI(REG1[4]), .SE(n369), .CK(CLK), 
        .RN(n343), .Q(REG1[5]) );
  SDFFRQX2M \regArr_reg[1][4]  ( .D(n198), .SI(REG1[3]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(REG1[4]) );
  SDFFRQX2M \regArr_reg[1][7]  ( .D(n201), .SI(REG1[6]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(REG1[7]) );
  SDFFRQX2M \regArr_reg[1][3]  ( .D(n197), .SI(REG1[2]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(REG1[3]) );
  SDFFRQX2M \regArr_reg[1][2]  ( .D(n196), .SI(REG1[1]), .SE(n369), .CK(CLK), 
        .RN(n343), .Q(REG1[2]) );
  SDFFRQX2M \regArr_reg[1][0]  ( .D(n194), .SI(REG0[7]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(REG1[0]) );
  SDFFRQX2M \regArr_reg[3][6]  ( .D(n216), .SI(REG3[5]), .SE(n371), .CK(CLK), 
        .RN(n344), .Q(REG3[6]) );
  SDFFRQX2M \regArr_reg[3][7]  ( .D(n217), .SI(REG3[6]), .SE(n370), .CK(CLK), 
        .RN(n344), .Q(REG3[7]) );
  SDFFSQX2M \regArr_reg[3][5]  ( .D(n215), .SI(REG3[4]), .SE(n372), .CK(CLK), 
        .SN(n342), .Q(REG3[5]) );
  SDFFRQX2M \regArr_reg[3][4]  ( .D(n214), .SI(REG3[3]), .SE(n369), .CK(CLK), 
        .RN(n344), .Q(REG3[4]) );
  SDFFRQX2M \regArr_reg[3][2]  ( .D(n212), .SI(REG3[1]), .SE(n369), .CK(CLK), 
        .RN(n344), .Q(REG3[2]) );
  SDFFRQX2M \regArr_reg[3][3]  ( .D(n213), .SI(REG3[2]), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(REG3[3]) );
  SDFFRQX2M \regArr_reg[3][1]  ( .D(n211), .SI(REG3[0]), .SE(n371), .CK(CLK), 
        .RN(n344), .Q(REG3[1]) );
  SDFFRQX2M \regArr_reg[2][3]  ( .D(n205), .SI(REG2[2]), .SE(n370), .CK(CLK), 
        .RN(n344), .Q(REG2[3]) );
  SDFFRQX2M \regArr_reg[2][2]  ( .D(n204), .SI(REG2[1]), .SE(n369), .CK(CLK), 
        .RN(n344), .Q(REG2[2]) );
  SDFFRQX2M \regArr_reg[2][4]  ( .D(n206), .SI(REG2[3]), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(REG2[4]) );
  SDFFSQX2M \regArr_reg[2][6]  ( .D(n208), .SI(REG2[5]), .SE(n371), .CK(CLK), 
        .SN(n342), .Q(REG2[6]) );
  SDFFRQX2M \regArr_reg[2][5]  ( .D(n207), .SI(REG2[4]), .SE(n371), .CK(CLK), 
        .RN(n344), .Q(REG2[5]) );
  SDFFRQX2M \regArr_reg[2][7]  ( .D(n209), .SI(REG2[6]), .SE(n370), .CK(CLK), 
        .RN(n344), .Q(REG2[7]) );
  SDFFRQX1M RdData_VLD_reg ( .D(n185), .SI(test_si1), .SE(n370), .CK(CLK), 
        .RN(n342), .Q(RdData_VLD) );
  NOR2BX2M U141 ( .AN(n175), .B(n340), .Y(n169) );
  NOR2BX2M U142 ( .AN(n164), .B(n340), .Y(n155) );
  NOR2BX2M U143 ( .AN(N13), .B(N12), .Y(n160) );
  NOR2BX2M U144 ( .AN(N13), .B(n341), .Y(n163) );
  NOR2X2M U145 ( .A(n341), .B(N13), .Y(n157) );
  NOR2X2M U146 ( .A(N12), .B(N13), .Y(n152) );
  INVX2M U147 ( .A(WrData[0]), .Y(n358) );
  INVX2M U148 ( .A(WrData[1]), .Y(n359) );
  INVX2M U149 ( .A(WrData[2]), .Y(n360) );
  INVX2M U150 ( .A(WrData[3]), .Y(n361) );
  INVX2M U151 ( .A(WrData[4]), .Y(n362) );
  INVX2M U152 ( .A(WrData[5]), .Y(n363) );
  INVX2M U153 ( .A(WrData[6]), .Y(n364) );
  INVX2M U154 ( .A(WrData[7]), .Y(n365) );
  INVX2M U155 ( .A(n340), .Y(n338) );
  INVX2M U156 ( .A(n336), .Y(n337) );
  INVX2M U157 ( .A(n340), .Y(n339) );
  INVX2M U158 ( .A(n149), .Y(n357) );
  BUFX2M U159 ( .A(n341), .Y(n336) );
  NOR2BX2M U160 ( .AN(n164), .B(N11), .Y(n153) );
  NOR2BX2M U161 ( .AN(n175), .B(N11), .Y(n167) );
  NAND2X2M U162 ( .A(n155), .B(n152), .Y(n154) );
  NAND2X2M U163 ( .A(n167), .B(n152), .Y(n166) );
  NAND2X2M U164 ( .A(n169), .B(n152), .Y(n168) );
  NAND2X2M U165 ( .A(n167), .B(n157), .Y(n170) );
  NAND2X2M U166 ( .A(n169), .B(n157), .Y(n171) );
  NAND2X2M U167 ( .A(n157), .B(n153), .Y(n156) );
  NAND2X2M U168 ( .A(n157), .B(n155), .Y(n158) );
  NAND2X2M U169 ( .A(n160), .B(n153), .Y(n159) );
  NAND2X2M U170 ( .A(n160), .B(n155), .Y(n161) );
  NAND2X2M U171 ( .A(n163), .B(n153), .Y(n162) );
  NAND2X2M U172 ( .A(n163), .B(n155), .Y(n165) );
  NAND2X2M U173 ( .A(n167), .B(n160), .Y(n172) );
  NAND2X2M U174 ( .A(n169), .B(n160), .Y(n173) );
  NAND2X2M U175 ( .A(n167), .B(n163), .Y(n174) );
  NAND2X2M U176 ( .A(n169), .B(n163), .Y(n176) );
  NAND2X2M U177 ( .A(n152), .B(n153), .Y(n151) );
  NAND2BX2M U178 ( .AN(WrEn), .B(RdEn), .Y(n149) );
  NOR2BX2M U179 ( .AN(WrEn), .B(RdEn), .Y(n150) );
  BUFX2M U180 ( .A(n356), .Y(n343) );
  BUFX2M U181 ( .A(n355), .Y(n344) );
  BUFX2M U182 ( .A(n355), .Y(n345) );
  BUFX2M U183 ( .A(n354), .Y(n346) );
  BUFX2M U184 ( .A(n354), .Y(n347) );
  BUFX2M U185 ( .A(n353), .Y(n348) );
  BUFX2M U186 ( .A(n353), .Y(n349) );
  BUFX2M U187 ( .A(n352), .Y(n350) );
  BUFX2M U188 ( .A(n356), .Y(n342) );
  BUFX2M U189 ( .A(n352), .Y(n351) );
  NOR2BX2M U190 ( .AN(n150), .B(N14), .Y(n164) );
  AND2X2M U191 ( .A(N14), .B(n150), .Y(n175) );
  BUFX2M U192 ( .A(RST), .Y(n355) );
  BUFX2M U193 ( .A(RST), .Y(n354) );
  BUFX2M U194 ( .A(RST), .Y(n353) );
  BUFX2M U195 ( .A(RST), .Y(n352) );
  BUFX2M U196 ( .A(RST), .Y(n356) );
  OAI2BB2X1M U197 ( .B0(n151), .B1(n358), .A0N(REG0[0]), .A1N(n151), .Y(n186)
         );
  OAI2BB2X1M U198 ( .B0(n151), .B1(n359), .A0N(REG0[1]), .A1N(n151), .Y(n187)
         );
  OAI2BB2X1M U199 ( .B0(n151), .B1(n360), .A0N(REG0[2]), .A1N(n151), .Y(n188)
         );
  OAI2BB2X1M U200 ( .B0(n151), .B1(n361), .A0N(REG0[3]), .A1N(n151), .Y(n189)
         );
  OAI2BB2X1M U201 ( .B0(n151), .B1(n362), .A0N(REG0[4]), .A1N(n151), .Y(n190)
         );
  OAI2BB2X1M U202 ( .B0(n151), .B1(n363), .A0N(REG0[5]), .A1N(n151), .Y(n191)
         );
  OAI2BB2X1M U203 ( .B0(n151), .B1(n364), .A0N(REG0[6]), .A1N(n151), .Y(n192)
         );
  OAI2BB2X1M U204 ( .B0(n151), .B1(n365), .A0N(REG0[7]), .A1N(n151), .Y(n193)
         );
  OAI2BB2X1M U205 ( .B0(n358), .B1(n154), .A0N(REG1[0]), .A1N(n154), .Y(n194)
         );
  OAI2BB2X1M U206 ( .B0(n359), .B1(n154), .A0N(REG1[1]), .A1N(n154), .Y(n195)
         );
  OAI2BB2X1M U207 ( .B0(n360), .B1(n154), .A0N(REG1[2]), .A1N(n154), .Y(n196)
         );
  OAI2BB2X1M U208 ( .B0(n361), .B1(n154), .A0N(REG1[3]), .A1N(n154), .Y(n197)
         );
  OAI2BB2X1M U209 ( .B0(n362), .B1(n154), .A0N(REG1[4]), .A1N(n154), .Y(n198)
         );
  OAI2BB2X1M U210 ( .B0(n363), .B1(n154), .A0N(REG1[5]), .A1N(n154), .Y(n199)
         );
  OAI2BB2X1M U211 ( .B0(n364), .B1(n154), .A0N(REG1[6]), .A1N(n154), .Y(n200)
         );
  OAI2BB2X1M U212 ( .B0(n365), .B1(n154), .A0N(REG1[7]), .A1N(n154), .Y(n201)
         );
  OAI2BB2X1M U213 ( .B0(n358), .B1(n159), .A0N(\regArr[4][0] ), .A1N(n159), 
        .Y(n218) );
  OAI2BB2X1M U214 ( .B0(n359), .B1(n159), .A0N(\regArr[4][1] ), .A1N(n159), 
        .Y(n219) );
  OAI2BB2X1M U215 ( .B0(n360), .B1(n159), .A0N(\regArr[4][2] ), .A1N(n159), 
        .Y(n220) );
  OAI2BB2X1M U216 ( .B0(n361), .B1(n159), .A0N(\regArr[4][3] ), .A1N(n159), 
        .Y(n221) );
  OAI2BB2X1M U217 ( .B0(n362), .B1(n159), .A0N(\regArr[4][4] ), .A1N(n159), 
        .Y(n222) );
  OAI2BB2X1M U218 ( .B0(n363), .B1(n159), .A0N(\regArr[4][5] ), .A1N(n159), 
        .Y(n223) );
  OAI2BB2X1M U219 ( .B0(n364), .B1(n159), .A0N(\regArr[4][6] ), .A1N(n159), 
        .Y(n224) );
  OAI2BB2X1M U220 ( .B0(n365), .B1(n159), .A0N(\regArr[4][7] ), .A1N(n159), 
        .Y(n225) );
  OAI2BB2X1M U221 ( .B0(n358), .B1(n161), .A0N(\regArr[5][0] ), .A1N(n161), 
        .Y(n226) );
  OAI2BB2X1M U222 ( .B0(n359), .B1(n161), .A0N(\regArr[5][1] ), .A1N(n161), 
        .Y(n227) );
  OAI2BB2X1M U223 ( .B0(n360), .B1(n161), .A0N(\regArr[5][2] ), .A1N(n161), 
        .Y(n228) );
  OAI2BB2X1M U224 ( .B0(n361), .B1(n161), .A0N(\regArr[5][3] ), .A1N(n161), 
        .Y(n229) );
  OAI2BB2X1M U225 ( .B0(n362), .B1(n161), .A0N(\regArr[5][4] ), .A1N(n161), 
        .Y(n230) );
  OAI2BB2X1M U226 ( .B0(n363), .B1(n161), .A0N(\regArr[5][5] ), .A1N(n161), 
        .Y(n231) );
  OAI2BB2X1M U227 ( .B0(n364), .B1(n161), .A0N(\regArr[5][6] ), .A1N(n161), 
        .Y(n232) );
  OAI2BB2X1M U228 ( .B0(n365), .B1(n161), .A0N(\regArr[5][7] ), .A1N(n161), 
        .Y(n233) );
  OAI2BB2X1M U229 ( .B0(n358), .B1(n162), .A0N(\regArr[6][0] ), .A1N(n162), 
        .Y(n234) );
  OAI2BB2X1M U230 ( .B0(n359), .B1(n162), .A0N(\regArr[6][1] ), .A1N(n162), 
        .Y(n235) );
  OAI2BB2X1M U231 ( .B0(n360), .B1(n162), .A0N(\regArr[6][2] ), .A1N(n162), 
        .Y(n236) );
  OAI2BB2X1M U232 ( .B0(n361), .B1(n162), .A0N(\regArr[6][3] ), .A1N(n162), 
        .Y(n237) );
  OAI2BB2X1M U233 ( .B0(n362), .B1(n162), .A0N(\regArr[6][4] ), .A1N(n162), 
        .Y(n238) );
  OAI2BB2X1M U234 ( .B0(n363), .B1(n162), .A0N(\regArr[6][5] ), .A1N(n162), 
        .Y(n239) );
  OAI2BB2X1M U235 ( .B0(n364), .B1(n162), .A0N(\regArr[6][6] ), .A1N(n162), 
        .Y(n240) );
  OAI2BB2X1M U236 ( .B0(n365), .B1(n162), .A0N(\regArr[6][7] ), .A1N(n162), 
        .Y(n241) );
  OAI2BB2X1M U237 ( .B0(n358), .B1(n165), .A0N(\regArr[7][0] ), .A1N(n165), 
        .Y(n242) );
  OAI2BB2X1M U238 ( .B0(n359), .B1(n165), .A0N(\regArr[7][1] ), .A1N(n165), 
        .Y(n243) );
  OAI2BB2X1M U239 ( .B0(n360), .B1(n165), .A0N(\regArr[7][2] ), .A1N(n165), 
        .Y(n244) );
  OAI2BB2X1M U240 ( .B0(n361), .B1(n165), .A0N(\regArr[7][3] ), .A1N(n165), 
        .Y(n245) );
  OAI2BB2X1M U241 ( .B0(n362), .B1(n165), .A0N(\regArr[7][4] ), .A1N(n165), 
        .Y(n246) );
  OAI2BB2X1M U242 ( .B0(n363), .B1(n165), .A0N(\regArr[7][5] ), .A1N(n165), 
        .Y(n247) );
  OAI2BB2X1M U243 ( .B0(n364), .B1(n165), .A0N(\regArr[7][6] ), .A1N(n165), 
        .Y(n248) );
  OAI2BB2X1M U244 ( .B0(n365), .B1(n165), .A0N(\regArr[7][7] ), .A1N(n165), 
        .Y(n249) );
  OAI2BB2X1M U245 ( .B0(n358), .B1(n166), .A0N(\regArr[8][0] ), .A1N(n166), 
        .Y(n250) );
  OAI2BB2X1M U246 ( .B0(n359), .B1(n166), .A0N(\regArr[8][1] ), .A1N(n166), 
        .Y(n251) );
  OAI2BB2X1M U247 ( .B0(n360), .B1(n166), .A0N(\regArr[8][2] ), .A1N(n166), 
        .Y(n252) );
  OAI2BB2X1M U248 ( .B0(n361), .B1(n166), .A0N(\regArr[8][3] ), .A1N(n166), 
        .Y(n253) );
  OAI2BB2X1M U249 ( .B0(n362), .B1(n166), .A0N(\regArr[8][4] ), .A1N(n166), 
        .Y(n254) );
  OAI2BB2X1M U250 ( .B0(n363), .B1(n166), .A0N(\regArr[8][5] ), .A1N(n166), 
        .Y(n255) );
  OAI2BB2X1M U251 ( .B0(n364), .B1(n166), .A0N(\regArr[8][6] ), .A1N(n166), 
        .Y(n256) );
  OAI2BB2X1M U252 ( .B0(n365), .B1(n166), .A0N(\regArr[8][7] ), .A1N(n166), 
        .Y(n257) );
  OAI2BB2X1M U253 ( .B0(n358), .B1(n168), .A0N(\regArr[9][0] ), .A1N(n168), 
        .Y(n258) );
  OAI2BB2X1M U254 ( .B0(n359), .B1(n168), .A0N(\regArr[9][1] ), .A1N(n168), 
        .Y(n259) );
  OAI2BB2X1M U255 ( .B0(n360), .B1(n168), .A0N(\regArr[9][2] ), .A1N(n168), 
        .Y(n260) );
  OAI2BB2X1M U256 ( .B0(n361), .B1(n168), .A0N(\regArr[9][3] ), .A1N(n168), 
        .Y(n261) );
  OAI2BB2X1M U257 ( .B0(n362), .B1(n168), .A0N(\regArr[9][4] ), .A1N(n168), 
        .Y(n262) );
  OAI2BB2X1M U258 ( .B0(n363), .B1(n168), .A0N(\regArr[9][5] ), .A1N(n168), 
        .Y(n263) );
  OAI2BB2X1M U259 ( .B0(n364), .B1(n168), .A0N(\regArr[9][6] ), .A1N(n168), 
        .Y(n264) );
  OAI2BB2X1M U260 ( .B0(n365), .B1(n168), .A0N(\regArr[9][7] ), .A1N(n168), 
        .Y(n265) );
  OAI2BB2X1M U261 ( .B0(n358), .B1(n170), .A0N(\regArr[10][0] ), .A1N(n170), 
        .Y(n266) );
  OAI2BB2X1M U262 ( .B0(n359), .B1(n170), .A0N(\regArr[10][1] ), .A1N(n170), 
        .Y(n267) );
  OAI2BB2X1M U263 ( .B0(n360), .B1(n170), .A0N(\regArr[10][2] ), .A1N(n170), 
        .Y(n268) );
  OAI2BB2X1M U264 ( .B0(n361), .B1(n170), .A0N(\regArr[10][3] ), .A1N(n170), 
        .Y(n269) );
  OAI2BB2X1M U265 ( .B0(n362), .B1(n170), .A0N(\regArr[10][4] ), .A1N(n170), 
        .Y(n270) );
  OAI2BB2X1M U266 ( .B0(n363), .B1(n170), .A0N(\regArr[10][5] ), .A1N(n170), 
        .Y(n271) );
  OAI2BB2X1M U267 ( .B0(n364), .B1(n170), .A0N(\regArr[10][6] ), .A1N(n170), 
        .Y(n272) );
  OAI2BB2X1M U268 ( .B0(n365), .B1(n170), .A0N(\regArr[10][7] ), .A1N(n170), 
        .Y(n273) );
  OAI2BB2X1M U269 ( .B0(n358), .B1(n171), .A0N(\regArr[11][0] ), .A1N(n171), 
        .Y(n274) );
  OAI2BB2X1M U270 ( .B0(n359), .B1(n171), .A0N(\regArr[11][1] ), .A1N(n171), 
        .Y(n275) );
  OAI2BB2X1M U271 ( .B0(n360), .B1(n171), .A0N(\regArr[11][2] ), .A1N(n171), 
        .Y(n276) );
  OAI2BB2X1M U272 ( .B0(n361), .B1(n171), .A0N(\regArr[11][3] ), .A1N(n171), 
        .Y(n277) );
  OAI2BB2X1M U273 ( .B0(n362), .B1(n171), .A0N(\regArr[11][4] ), .A1N(n171), 
        .Y(n278) );
  OAI2BB2X1M U274 ( .B0(n363), .B1(n171), .A0N(\regArr[11][5] ), .A1N(n171), 
        .Y(n279) );
  OAI2BB2X1M U275 ( .B0(n364), .B1(n171), .A0N(\regArr[11][6] ), .A1N(n171), 
        .Y(n280) );
  OAI2BB2X1M U276 ( .B0(n365), .B1(n171), .A0N(\regArr[11][7] ), .A1N(n171), 
        .Y(n281) );
  OAI2BB2X1M U277 ( .B0(n358), .B1(n172), .A0N(\regArr[12][0] ), .A1N(n172), 
        .Y(n282) );
  OAI2BB2X1M U278 ( .B0(n359), .B1(n172), .A0N(\regArr[12][1] ), .A1N(n172), 
        .Y(n283) );
  OAI2BB2X1M U279 ( .B0(n360), .B1(n172), .A0N(\regArr[12][2] ), .A1N(n172), 
        .Y(n284) );
  OAI2BB2X1M U280 ( .B0(n361), .B1(n172), .A0N(\regArr[12][3] ), .A1N(n172), 
        .Y(n285) );
  OAI2BB2X1M U281 ( .B0(n362), .B1(n172), .A0N(\regArr[12][4] ), .A1N(n172), 
        .Y(n286) );
  OAI2BB2X1M U282 ( .B0(n363), .B1(n172), .A0N(\regArr[12][5] ), .A1N(n172), 
        .Y(n287) );
  OAI2BB2X1M U283 ( .B0(n364), .B1(n172), .A0N(\regArr[12][6] ), .A1N(n172), 
        .Y(n288) );
  OAI2BB2X1M U284 ( .B0(n365), .B1(n172), .A0N(\regArr[12][7] ), .A1N(n172), 
        .Y(n289) );
  OAI2BB2X1M U285 ( .B0(n358), .B1(n173), .A0N(\regArr[13][0] ), .A1N(n173), 
        .Y(n290) );
  OAI2BB2X1M U286 ( .B0(n359), .B1(n173), .A0N(\regArr[13][1] ), .A1N(n173), 
        .Y(n291) );
  OAI2BB2X1M U287 ( .B0(n360), .B1(n173), .A0N(\regArr[13][2] ), .A1N(n173), 
        .Y(n292) );
  OAI2BB2X1M U288 ( .B0(n361), .B1(n173), .A0N(\regArr[13][3] ), .A1N(n173), 
        .Y(n293) );
  OAI2BB2X1M U289 ( .B0(n362), .B1(n173), .A0N(\regArr[13][4] ), .A1N(n173), 
        .Y(n294) );
  OAI2BB2X1M U290 ( .B0(n363), .B1(n173), .A0N(\regArr[13][5] ), .A1N(n173), 
        .Y(n295) );
  OAI2BB2X1M U291 ( .B0(n364), .B1(n173), .A0N(\regArr[13][6] ), .A1N(n173), 
        .Y(n296) );
  OAI2BB2X1M U292 ( .B0(n365), .B1(n173), .A0N(\regArr[13][7] ), .A1N(n173), 
        .Y(n297) );
  OAI2BB2X1M U293 ( .B0(n358), .B1(n174), .A0N(\regArr[14][0] ), .A1N(n174), 
        .Y(n298) );
  OAI2BB2X1M U294 ( .B0(n359), .B1(n174), .A0N(\regArr[14][1] ), .A1N(n174), 
        .Y(n299) );
  OAI2BB2X1M U295 ( .B0(n360), .B1(n174), .A0N(\regArr[14][2] ), .A1N(n174), 
        .Y(n300) );
  OAI2BB2X1M U296 ( .B0(n361), .B1(n174), .A0N(\regArr[14][3] ), .A1N(n174), 
        .Y(n301) );
  OAI2BB2X1M U297 ( .B0(n362), .B1(n174), .A0N(\regArr[14][4] ), .A1N(n174), 
        .Y(n302) );
  OAI2BB2X1M U298 ( .B0(n363), .B1(n174), .A0N(\regArr[14][5] ), .A1N(n174), 
        .Y(n303) );
  OAI2BB2X1M U299 ( .B0(n364), .B1(n174), .A0N(\regArr[14][6] ), .A1N(n174), 
        .Y(n304) );
  OAI2BB2X1M U300 ( .B0(n365), .B1(n174), .A0N(\regArr[14][7] ), .A1N(n174), 
        .Y(n305) );
  OAI2BB2X1M U301 ( .B0(n358), .B1(n176), .A0N(\regArr[15][0] ), .A1N(n176), 
        .Y(n306) );
  OAI2BB2X1M U302 ( .B0(n359), .B1(n176), .A0N(\regArr[15][1] ), .A1N(n176), 
        .Y(n307) );
  OAI2BB2X1M U303 ( .B0(n360), .B1(n176), .A0N(\regArr[15][2] ), .A1N(n176), 
        .Y(n308) );
  OAI2BB2X1M U304 ( .B0(n361), .B1(n176), .A0N(\regArr[15][3] ), .A1N(n176), 
        .Y(n309) );
  OAI2BB2X1M U305 ( .B0(n362), .B1(n176), .A0N(\regArr[15][4] ), .A1N(n176), 
        .Y(n310) );
  OAI2BB2X1M U306 ( .B0(n363), .B1(n176), .A0N(\regArr[15][5] ), .A1N(n176), 
        .Y(n311) );
  OAI2BB2X1M U307 ( .B0(n364), .B1(n176), .A0N(\regArr[15][6] ), .A1N(n176), 
        .Y(n312) );
  OAI2BB2X1M U308 ( .B0(n365), .B1(n176), .A0N(\regArr[15][7] ), .A1N(n176), 
        .Y(n313) );
  OAI2BB2X1M U309 ( .B0(n359), .B1(n156), .A0N(REG2[1]), .A1N(n156), .Y(n203)
         );
  OAI2BB2X1M U310 ( .B0(n360), .B1(n156), .A0N(REG2[2]), .A1N(n156), .Y(n204)
         );
  OAI2BB2X1M U311 ( .B0(n361), .B1(n156), .A0N(REG2[3]), .A1N(n156), .Y(n205)
         );
  OAI2BB2X1M U312 ( .B0(n362), .B1(n156), .A0N(REG2[4]), .A1N(n156), .Y(n206)
         );
  OAI2BB2X1M U313 ( .B0(n363), .B1(n156), .A0N(REG2[5]), .A1N(n156), .Y(n207)
         );
  OAI2BB2X1M U314 ( .B0(n365), .B1(n156), .A0N(REG2[7]), .A1N(n156), .Y(n209)
         );
  OAI2BB2X1M U315 ( .B0(n358), .B1(n158), .A0N(REG3[0]), .A1N(n158), .Y(n210)
         );
  OAI2BB2X1M U316 ( .B0(n359), .B1(n158), .A0N(REG3[1]), .A1N(n158), .Y(n211)
         );
  OAI2BB2X1M U317 ( .B0(n360), .B1(n158), .A0N(REG3[2]), .A1N(n158), .Y(n212)
         );
  OAI2BB2X1M U318 ( .B0(n361), .B1(n158), .A0N(REG3[3]), .A1N(n158), .Y(n213)
         );
  OAI2BB2X1M U319 ( .B0(n362), .B1(n158), .A0N(REG3[4]), .A1N(n158), .Y(n214)
         );
  OAI2BB2X1M U320 ( .B0(n364), .B1(n158), .A0N(REG3[6]), .A1N(n158), .Y(n216)
         );
  OAI2BB2X1M U321 ( .B0(n365), .B1(n158), .A0N(REG3[7]), .A1N(n158), .Y(n217)
         );
  OAI2BB2X1M U322 ( .B0(n358), .B1(n156), .A0N(REG2[0]), .A1N(n156), .Y(n202)
         );
  OAI2BB2X1M U323 ( .B0(n364), .B1(n156), .A0N(REG2[6]), .A1N(n156), .Y(n208)
         );
  OAI2BB2X1M U324 ( .B0(n363), .B1(n158), .A0N(REG3[5]), .A1N(n158), .Y(n215)
         );
  MX4X1M U325 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(N12), .Y(n142) );
  MX4X1M U326 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n338), 
        .S1(N12), .Y(n146) );
  MX4X1M U327 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n339), 
        .S1(N12), .Y(n327) );
  MX4X1M U328 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n338), 
        .S1(n337), .Y(n315) );
  MX4X1M U329 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n338), 
        .S1(n337), .Y(n319) );
  MX4X1M U330 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n339), 
        .S1(n337), .Y(n323) );
  MX4X1M U331 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n339), 
        .S1(n337), .Y(n331) );
  MX4X1M U332 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n339), 
        .S1(N12), .Y(n335) );
  MX4X1M U333 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(N11), .S1(N12), .Y(n141) );
  MX4X1M U334 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n338), .S1(N12), .Y(n145) );
  MX4X1M U335 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n338), .S1(n337), .Y(n314) );
  MX4X1M U336 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n338), .S1(n337), .Y(n318) );
  MX4X1M U337 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n338), .S1(n337), .Y(n322) );
  MX4X1M U338 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n339), .S1(N12), .Y(n326) );
  MX4X1M U339 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n339), .S1(n337), .Y(n330) );
  MX4X1M U340 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(n339), .S1(N12), .Y(n334) );
  AO22X1M U341 ( .A0(N43), .A1(n357), .B0(RdData[0]), .B1(n149), .Y(n177) );
  MX4X1M U342 ( .A(n142), .B(n140), .C(n141), .D(n139), .S0(N14), .S1(N13), 
        .Y(N43) );
  MX4X1M U343 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(N11), .S1(N12), .Y(n140) );
  MX4X1M U344 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(N11), .S1(N12), .Y(n139) );
  AO22X1M U345 ( .A0(N41), .A1(n357), .B0(RdData[2]), .B1(n149), .Y(n179) );
  MX4X1M U346 ( .A(n315), .B(n148), .C(n314), .D(n147), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U347 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n338), .S1(n337), .Y(n148) );
  MX4X1M U348 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n338), .S1(n337), .Y(n147) );
  AO22X1M U349 ( .A0(N40), .A1(n357), .B0(RdData[3]), .B1(n149), .Y(n180) );
  MX4X1M U350 ( .A(n319), .B(n317), .C(n318), .D(n316), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U351 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n338), .S1(n337), .Y(n317) );
  MX4X1M U352 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n338), .S1(n337), .Y(n316) );
  AO22X1M U353 ( .A0(N39), .A1(n357), .B0(RdData[4]), .B1(n149), .Y(n181) );
  MX4X1M U354 ( .A(n323), .B(n321), .C(n322), .D(n320), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U355 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n338), .S1(n337), .Y(n321) );
  MX4X1M U356 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n338), .S1(n337), .Y(n320) );
  AO22X1M U357 ( .A0(N38), .A1(n357), .B0(RdData[5]), .B1(n149), .Y(n182) );
  MX4X1M U358 ( .A(n327), .B(n325), .C(n326), .D(n324), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U359 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(n339), .S1(n337), .Y(n325) );
  MX4X1M U360 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n339), .S1(N12), .Y(n324) );
  AO22X1M U361 ( .A0(N37), .A1(n357), .B0(RdData[6]), .B1(n149), .Y(n183) );
  MX4X1M U362 ( .A(n331), .B(n329), .C(n330), .D(n328), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U363 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(n339), .S1(N12), .Y(n329) );
  MX4X1M U364 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n339), .S1(N12), .Y(n328) );
  AO22X1M U365 ( .A0(N36), .A1(n357), .B0(RdData[7]), .B1(n149), .Y(n184) );
  MX4X1M U366 ( .A(n335), .B(n333), .C(n334), .D(n332), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U367 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(n339), .S1(n337), .Y(n333) );
  MX4X1M U368 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n339), .S1(n337), .Y(n332) );
  OAI2BB1X2M U369 ( .A0N(RdData_VLD), .A1N(n150), .B0(n149), .Y(n185) );
  AO22X1M U370 ( .A0(N42), .A1(n357), .B0(RdData[1]), .B1(n149), .Y(n178) );
  MX4X1M U371 ( .A(n146), .B(n144), .C(n145), .D(n143), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U372 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(N11), .S1(N12), .Y(n144) );
  MX4X1M U373 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(N11), .S1(N12), .Y(n143) );
  INVX2M U374 ( .A(N11), .Y(n340) );
  INVX2M U375 ( .A(N12), .Y(n341) );
  DLY1X1M U376 ( .A(test_se), .Y(n369) );
  DLY1X1M U377 ( .A(test_se), .Y(n370) );
  DLY1X1M U378 ( .A(test_se), .Y(n371) );
  DLY1X1M U379 ( .A(test_se), .Y(n372) );
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
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
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
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
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
  XNOR2X2M U9 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  NAND2X2M U10 ( .A(n2), .B(n3), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U11 ( .A(a[5]), .Y(n3) );
  INVX2M U12 ( .A(n18), .Y(n2) );
  NAND2X2M U13 ( .A(n4), .B(n5), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U14 ( .A(a[4]), .Y(n5) );
  INVX2M U15 ( .A(n18), .Y(n4) );
  NAND2X2M U16 ( .A(n6), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U17 ( .A(a[3]), .Y(n7) );
  INVX2M U18 ( .A(n18), .Y(n6) );
  NAND2X2M U19 ( .A(n2), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n8) );
  NAND2X2M U21 ( .A(n6), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U22 ( .A(a[1]), .Y(n9) );
  NAND2X2M U23 ( .A(n4), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U24 ( .A(a[0]), .Y(n10) );
  NAND2X2M U25 ( .A(n2), .B(n1), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U26 ( .A(a[6]), .Y(n1) );
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
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(B[6]), .Y(n3) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  NAND2X2M U8 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U9 ( .A(B[1]), .Y(n8) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
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
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  XNOR2X2M U3 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U4 ( .A(B[7]), .Y(n8) );
  XNOR2X2M U5 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  NAND2X2M U6 ( .A(A[7]), .B(B[7]), .Y(n15) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
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

  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n7), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n6), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n4), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n3), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U15 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U18 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U19 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U20 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U21 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U22 ( .A(\ab[0][2] ), .Y(n18) );
  XNOR2X2M U23 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U24 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U25 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U26 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U27 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U28 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n14) );
  AND2X2M U29 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  AND2X2M U30 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n16) );
  XNOR2X2M U31 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U32 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U33 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U34 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U35 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U36 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U37 ( .A(A[7]), .Y(n32) );
  INVX2M U38 ( .A(A[6]), .Y(n33) );
  INVX2M U39 ( .A(A[1]), .Y(n38) );
  INVX2M U40 ( .A(A[0]), .Y(n39) );
  INVX2M U41 ( .A(A[3]), .Y(n36) );
  INVX2M U42 ( .A(A[2]), .Y(n37) );
  INVX2M U43 ( .A(A[5]), .Y(n34) );
  INVX2M U44 ( .A(A[4]), .Y(n35) );
  INVX2M U45 ( .A(B[6]), .Y(n25) );
  INVX2M U46 ( .A(B[0]), .Y(n31) );
  INVX2M U47 ( .A(B[2]), .Y(n29) );
  INVX2M U48 ( .A(B[3]), .Y(n28) );
  INVX2M U49 ( .A(B[7]), .Y(n24) );
  INVX2M U50 ( .A(B[4]), .Y(n27) );
  INVX2M U51 ( .A(B[5]), .Y(n26) );
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
  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n14, n16, n13, n15, n12, n11, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
endmodule


module ALU_test_1 ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID, test_si, 
        test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST, test_si, test_se;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n3, n4, n5, n6,
         n7, n8, n9, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157;
  wire   [15:0] ALU_OUT_Comb;

  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .SI(ALU_OUT[14]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .SI(ALU_OUT[13]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .SI(ALU_OUT[12]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .SI(ALU_OUT[11]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .SI(ALU_OUT[10]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .SI(ALU_OUT[9]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .SI(ALU_OUT[8]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[9]) );
  SDFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .SI(ALU_OUT[7]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[8]) );
  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .SI(ALU_OUT[6]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .SI(ALU_OUT[5]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .SI(ALU_OUT[4]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[5]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .SI(ALU_OUT[3]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .SI(ALU_OUT[2]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .SI(ALU_OUT[1]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .SI(ALU_OUT[0]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(ALU_OUT[0]) );
  SDFFRQX2M OUT_VALID_reg ( .D(EN), .SI(ALU_OUT[15]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(OUT_VALID) );
  BUFX2M U7 ( .A(A[6]), .Y(n27) );
  OAI2BB1X2M U23 ( .A0N(N118), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U24 ( .A0N(N119), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U25 ( .A0N(N120), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U26 ( .A0N(N121), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U27 ( .A0N(N122), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U28 ( .A0N(N123), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U29 ( .A0N(N124), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U30 ( .A0N(n156), .A1N(n122), .B0(n118), .Y(n64) );
  OAI2BB1X2M U31 ( .A0N(n117), .A1N(n116), .B0(n118), .Y(n65) );
  NOR2BX2M U32 ( .AN(n123), .B(n153), .Y(n54) );
  NAND2X2M U33 ( .A(EN), .B(n140), .Y(n49) );
  INVX2M U34 ( .A(EN), .Y(n157) );
  AND2X2M U35 ( .A(n116), .B(n122), .Y(n59) );
  NOR2BX2M U36 ( .AN(n29), .B(n157), .Y(n48) );
  INVX2M U37 ( .A(ALU_FUN[0]), .Y(n152) );
  AND2X2M U38 ( .A(n123), .B(n122), .Y(n67) );
  BUFX2M U39 ( .A(n58), .Y(n30) );
  NOR2X2M U40 ( .A(n124), .B(n153), .Y(n58) );
  INVX2M U41 ( .A(n117), .Y(n153) );
  INVX2M U42 ( .A(n108), .Y(n154) );
  INVX2M U43 ( .A(n124), .Y(n156) );
  NOR3BX2M U44 ( .AN(n122), .B(n155), .C(ALU_FUN[2]), .Y(n66) );
  INVX2M U45 ( .A(n3), .Y(n139) );
  OAI222X1M U46 ( .A0(n72), .A1(n139), .B0(n3), .B1(n73), .C0(n53), .C1(n146), 
        .Y(n71) );
  AOI221XLM U47 ( .A0(n27), .A1(n63), .B0(n64), .B1(n145), .C0(n30), .Y(n73)
         );
  AOI221XLM U48 ( .A0(n63), .A1(n145), .B0(n27), .B1(n65), .C0(n59), .Y(n72)
         );
  NOR2X2M U49 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n123) );
  AND3X2M U50 ( .A(n123), .B(n152), .C(ALU_FUN[3]), .Y(n63) );
  NAND3X2M U51 ( .A(n156), .B(n152), .C(ALU_FUN[3]), .Y(n53) );
  AOI31X2M U52 ( .A0(n92), .A1(n93), .A2(n94), .B0(n157), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U53 ( .A0(N102), .A1(n67), .B0(N93), .B1(n54), .Y(n92) );
  AOI221XLM U54 ( .A0(n7), .A1(n154), .B0(n30), .B1(n149), .C0(n95), .Y(n94)
         );
  AOI222X1M U55 ( .A0(N111), .A1(n29), .B0(n6), .B1(n59), .C0(N127), .C1(n66), 
        .Y(n93) );
  AOI31X2M U56 ( .A0(n86), .A1(n87), .A2(n88), .B0(n157), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U57 ( .A0(N103), .A1(n67), .B0(N94), .B1(n54), .Y(n86) );
  AOI221XLM U58 ( .A0(n8), .A1(n154), .B0(n30), .B1(n148), .C0(n89), .Y(n88)
         );
  AOI222X1M U59 ( .A0(N112), .A1(n29), .B0(n7), .B1(n59), .C0(N128), .C1(n66), 
        .Y(n87) );
  AOI31X2M U60 ( .A0(n80), .A1(n81), .A2(n82), .B0(n157), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U61 ( .A0(N104), .A1(n67), .B0(N95), .B1(n54), .Y(n80) );
  AOI221XLM U62 ( .A0(n154), .A1(n9), .B0(n30), .B1(n147), .C0(n83), .Y(n82)
         );
  AOI222X1M U63 ( .A0(N113), .A1(n29), .B0(n8), .B1(n59), .C0(N129), .C1(n66), 
        .Y(n81) );
  AOI31X2M U64 ( .A0(n74), .A1(n75), .A2(n76), .B0(n157), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U65 ( .A0(N105), .A1(n67), .B0(N96), .B1(n54), .Y(n74) );
  AOI221XLM U66 ( .A0(n154), .A1(n27), .B0(n30), .B1(n146), .C0(n77), .Y(n76)
         );
  AOI222X1M U67 ( .A0(N114), .A1(n29), .B0(n9), .B1(n59), .C0(N130), .C1(n66), 
        .Y(n75) );
  AOI31X2M U68 ( .A0(n68), .A1(n69), .A2(n70), .B0(n157), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U69 ( .A0(N106), .A1(n67), .B0(N97), .B1(n54), .Y(n68) );
  AOI221XLM U70 ( .A0(n154), .A1(n28), .B0(n30), .B1(n145), .C0(n71), .Y(n70)
         );
  AOI222X1M U71 ( .A0(N115), .A1(n29), .B0(n59), .B1(n27), .C0(N131), .C1(n66), 
        .Y(n69) );
  AOI31X2M U72 ( .A0(n55), .A1(n56), .A2(n57), .B0(n157), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U73 ( .A0(N132), .A1(n66), .B0(N116), .B1(n29), .Y(n56) );
  AOI22X1M U74 ( .A0(N107), .A1(n67), .B0(N98), .B1(n54), .Y(n55) );
  AOI221XLM U75 ( .A0(n30), .A1(n144), .B0(n59), .B1(n28), .C0(n60), .Y(n57)
         );
  AOI31X2M U76 ( .A0(n110), .A1(n111), .A2(n112), .B0(n157), .Y(
        ALU_OUT_Comb[0]) );
  AOI22X1M U77 ( .A0(N100), .A1(n67), .B0(N91), .B1(n54), .Y(n110) );
  AOI211X2M U78 ( .A0(n30), .A1(n151), .B0(n113), .C0(n114), .Y(n112) );
  AOI222X1M U79 ( .A0(N109), .A1(n29), .B0(n4), .B1(n59), .C0(N125), .C1(n66), 
        .Y(n111) );
  AOI31X2M U80 ( .A0(n98), .A1(n99), .A2(n100), .B0(n157), .Y(ALU_OUT_Comb[1])
         );
  AOI211X2M U81 ( .A0(n6), .A1(n154), .B0(n101), .C0(n102), .Y(n100) );
  AOI222X1M U82 ( .A0(N126), .A1(n66), .B0(n30), .B1(n150), .C0(n5), .C1(n59), 
        .Y(n99) );
  AOI222X1M U83 ( .A0(N92), .A1(n54), .B0(N110), .B1(n29), .C0(N101), .C1(n67), 
        .Y(n98) );
  NOR2X2M U84 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n117) );
  NOR2X2M U85 ( .A(n152), .B(ALU_FUN[3]), .Y(n122) );
  INVX2M U86 ( .A(n109), .Y(n140) );
  AOI211X2M U87 ( .A0(N108), .A1(n67), .B0(n30), .C0(n64), .Y(n109) );
  NAND3X2M U88 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .C(n116), .Y(n108) );
  NAND2X2M U89 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n124) );
  AOI21X2M U90 ( .A0(n50), .A1(n51), .B0(n157), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U91 ( .A0(N99), .A1(n54), .B0(n140), .Y(n50) );
  AOI2BB2XLM U92 ( .B0(N117), .B1(n29), .A0N(n144), .A1N(n53), .Y(n51) );
  INVX2M U93 ( .A(ALU_FUN[1]), .Y(n155) );
  NAND3X2M U94 ( .A(n123), .B(ALU_FUN[0]), .C(ALU_FUN[3]), .Y(n118) );
  AND4X2M U95 ( .A(N159), .B(n116), .C(ALU_FUN[3]), .D(n152), .Y(n107) );
  AND2X2M U96 ( .A(ALU_FUN[2]), .B(n155), .Y(n116) );
  BUFX2M U97 ( .A(n52), .Y(n29) );
  NOR3X2M U98 ( .A(n153), .B(ALU_FUN[2]), .C(n155), .Y(n52) );
  INVX2M U99 ( .A(n5), .Y(n150) );
  INVX2M U100 ( .A(n4), .Y(n151) );
  INVX2M U101 ( .A(n27), .Y(n145) );
  INVX2M U102 ( .A(n28), .Y(n144) );
  INVX2M U103 ( .A(n7), .Y(n148) );
  INVX2M U104 ( .A(n6), .Y(n149) );
  INVX2M U105 ( .A(n9), .Y(n146) );
  INVX2M U106 ( .A(n8), .Y(n147) );
  OAI222X1M U107 ( .A0(n96), .A1(n136), .B0(B[2]), .B1(n97), .C0(n53), .C1(
        n150), .Y(n95) );
  AOI221XLM U108 ( .A0(n6), .A1(n63), .B0(n64), .B1(n149), .C0(n30), .Y(n97)
         );
  AOI221XLM U109 ( .A0(n63), .A1(n149), .B0(n6), .B1(n65), .C0(n59), .Y(n96)
         );
  OAI222X1M U110 ( .A0(n90), .A1(n138), .B0(B[3]), .B1(n91), .C0(n53), .C1(
        n149), .Y(n89) );
  AOI221XLM U111 ( .A0(n7), .A1(n63), .B0(n64), .B1(n148), .C0(n30), .Y(n91)
         );
  AOI221XLM U112 ( .A0(n63), .A1(n148), .B0(n7), .B1(n65), .C0(n59), .Y(n90)
         );
  OAI222X1M U113 ( .A0(n84), .A1(n143), .B0(B[4]), .B1(n85), .C0(n53), .C1(
        n148), .Y(n83) );
  INVX2M U114 ( .A(B[4]), .Y(n143) );
  AOI221XLM U115 ( .A0(n8), .A1(n63), .B0(n64), .B1(n147), .C0(n30), .Y(n85)
         );
  AOI221XLM U116 ( .A0(n63), .A1(n147), .B0(n8), .B1(n65), .C0(n59), .Y(n84)
         );
  OAI222X1M U117 ( .A0(n78), .A1(n142), .B0(B[5]), .B1(n79), .C0(n53), .C1(
        n147), .Y(n77) );
  INVX2M U118 ( .A(B[5]), .Y(n142) );
  AOI221XLM U119 ( .A0(n9), .A1(n63), .B0(n64), .B1(n146), .C0(n30), .Y(n79)
         );
  AOI221XLM U120 ( .A0(n63), .A1(n146), .B0(n9), .B1(n65), .C0(n59), .Y(n78)
         );
  OAI222X1M U121 ( .A0(n61), .A1(n141), .B0(B[7]), .B1(n62), .C0(n53), .C1(
        n145), .Y(n60) );
  INVX2M U122 ( .A(B[7]), .Y(n141) );
  AOI221XLM U123 ( .A0(n63), .A1(n28), .B0(n64), .B1(n144), .C0(n30), .Y(n62)
         );
  AOI221XLM U124 ( .A0(n63), .A1(n144), .B0(n28), .B1(n65), .C0(n59), .Y(n61)
         );
  INVX2M U125 ( .A(n31), .Y(n135) );
  OAI2B2X1M U126 ( .A1N(B[0]), .A0(n115), .B0(n108), .B1(n150), .Y(n114) );
  AOI221XLM U127 ( .A0(n63), .A1(n151), .B0(n4), .B1(n65), .C0(n59), .Y(n115)
         );
  OAI2B2X1M U128 ( .A1N(B[1]), .A0(n103), .B0(n53), .B1(n151), .Y(n102) );
  AOI221XLM U129 ( .A0(n63), .A1(n150), .B0(n5), .B1(n65), .C0(n59), .Y(n103)
         );
  INVX2M U130 ( .A(n42), .Y(n137) );
  OAI21X2M U131 ( .A0(B[0]), .A1(n119), .B0(n120), .Y(n113) );
  AOI31X2M U132 ( .A0(N157), .A1(ALU_FUN[3]), .A2(n121), .B0(n107), .Y(n120)
         );
  AOI221XLM U133 ( .A0(n4), .A1(n63), .B0(n64), .B1(n151), .C0(n30), .Y(n119)
         );
  NOR3X2M U134 ( .A(n155), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n121) );
  OAI21X2M U135 ( .A0(B[1]), .A1(n104), .B0(n105), .Y(n101) );
  AOI31X2M U136 ( .A0(N158), .A1(ALU_FUN[3]), .A2(n106), .B0(n107), .Y(n105)
         );
  AOI221XLM U137 ( .A0(n5), .A1(n63), .B0(n64), .B1(n150), .C0(n30), .Y(n104)
         );
  NOR3X2M U138 ( .A(n152), .B(ALU_FUN[2]), .C(n155), .Y(n106) );
  BUFX2M U139 ( .A(A[7]), .Y(n28) );
  BUFX2M U140 ( .A(A[1]), .Y(n5) );
  BUFX2M U141 ( .A(A[0]), .Y(n4) );
  BUFX2M U142 ( .A(A[3]), .Y(n7) );
  BUFX2M U143 ( .A(A[2]), .Y(n6) );
  BUFX2M U144 ( .A(A[5]), .Y(n9) );
  BUFX2M U145 ( .A(A[4]), .Y(n8) );
  BUFX2M U146 ( .A(B[6]), .Y(n3) );
  INVX2M U147 ( .A(B[0]), .Y(n134) );
  INVX2M U148 ( .A(B[2]), .Y(n136) );
  INVX2M U149 ( .A(B[3]), .Y(n138) );
  NOR2X1M U150 ( .A(n144), .B(B[7]), .Y(n130) );
  NAND2BX1M U151 ( .AN(B[4]), .B(n8), .Y(n46) );
  NAND2BX1M U152 ( .AN(n8), .B(B[4]), .Y(n35) );
  CLKNAND2X2M U153 ( .A(n46), .B(n35), .Y(n125) );
  NOR2X1M U154 ( .A(n138), .B(n7), .Y(n43) );
  NOR2X1M U155 ( .A(n136), .B(n6), .Y(n34) );
  NOR2X1M U156 ( .A(n134), .B(n4), .Y(n31) );
  CLKNAND2X2M U157 ( .A(n6), .B(n136), .Y(n45) );
  NAND2BX1M U158 ( .AN(n34), .B(n45), .Y(n40) );
  AOI21X1M U159 ( .A0(n31), .A1(n150), .B0(B[1]), .Y(n32) );
  AOI211X1M U160 ( .A0(n5), .A1(n135), .B0(n40), .C0(n32), .Y(n33) );
  CLKNAND2X2M U161 ( .A(n7), .B(n138), .Y(n44) );
  OAI31X1M U162 ( .A0(n43), .A1(n34), .A2(n33), .B0(n44), .Y(n36) );
  NAND2BX1M U163 ( .AN(n9), .B(B[5]), .Y(n128) );
  OAI211X1M U164 ( .A0(n125), .A1(n36), .B0(n35), .C0(n128), .Y(n37) );
  NAND2BX1M U165 ( .AN(B[5]), .B(n9), .Y(n47) );
  XNOR2X1M U166 ( .A(n27), .B(n3), .Y(n127) );
  AOI32X1M U167 ( .A0(n37), .A1(n47), .A2(n127), .B0(n3), .B1(n145), .Y(n38)
         );
  CLKNAND2X2M U168 ( .A(B[7]), .B(n144), .Y(n131) );
  OAI21X1M U169 ( .A0(n130), .A1(n38), .B0(n131), .Y(N159) );
  CLKNAND2X2M U170 ( .A(n4), .B(n134), .Y(n41) );
  OA21X1M U171 ( .A0(n41), .A1(n150), .B0(B[1]), .Y(n39) );
  AOI211X1M U172 ( .A0(n41), .A1(n150), .B0(n40), .C0(n39), .Y(n42) );
  AOI31X1M U173 ( .A0(n137), .A1(n45), .A2(n44), .B0(n43), .Y(n126) );
  OAI2B11X1M U174 ( .A1N(n126), .A0(n125), .B0(n47), .C0(n46), .Y(n129) );
  AOI32X1M U175 ( .A0(n129), .A1(n128), .A2(n127), .B0(n27), .B1(n139), .Y(
        n132) );
  AOI2B1X1M U176 ( .A1N(n132), .A0(n131), .B0(n130), .Y(n133) );
  CLKINVX1M U177 ( .A(n133), .Y(N158) );
  NOR2X1M U178 ( .A(N159), .B(N158), .Y(N157) );
  ALU_DW_div_uns_0 div_52 ( .a({n28, n27, n9, n8, n7, n6, n5, n4}), .b({B[7], 
        n3, B[5:0]}), .quotient({N132, N131, N130, N129, N128, N127, N126, 
        N125}) );
  ALU_DW01_sub_0 sub_46 ( .A({1'b0, n28, n27, n9, n8, n7, n6, n5, n4}), .B({
        1'b0, B[7], n3, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, N105, 
        N104, N103, N102, N101, N100}) );
  ALU_DW01_add_0 add_43 ( .A({1'b0, n28, n27, n9, n8, n7, n6, n5, n4}), .B({
        1'b0, B[7], n3, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92, N91}) );
  ALU_DW02_mult_0 mult_49 ( .A({n28, n27, n9, n8, n7, n6, n5, n4}), .B({B[7], 
        n3, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, N120, N119, 
        N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( scan_clk, scan_rst, test_mode, SE, SI, SO, RST_N, UART_CLK, 
        REF_CLK, UART_RX_IN, UART_TX_O, parity_error, framing_error );
  input [3:0] SI;
  output [3:0] SO;
  input scan_clk, scan_rst, test_mode, SE, RST_N, UART_CLK, REF_CLK,
         UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   REF_SCAN_CLK, UART_SCAN_CLK, UART_RX_CLK, UART_RX_SCAN_CLK,
         UART_TX_CLK, UART_TX_SCAN_CLK, RSTN_SCAN_RST, SYNC_REF_RST,
         SYNC_REF_SCAN_RST, SYNC_UART_RST, SYNC_UART_SCAN_RST, UART_RX_V_OUT,
         UART_RX_V_SYNC, UART_TX_VLD, UART_TX_Busy_PULSE, FIFO_FULL,
         UART_TX_V_SYNC, UART_TX_Busy, RF_RdData_VLD, RF_WrEn, RF_RdEn, ALU_EN,
         ALU_OUT_VLD, CLKG_EN, ALU_CLK, _1_net_, n1, n2, n3, n4, n5, n6, n7,
         n8, n11, n12, n14, n15, n16, n19, n22, n23, n24, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;
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

  INVX2M U3 ( .A(n6), .Y(n5) );
  OR2X2M U4 ( .A(CLKG_EN), .B(n2), .Y(_1_net_) );
  BUFX2M U5 ( .A(RF_Address[0]), .Y(n3) );
  BUFX2M U6 ( .A(RF_Address[1]), .Y(n4) );
  INVX2M U7 ( .A(UART_TX_V_SYNC), .Y(n1) );
  INVX4M U8 ( .A(n8), .Y(n7) );
  INVX2M U9 ( .A(SYNC_REF_SCAN_RST), .Y(n8) );
  INVX2M U10 ( .A(SYNC_UART_SCAN_RST), .Y(n6) );
  BUFX2M U11 ( .A(test_mode), .Y(n2) );
  DLY1X1M U18 ( .A(n35), .Y(n27) );
  DLY1X1M U19 ( .A(n35), .Y(n28) );
  INVXLM U21 ( .A(n35), .Y(n30) );
  INVXLM U22 ( .A(n30), .Y(n31) );
  INVXLM U23 ( .A(n37), .Y(n32) );
  INVXLM U24 ( .A(n32), .Y(n33) );
  INVXLM U25 ( .A(SE), .Y(n34) );
  INVXLM U26 ( .A(n34), .Y(n35) );
  INVXLM U27 ( .A(n34), .Y(n36) );
  INVXLM U28 ( .A(n34), .Y(n37) );
  mux2X1_1 U0_mux2X1 ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        REF_SCAN_CLK) );
  mux2X1_4 U1_mux2X1 ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        UART_SCAN_CLK) );
  mux2X1_3 U2_mux2X1 ( .IN_0(UART_RX_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        UART_RX_SCAN_CLK) );
  mux2X1_2 U3_mux2X1 ( .IN_0(UART_TX_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        UART_TX_SCAN_CLK) );
  mux2X1_0 U4_mux2X1 ( .IN_0(RST_N), .IN_1(scan_rst), .SEL(n2), .OUT(
        RSTN_SCAN_RST) );
  mux2X1_6 U5_mux2X1 ( .IN_0(SYNC_REF_RST), .IN_1(scan_rst), .SEL(n2), .OUT(
        SYNC_REF_SCAN_RST) );
  mux2X1_5 U6_mux2X1 ( .IN_0(SYNC_UART_RST), .IN_1(scan_rst), .SEL(n2), .OUT(
        SYNC_UART_SCAN_RST) );
  RST_SYNC_NUM_STAGES2_test_0 U0_RST_SYNC ( .RST(RSTN_SCAN_RST), .CLK(
        UART_SCAN_CLK), .SYNC_RST(SYNC_UART_RST), .test_si(n23), .test_so(n22), 
        .test_se(n33) );
  RST_SYNC_NUM_STAGES2_test_1 U1_RST_SYNC ( .RST(RSTN_SCAN_RST), .CLK(
        REF_SCAN_CLK), .SYNC_RST(SYNC_REF_RST), .test_si(n11), .test_so(SO[0]), 
        .test_se(n27) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8_test_1 U0_ref_sync ( .CLK(REF_SCAN_CLK), 
        .RST(n7), .unsync_bus(UART_RX_OUT), .bus_enable(UART_RX_V_OUT), 
        .sync_bus(UART_RX_SYNC), .enable_pulse(UART_RX_V_SYNC), .test_si(n12), 
        .test_se(n35) );
  FIFO_TOP_ADDR_WIDTH3_BUFFER_DEPTH8_BUFFER_WIDTH8_test_1 U0_UART_FIFO ( 
        .w_CLK(REF_SCAN_CLK), .r_CLK(UART_TX_SCAN_CLK), .w_RST(n7), .r_RST(n5), 
        .w_data(UART_TX_IN), .w_inc(UART_TX_VLD), .r_inc(UART_TX_Busy_PULSE), 
        .w_full(FIFO_FULL), .r_empty(UART_TX_V_SYNC), .r_data(UART_TX_SYNC), 
        .test_si2(SI[0]), .test_si1(n15), .test_so2(n12), .test_so1(n14), 
        .test_se(SE) );
  PULSE_GEN_test_1 U0_PULSE_GEN ( .clk(UART_TX_SCAN_CLK), .rst(n5), .lvl_sig(
        UART_TX_Busy), .pulse_sig(UART_TX_Busy_PULSE), .test_si(n24), 
        .test_so(n23), .test_se(n31) );
  clk_div_test_0 U0_ClkDiv ( .i_ref_clk(UART_SCAN_CLK), .i_rst_n(n5), 
        .i_clk_en(1'b1), .i_div_ratio(DIV_RATIO), .o_div_clk(UART_TX_CLK), 
        .test_si(ALU_OUT_VLD), .test_so(n24), .test_se(n31) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]})
         );
  clk_div_test_1 U1_ClkDiv ( .i_ref_clk(UART_SCAN_CLK), .i_rst_n(n5), 
        .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        DIV_RATIO_RX[3:0]}), .o_div_clk(UART_RX_CLK), .test_si(UART_RX_SYNC[7]), .test_so(n11), .test_se(n37) );
  UART_test_1 U0_UART ( .RST(n5), .TX_CLK(UART_TX_SCAN_CLK), .RX_CLK(
        UART_RX_SCAN_CLK), .RX_IN_S(UART_RX_IN), .RX_OUT_P(UART_RX_OUT), 
        .RX_OUT_V(UART_RX_V_OUT), .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n1), 
        .TX_OUT_S(SO[1]), .TX_OUT_V(UART_TX_Busy), .Prescale(UART_Config[7:2]), 
        .parity_enable(UART_Config[0]), .parity_type(UART_Config[1]), 
        .parity_error(parity_error), .framing_error(framing_error), .test_si2(
        n14), .test_si1(n16), .test_so1(n15), .test_se(n28) );
  SYS_CTRL_test_1 U0_SYS_CTRL ( .CLK(REF_SCAN_CLK), .RST(n7), .RX_DATA(
        UART_RX_SYNC), .RX_valid(UART_RX_V_SYNC), .FIFO_FULL(FIFO_FULL), 
        .FIFO_wr_inc(UART_TX_VLD), .FIFO_wr_data(UART_TX_IN), .Reg_wr_en(
        RF_WrEn), .Reg_ADDR(RF_Address), .Reg_wr_data(RF_WrData), .Reg_rd_en(
        RF_RdEn), .Reg_rd_data(RF_RdData), .Reg_data_valid(RF_RdData_VLD), 
        .ALU_out(ALU_OUT), .ALU_out_valid(ALU_OUT_VLD), .ALU_en(ALU_EN), 
        .ALU_FUN(ALU_FUN), .ALU_GATE_EN(CLKG_EN), .test_si2(SI[1]), .test_si1(
        n19), .test_so2(n16), .test_so1(SO[2]), .test_se(n29) );
  RegFile_test_1 U0_RegFile ( .CLK(REF_SCAN_CLK), .RST(n7), .WrEn(RF_WrEn), 
        .RdEn(RF_RdEn), .Address({RF_Address[3:2], n4, n3}), .WrData(RF_WrData), .RdData(RF_RdData), .RdData_VLD(RF_RdData_VLD), .REG0(Operand_A), .REG1(
        Operand_B), .REG2(UART_Config), .REG3(DIV_RATIO), .test_si2(SI[2]), 
        .test_si1(n22), .test_so2(n19), .test_so1(SO[3]), .test_se(SE) );
  ALU_test_1 U0_ALU ( .A(Operand_A), .B(Operand_B), .EN(ALU_EN), .ALU_FUN(
        ALU_FUN), .CLK(ALU_CLK), .RST(n7), .ALU_OUT(ALU_OUT), .OUT_VALID(
        ALU_OUT_VLD), .test_si(SI[3]), .test_se(n36) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(_1_net_), .CLK(REF_SCAN_CLK), .GATED_CLK(
        ALU_CLK) );
  BUFX2M U17 ( .A(n35), .Y(n29) );
  BUFX2M U20 ( .A(SO[1]), .Y(UART_TX_O) );
endmodule

