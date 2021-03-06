module turnmon_mem(
  input clk,
  input [ADDR_WIDTH-1:0] addr,
  input rd,
  output reg [DATA_WIDTH-1:0] data_out
);
  parameter integer ADDR_WIDTH = 8;
  parameter integer DATA_WIDTH = 8;

  reg [DATA_WIDTH-1:0] ram[0:(2 ** ADDR_WIDTH)-1];


  initial
    begin
      ram[0] = 8'h3e; ram[1] = 8'h03; ram[2] = 8'hd3; ram[3] = 8'h10;  
      ram[4] = 8'h3e; ram[5] = 8'h11; ram[6] = 8'hd3; ram[7] = 8'h10;  
      ram[8] = 8'h31; ram[9] = 8'h00; ram[10] = 8'hfc; ram[11] = 8'hcd;  
      ram[12] = 8'h9d; ram[13] = 8'hfd; ram[14] = 8'h3e; ram[15] = 8'h2e;  
      ram[16] = 8'hcd; ram[17] = 8'hf2; ram[18] = 8'hfd; ram[19] = 8'hcd;  
      ram[20] = 8'he8; ram[21] = 8'hfd; ram[22] = 8'hfe; ram[23] = 8'h4d;  
      ram[24] = 8'hca; ram[25] = 8'h29; ram[26] = 8'hfd; ram[27] = 8'hfe;  
      ram[28] = 8'h44; ram[29] = 8'hcc; ram[30] = 8'h4f; ram[31] = 8'hfd;  
      ram[32] = 8'hfe; ram[33] = 8'h4a; ram[34] = 8'hc2; ram[35] = 8'h08;  
      ram[36] = 8'hfd; ram[37] = 8'hcd; ram[38] = 8'ha7; ram[39] = 8'hfd;  
      ram[40] = 8'he9; ram[41] = 8'hcd; ram[42] = 8'ha7; ram[43] = 8'hfd;  
      ram[44] = 8'h3e; ram[45] = 8'h23; ram[46] = 8'hcd; ram[47] = 8'h9d;  
      ram[48] = 8'hfd; ram[49] = 8'h54; ram[50] = 8'h5d; ram[51] = 8'hcd;  
      ram[52] = 8'hc9; ram[53] = 8'hfd; ram[54] = 8'h1a; ram[55] = 8'h67;  
      ram[56] = 8'hcd; ram[57] = 8'hcf; ram[58] = 8'hfd; ram[59] = 8'hcd;  
      ram[60] = 8'ha8; ram[61] = 8'hfd; ram[62] = 8'heb; ram[63] = 8'hda;  
      ram[64] = 8'h2d; ram[65] = 8'hfd; ram[66] = 8'h77; ram[67] = 8'hbe;  
      ram[68] = 8'hca; ram[69] = 8'h2d; ram[70] = 8'hfd; ram[71] = 8'h3e;  
      ram[72] = 8'h3f; ram[73] = 8'hcd; ram[74] = 8'hf2; ram[75] = 8'hfd;  
      ram[76] = 8'hc3; ram[77] = 8'h08; ram[78] = 8'hfd; ram[79] = 8'hcd;  
      ram[80] = 8'ha7; ram[81] = 8'hfd; ram[82] = 8'heb; ram[83] = 8'hd4;  
      ram[84] = 8'he3; ram[85] = 8'hfd; ram[86] = 8'hcd; ram[87] = 8'ha7;  
      ram[88] = 8'hfd; ram[89] = 8'h3e; ram[90] = 8'h0d; ram[91] = 8'h06;  
      ram[92] = 8'h3c; ram[93] = 8'hcd; ram[94] = 8'hf2; ram[95] = 8'hfd;  
      ram[96] = 8'h05; ram[97] = 8'hc2; ram[98] = 8'h5d; ram[99] = 8'hfd;  
      ram[100] = 8'hb8; ram[101] = 8'h78; ram[102] = 8'hc2; ram[103] = 8'h5b;  
      ram[104] = 8'hfd; ram[105] = 8'h7d; ram[106] = 8'h93; ram[107] = 8'h6f;  
      ram[108] = 8'h7c; ram[109] = 8'h9a; ram[110] = 8'h67; ram[111] = 8'h23;  
      ram[112] = 8'h05; ram[113] = 8'h7c; ram[114] = 8'hb7; ram[115] = 8'hc2;  
      ram[116] = 8'h77; ram[117] = 8'hfd; ram[118] = 8'h45; ram[119] = 8'h3e;  
      ram[120] = 8'h3c; ram[121] = 8'hcd; ram[122] = 8'hf2; ram[123] = 8'hfd;  
      ram[124] = 8'h78; ram[125] = 8'hcd; ram[126] = 8'hf2; ram[127] = 8'hfd;  
      ram[128] = 8'h0e; ram[129] = 8'h00; ram[130] = 8'h7b; ram[131] = 8'hcd;  
      ram[132] = 8'hf2; ram[133] = 8'hfd; ram[134] = 8'h7a; ram[135] = 8'hcd;  
      ram[136] = 8'hf2; ram[137] = 8'hfd; ram[138] = 8'h1a; ram[139] = 8'hcd;  
      ram[140] = 8'hf2; ram[141] = 8'hfd; ram[142] = 8'h13; ram[143] = 8'h2b;  
      ram[144] = 8'h05; ram[145] = 8'hc2; ram[146] = 8'h8a; ram[147] = 8'hfd;  
      ram[148] = 8'h79; ram[149] = 8'hcd; ram[150] = 8'hf2; ram[151] = 8'hfd;  
      ram[152] = 8'h7c; ram[153] = 8'hb5; ram[154] = 8'hc2; ram[155] = 8'h70;  
      ram[156] = 8'hfd; ram[157] = 8'h3e; ram[158] = 8'h0d; ram[159] = 8'hcd;  
      ram[160] = 8'hf2; ram[161] = 8'hfd; ram[162] = 8'h3e; ram[163] = 8'h0a;  
      ram[164] = 8'hc3; ram[165] = 8'hf2; ram[166] = 8'hfd; ram[167] = 8'h06;  
      ram[168] = 8'h06; ram[169] = 8'h03; ram[170] = 8'h21; ram[171] = 8'h00;  
      ram[172] = 8'h00; ram[173] = 8'hcd; ram[174] = 8'he8; ram[175] = 8'hfd;  
      ram[176] = 8'h4f; ram[177] = 8'hfe; ram[178] = 8'h20; ram[179] = 8'h37;  
      ram[180] = 8'hc8; ram[181] = 8'he6; ram[182] = 8'hb8; ram[183] = 8'hee;  
      ram[184] = 8'h30; ram[185] = 8'hc2; ram[186] = 8'h47; ram[187] = 8'hfd;  
      ram[188] = 8'h79; ram[189] = 8'he6; ram[190] = 8'h07; ram[191] = 8'h29;  
      ram[192] = 8'h29; ram[193] = 8'h29; ram[194] = 8'h85; ram[195] = 8'h6f;  
      ram[196] = 8'h05; ram[197] = 8'hc2; ram[198] = 8'had; ram[199] = 8'hfd;  
      ram[200] = 8'hc9; ram[201] = 8'h06; ram[202] = 8'h06; ram[203] = 8'haf;  
      ram[204] = 8'hc3; ram[205] = 8'hd6; ram[206] = 8'hfd; ram[207] = 8'h06;  
      ram[208] = 8'h03; ram[209] = 8'he6; ram[210] = 8'h29; ram[211] = 8'h17;  
      ram[212] = 8'h29; ram[213] = 8'h17; ram[214] = 8'h29; ram[215] = 8'h17;  
      ram[216] = 8'he6; ram[217] = 8'h07; ram[218] = 8'hf6; ram[219] = 8'h30;  
      ram[220] = 8'hcd; ram[221] = 8'hf2; ram[222] = 8'hfd; ram[223] = 8'h05;  
      ram[224] = 8'hc2; ram[225] = 8'hd2; ram[226] = 8'hfd; ram[227] = 8'h3e;  
      ram[228] = 8'h20; ram[229] = 8'hc3; ram[230] = 8'hf2; ram[231] = 8'hfd;  
      ram[232] = 8'hdb; ram[233] = 8'h10; ram[234] = 8'h0f; ram[235] = 8'hd2;  
      ram[236] = 8'he8; ram[237] = 8'hfd; ram[238] = 8'hdb; ram[239] = 8'h11;  
      ram[240] = 8'he6; ram[241] = 8'h7f; ram[242] = 8'hf5; ram[243] = 8'h81;  
      ram[244] = 8'h4f; ram[245] = 8'hdb; ram[246] = 8'h10; ram[247] = 8'h0f;  
      ram[248] = 8'h0f; ram[249] = 8'hd2; ram[250] = 8'hf5; ram[251] = 8'hfd;  
      ram[252] = 8'hf1; ram[253] = 8'hd3; ram[254] = 8'h11; ram[255] = 8'hc9;   
    end

  always @(posedge clk)
    begin
      if (rd)
        data_out <= ram[addr];
    end
endmodule
