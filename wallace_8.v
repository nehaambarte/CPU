`timescale 1ns / 1ps

// Half adder 
module halfadder(input a,b, 
                output sum,cout);
assign sum = a^b;
assign cout = a&b;                
                
endmodule 


// full adder 
module full_add(
input a,b,cin,
output sum,cout);
assign sum = a^b^cin;
assign cout = a&b | a&cin | b&cin;
endmodule 


// 8- bit wallace tree multiplier 

module wallace_8(input [7:0] a1, b1, output [15:0] result
    );
    
    /*
    
    //intermediate wires 
    wire [7:0]p0,p1,p2,p3,p4,p5,p6,p7;
    wire [9:0]s;
    wire [8:1]cr;
    wire q0,q1,q2,q3,q4,q5,q6,q7,q8,q9;
    wire a1,a2,a3,a4,a5,a6,a7,a8;
    wire m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12;
    wire r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
    wire n0,n1,n2,n3,n4,n5,n6,n7,n8,n9;
    wire x1,x2,x3,x4,x5,x6,x7,x8;
    wire d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,s13,d14;
    wire e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11;
    wire f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14;
    wire t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11;
    wire [7:0]o0,o1,o2,o3,o4,o5,o6,o7;
    
    // partial product generation 
     assign o0[7:0] =  {8{h[0]}};
	 assign o1[7:0] =  {8{h[1]}};
	 assign o2[7:0] =  {8{h[2]}};
	 assign o3[7:0] =  {8{h[3]}};
	 assign o4[7:0] =  {8{h[4]}};
	 assign o5[7:0] =  {8{h[5]}};
	 assign o6[7:0] =  {8{h[6]}};
	 assign o7[7:0] =  {8{h[7]}};
	 
	 // Partial product p0-p7 will be generated here 
	  assign p0=a1&o0;   
      assign p1=a1&o1;   
      assign p2=a1&o2;   
      assign p3=a1&o3;   
      assign p4=a1&o4;   
      assign p5=a1&o5;   
      assign p6=a1&o6;   
      assign p7=a1&o7;   
                    
                    
      // for level 1 
      assign P[0] = p0[0];
	half_add a1241(p0[1], p1[0], s[1], cr[1]);
    full_add A2(p0[2], p1[1], p2[0], s[2], cr[2]);
    full_add A3(p0[3], p1[2], p2[1], s[3], cr[3]);
    full_add A4(p0[4], p1[3], p2[2], s[4], cr[4]);	
    half_add A5(p3[1], p4[0], s[10], cr[10]);
    full_add A6(p0[5], p1[4], p2[3], s[5], cr[5]);
    full_add A7(p3[2], p4[1], p5[0], s[11], cr[11]);
    full_add A8(p0[6], p1[5], p2[4], s[6], cr[6]);
    full_add A9(p3[3], p4[2], p5[1], s[12], cr[12]);
    full_add A10(p0[7], p1[6], p2[5], s[7], cr[7]);
    full_add A11(p3[4], p4[3], p5[2], s[13], cr[13]);
    half_add A12(p1[7], p2[6], s[8], cr[8]);
    full_add A13(p3[5], p4[4], p5[3], s[14], cr[14]);
    full_add A14(p2[7], p3[6], p4[5], s[9], cr[9]);
    full_add A15(p3[7], p4[6], p5[5], s[15], cr[15]);
    half_add A16(p4[7], p5[6], s[16], cr[16]);	
	
	assign P[1] = s[1];
	half_add a17(s[2], cr[1], s[17], cr[17]);
	full_add a18(s[3], cr[2], p3[0], s[18], cr[18]);
	full_add a19(s[4], cr[3], s[10], s[19], cr[19]);		
	full_add a20(s[5], cr[4], s[11], s[20], cr[20]);
	full_add a21(s[6], cr[5], s[12], s[21], cr[21]);  	
	full_add a22(s[7], cr[6], s[13], s[22], cr[22]);
	full_add a23(s[8], cr[7], s[14], s[23], cr[23]);
	full_add a24(s[9], cr[8], cr[14], s[24], cr[24]);
	full_add a25(cr[9], p6[4], p7[3], s[29], cr[29]);		
	full_add a26(cr[15], p6[5], p7[4], s[30], cr[30]);
	full_add a27(p5[7], p6[6], p7[5], s[31], cr[31]);
	half_add a28(p6[7], p7[6], s[32], cr[32]);
	half_add a29(p6[0], cr[11], s[25], cr[25]);
	full_add a30(cr[12], p6[1], p7[0], s[26], cr[26]);
	full_add a31(cr[13], p6[2], p7[1], s[27], cr[27]);
	full_add a32(p5[4], p6[3], p7[2], s[28], cr[28]);
	
	
	
	assign P[2] = s[17];
	half_add a33(s[18], cr[17], s[33], cr[33]);
	half_add a34(s[19], cr[18], s[34], cr[34]);
	full_add a35(s[20], cr[19], cr[10], s[35], cr[35]);
	full_add a36(s[21], cr[20], s[25], s[36], cr[36]);
	full_add a37(s[22], cr[21], s[26], s[37], cr[37]);
	full_add a38(s[23], cr[22], s[27], s[38], cr[38]);
	full_add a39(s[24], cr[23], s[28], s[39], cr[39]);
	full_add a40(s[15], cr[24], s[29], s[40], cr[40]);
	half_add a41(s[16], s[30], s[41], cr[41]);
	half_add a42(cr[16], s[31], s[42], cr[42]);
	
	assign P[3] = s[33];
	half_add a43(s[34], cr[33], s[43], cr[43]);
	half_add a44(s[35], cr[34], s[44], cr[44]);
	half_add a45(s[36], cr[35], s[45], cr[45]);
	full_add a46(s[37], cr[36], cr[25], s[46], cr[46]);
	full_add a47(s[38], cr[37], cr[26], s[47], cr[47]);	
	full_add a48(s[39], cr[38], cr[27], s[48], cr[48]);
	full_add a49(s[40], cr[39], cr[28], s[49], cr[49]);	
	full_add a50(s[41], cr[40], cr[29], s[50], cr[50]);	
	full_add a51(s[42], cr[30], cr[41], s[51], cr[51]);	
	full_add a52(cr[42], s[32], cr[31], s[52], cr[52]);	
	half_add a53(p7[7], cr[32], s[53], cr[53]);
	
	assign P[4] = s[43];
	half_add a54(s[44], cr[43], P[5], cr[54]);
	full_add a55(s[45], cr[44], cr[54], P[6], cr[55]);	
	full_add a56(s[46], cr[45], cr[55], P[7], cr[56]);
	full_add a57(s[47], cr[46], cr[56], P[8], cr[57]);
	full_add a58(s[48], cr[47], cr[57], P[9], cr[58]);
	full_add a59(s[49], cr[48], cr[58], P[10], cr[59]);
	full_add a60(s[50], cr[49], cr[59], P[11], cr[60]);
	full_add a61(s[51], cr[50], cr[60], P[12], cr[61]);
	full_add a62(s[52], cr[51], cr[61], P[13], cr[62]);
	full_add a63(s[53], cr[52], cr[62], P[14], cr[63]);
	assign P[15] = cr[53];
	
	
	 
endmodule

*/


	 wire [7:0] p0,p1,p2,p3,p4,p5,p6,p7;
	 wire [7:0] r1, r2, r3, r4, r5, r6, r7, r8;
	 wire [64:0] cr;
	 wire [53:0] s;
	 
	 

	 assign r1[7:0] =  {8{b1[0]}};
	 assign r2[7:0] =  {8{b1[1]}};
	 assign r3[7:0] =  {8{b1[2]}};
	 assign r4[7:0] =  {8{b1[3]}};
	 assign r5[7:0] =  {8{b1[4]}};
	 assign r6[7:0] =  {8{b1[5]}};
	 assign r7[7:0] =  {8{b1[6]}};
	 assign r8[7:0] =  {8{b1[7]}};
	 
	 assign p0=a1&r1;
	 assign p1=a1&r2;
	 assign p2=a1&r3;
	 assign p3=a1&r4;
	 assign p4=a1&r5;
	 assign p5=a1&r6;
	 assign p6=a1&r7;
	 assign p7=a1&r8;
	
	assign result[0] = p0[0];
	halfadder a1241(p0[1], p1[0], s[1], cr[1]);
	full_add a2(p0[2], p1[1], p2[0], s[2], cr[2]);
	full_add a3(p0[3], p1[2], p2[1], s[3], cr[3]);
	full_add a4(p0[4], p1[3], p2[2], s[4], cr[4]);	
	halfadder a5(p3[1], p4[0], s[10], cr[10]);
	full_add a6(p0[5], p1[4], p2[3], s[5], cr[5]);
	full_add a7(p3[2], p4[1], p5[0], s[11], cr[11]);
	full_add a8(p0[6], p1[5], p2[4], s[6], cr[6]);
	full_add a9(p3[3], p4[2], p5[1], s[12], cr[12]);
	full_add a10(p0[7], p1[6], p2[5], s[7], cr[7]);
	full_add a11(p3[4], p4[3], p5[2], s[13], cr[13]);
	halfadder a12(p1[7], p2[6], s[8], cr[8]);
	full_add a13(p3[5], p4[4], p5[3], s[14], cr[14]);
	full_add a14(p2[7], p3[6], p4[5], s[9], cr[9]);
	full_add a15(p3[7], p4[6], p5[5], s[15], cr[15]);
	halfadder a16(p4[7], p5[6], s[16], cr[16]);	

	assign result[1] = s[1];
	halfadder a17(s[2], cr[1], s[17], cr[17]);
	full_add a18(s[3], cr[2], p3[0], s[18], cr[18]);
	full_add a19(s[4], cr[3], s[10], s[19], cr[19]);		
	full_add a20(s[5], cr[4], s[11], s[20], cr[20]);
	full_add a21(s[6], cr[5], s[12], s[21], cr[21]);  	
	full_add a22(s[7], cr[6], s[13], s[22], cr[22]);
	full_add a23(s[8], cr[7], s[14], s[23], cr[23]);
	full_add a24(s[9], cr[8], cr[14], s[24], cr[24]);
	full_add a25(cr[9], p6[4], p7[3], s[29], cr[29]);		
	full_add a26(cr[15], p6[5], p7[4], s[30], cr[30]);
	full_add a27(p5[7], p6[6], p7[5], s[31], cr[31]);
	halfadder a28(p6[7], p7[6], s[32], cr[32]);
	halfadder a29(p6[0], cr[11], s[25], cr[25]);
	full_add a30(cr[12], p6[1], p7[0], s[26], cr[26]);
	full_add a31(cr[13], p6[2], p7[1], s[27], cr[27]);
	full_add a32(p5[4], p6[3], p7[2], s[28], cr[28]);

	assign result[2] = s[17];
	halfadder a33(s[18], cr[17], s[33], cr[33]);
	halfadder a34(s[19], cr[18], s[34], cr[34]);
	full_add a35(s[20], cr[19], cr[10], s[35], cr[35]);
	full_add a36(s[21], cr[20], s[25], s[36], cr[36]);
	full_add a37(s[22], cr[21], s[26], s[37], cr[37]);
	full_add a38(s[23], cr[22], s[27], s[38], cr[38]);
	full_add a39(s[24], cr[23], s[28], s[39], cr[39]);
	full_add a40(s[15], cr[24], s[29], s[40], cr[40]);
	halfadder a41(s[16], s[30], s[41], cr[41]);
	halfadder a42(cr[16], s[31], s[42], cr[42]);
	
	assign result[3] = s[33];
	halfadder a43(s[34], cr[33], s[43], cr[43]);
	halfadder a44(s[35], cr[34], s[44], cr[44]);
	halfadder a45(s[36], cr[35], s[45], cr[45]);
	full_add a46(s[37], cr[36], cr[25], s[46], cr[46]);
	full_add a47(s[38], cr[37], cr[26], s[47], cr[47]);	
	full_add a48(s[39], cr[38], cr[27], s[48], cr[48]);
	full_add a49(s[40], cr[39], cr[28], s[49], cr[49]);	
	full_add a50(s[41], cr[40], cr[29], s[50], cr[50]);	
	full_add a51(s[42], cr[30], cr[41], s[51], cr[51]);	
	full_add a52(cr[42], s[32], cr[31], s[52], cr[52]);	
	halfadder a53(p7[7], cr[32], s[53], cr[53]);
	
	assign result[4] = s[43];
	halfadder a54(s[44], cr[43], result[5], cr[54]);
	full_add a55(s[45], cr[44], cr[54], result[6], cr[55]);	
	full_add a56(s[46], cr[45], cr[55], result[7], cr[56]);
	full_add a57(s[47], cr[46], cr[56], result[8], cr[57]);
	full_add a58(s[48], cr[47], cr[57], result[9], cr[58]);
	full_add a59(s[49], cr[48], cr[58], result[10], cr[59]);
	full_add a60(s[50], cr[49], cr[59], result[11], cr[60]);
	full_add a61(s[51], cr[50], cr[60], result[12], cr[61]);
	full_add a62(s[52], cr[51], cr[61], result[13], cr[62]);
	full_add a63(s[53], cr[52], cr[62], result[14], cr[63]);
	assign result[15] = cr[53];
      
	 
endmodule
