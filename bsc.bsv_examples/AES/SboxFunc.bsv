import RegFile::*;

interface SboxRom;
   method Bit#(8) read( Bit#(8) addr );
endinterface

(* synthesize *)
module mkSboxRom ( SboxRom );
   RegFile#(Bit#(8),Bit#(8)) sbox   <- mkRegFileLoad("sbox.table", 0, 255);

   method Bit#(8) read( Bit#(8) addr ) =
      case (addr)
         0: return 8'h63;
         1: return 8'h7c;
         2: return 8'h77;
         3: return 8'h7b;
         4: return 8'hf2;
         5: return 8'h6b;
         6: return 8'h6f;
         7: return 8'hc5;
         8: return 8'h30;
         9: return 8'h01;
         10: return 8'h67;
         11: return 8'h2b;
         12: return 8'hfe;
         13: return 8'hd7;
         14: return 8'hab;
         15: return 8'h76;
         16: return 8'hca;
         17: return 8'h82;
         18: return 8'hc9;
         19: return 8'h7d;
         20: return 8'hfa;
         21: return 8'h59;
         22: return 8'h47;
         23: return 8'hf0;
         24: return 8'had;
         25: return 8'hd4;
         26: return 8'ha2;
         27: return 8'haf;
         28: return 8'h9c;
         29: return 8'ha4;
         30: return 8'h72;
         31: return 8'hc0;
         32: return 8'hb7;
         33: return 8'hfd;
         34: return 8'h93;
         35: return 8'h26;
         36: return 8'h36;
         37: return 8'h3f;
         38: return 8'hf7;
         39: return 8'hcc;
         40: return 8'h34;
         41: return 8'ha5;
         42: return 8'he5;
         43: return 8'hf1;
         44: return 8'h71;
         45: return 8'hd8;
         46: return 8'h31;
         47: return 8'h15;
         48: return 8'h04;
         49: return 8'hc7;
         50: return 8'h23;
         51: return 8'hc3;
         52: return 8'h18;
         53: return 8'h96;
         54: return 8'h05;
         55: return 8'h9a;
         56: return 8'h07;
         57: return 8'h12;
         58: return 8'h80;
         59: return 8'he2;
         60: return 8'heb;
         61: return 8'h27;
         62: return 8'hb2;
         63: return 8'h75;
         64: return 8'h09;
         65: return 8'h83;
         66: return 8'h2c;
         67: return 8'h1a;
         68: return 8'h1b;
         69: return 8'h6e;
         70: return 8'h5a;
         71: return 8'ha0;
         72: return 8'h52;
         73: return 8'h3b;
         74: return 8'hd6;
         75: return 8'hb3;
         76: return 8'h29;
         77: return 8'he3;
         78: return 8'h2f;
         79: return 8'h84;
         80: return 8'h53;
         81: return 8'hd1;
         82: return 8'h00;
         83: return 8'hed;
         84: return 8'h20;
         85: return 8'hfc;
         86: return 8'hb1;
         87: return 8'h5b;
         88: return 8'h6a;
         89: return 8'hcb;
         90: return 8'hbe;
         91: return 8'h39;
         92: return 8'h4a;
         93: return 8'h4c;
         94: return 8'h58;
         95: return 8'hcf;
         96: return 8'hd0;
         97: return 8'hef;
         98: return 8'haa;
         99: return 8'hfb;
         100: return 8'h43;
         101: return 8'h4d;
         102: return 8'h33;
         103: return 8'h85;
         104: return 8'h45;
         105: return 8'hf9;
         106: return 8'h02;
         107: return 8'h7f;
         108: return 8'h50;
         109: return 8'h3c;
         110: return 8'h9f;
         111: return 8'ha8;
         112: return 8'h51;
         113: return 8'ha3;
         114: return 8'h40;
         115: return 8'h8f;
         116: return 8'h92;
         117: return 8'h9d;
         118: return 8'h38;
         119: return 8'hf5;
         120: return 8'hbc;
         121: return 8'hb6;
         122: return 8'hda;
         123: return 8'h21;
         124: return 8'h10;
         125: return 8'hff;
         126: return 8'hf3;
         127: return 8'hd2;
         128: return 8'hcd;
         129: return 8'h0c;
         130: return 8'h13;
         131: return 8'hec;
         132: return 8'h5f;
         133: return 8'h97;
         134: return 8'h44;
         135: return 8'h17;
         136: return 8'hc4;
         137: return 8'ha7;
         138: return 8'h7e;
         139: return 8'h3d;
         140: return 8'h64;
         141: return 8'h5d;
         142: return 8'h19;
         143: return 8'h73;
         144: return 8'h60;
         145: return 8'h81;
         146: return 8'h4f;
         147: return 8'hdc;
         148: return 8'h22;
         149: return 8'h2a;
         150: return 8'h90;
         151: return 8'h88;
         152: return 8'h46;
         153: return 8'hee;
         154: return 8'hb8;
         155: return 8'h14;
         156: return 8'hde;
         157: return 8'h5e;
         158: return 8'h0b;
         159: return 8'hdb;
         160: return 8'he0;
         161: return 8'h32;
         162: return 8'h3a;
         163: return 8'h0a;
         164: return 8'h49;
         165: return 8'h06;
         166: return 8'h24;
         167: return 8'h5c;
         168: return 8'hc2;
         169: return 8'hd3;
         170: return 8'hac;
         171: return 8'h62;
         172: return 8'h91;
         173: return 8'h95;
         174: return 8'he4;
         175: return 8'h79;
         176: return 8'he7;
         177: return 8'hc8;
         178: return 8'h37;
         179: return 8'h6d;
         180: return 8'h8d;
         181: return 8'hd5;
         182: return 8'h4e;
         183: return 8'ha9;
         184: return 8'h6c;
         185: return 8'h56;
         186: return 8'hf4;
         187: return 8'hea;
         188: return 8'h65;
         189: return 8'h7a;
         190: return 8'hae;
         191: return 8'h08;
         192: return 8'hba;
         193: return 8'h78;
         194: return 8'h25;
         195: return 8'h2e;
         196: return 8'h1c;
         197: return 8'ha6;
         198: return 8'hb4;
         199: return 8'hc6;
         200: return 8'he8;
         201: return 8'hdd;
         202: return 8'h74;
         203: return 8'h1f;
         204: return 8'h4b;
         205: return 8'hbd;
         206: return 8'h8b;
         207: return 8'h8a;
         208: return 8'h70;
         209: return 8'h3e;
         210: return 8'hb5;
         211: return 8'h66;
         212: return 8'h48;
         213: return 8'h03;
         214: return 8'hf6;
         215: return 8'h0e;
         216: return 8'h61;
         217: return 8'h35;
         218: return 8'h57;
         219: return 8'hb9;
         220: return 8'h86;
         221: return 8'hc1;
         222: return 8'h1d;
         223: return 8'h9e;
         224: return 8'he1;
         225: return 8'hf8;
         226: return 8'h98;
         227: return 8'h11;
         228: return 8'h69;
         229: return 8'hd9;
         230: return 8'h8e;
         231: return 8'h94;
         232: return 8'h9b;
         233: return 8'h1e;
         234: return 8'h87;
         235: return 8'he9;
         236: return 8'hce;
         237: return 8'h55;
         238: return 8'h28;
         239: return 8'hdf;
         240: return 8'h8c;
         241: return 8'ha1;
         242: return 8'h89;
         243: return 8'h0d;
         244: return 8'hbf;
         245: return 8'he6;
         246: return 8'h42;
         247: return 8'h68;
         248: return 8'h41;
         249: return 8'h99;
         250: return 8'h2d;
         251: return 8'h0f;
         252: return 8'hb0;
         253: return 8'h54;
         254: return 8'hbb;
         255: return 8'h16;
      endcase;

endmodule


