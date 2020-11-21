// Write code for modules you need here
module fulladd(input wire a, b, cin, output wire sum, cout); 
    wire t0,t1,t2,t3; 
    xor2 x0(a,b,t0); 
    xor2 x1(t0,cin,sum); 
    and2 x2(a,b,t1); 
    and2 x3(b,cin,t2); 
    and2 x4(cin,a,t3); 
    or3 x5(t1,t2,t3,cout);
endmodule

module addsub(input wire a,b,id,cin,output wire cout,output wire sd);
   wire c;     
   xor2 xx(id,b,c);     
   fulladd f0(a,c,cin,sd,cout);
    
endmodule

module pc_slice0(input wire os,inc,sub,cin,load,clk,reset,output wire cout,po);
    wire o1,a1;
    or2 or0(os,inc,o1);     
    addsub as0(po,o1,sub,cin,cout,a1);     
    dfrl d0(clk,reset,load,a1,po);
endmodule

module pc_slice(input wire os,inc,sub,cin,load,clk,reset,output wire cout,p1);
    wire a,no,a2;
    invert ivn(inc,no); 
    and2 and1(os,no,a);
    addsub f1(p1,a,sub,cin,cout,a2); 
    dfrl d1(clk,reset,load,a2,p1);
endmodule

module pc (input wire clk, reset, inc, add, sub, input wire [15:0] offset, output wire [15:0] pc);
    or3 o3(inc,add,sub,load); 
    pc_slice0 pcslice0(offset[0],inc,sub,sub,load,clk,reset,p[0],pc[0]); 
    pc_slice pcslice1(offset[1],inc,sub,p[0],load,clk,reset,p[1],pc[1]); 
    pc_slice pcslice2(offset[2],inc,sub,p[1],load,clk,reset,p[2],pc[2]); 
    pc_slice pcslice3(offset[3],inc,sub,p[2],load,clk,reset,p[3],pc[3]); 
    pc_slice pcslice4(offset[4],inc,sub,p[3],load,clk,reset,p[4],pc[4]); 
    pc_slice pcslice5(offset[5],inc,sub,p[4],load,clk,reset,p[5],pc[5]); 
    pc_slice pcslice6(offset[6],inc,sub,p[5],load,clk,reset,p[6],pc[6]); 
    pc_slice pcslice7(offset[7],inc,sub,p[6],load,clk,reset,p[7],pc[7]); 
    pc_slice pcslice8(offset[8],inc,sub,p[7],load,clk,reset,p[8],pc[8]); 
    pc_slice pcslice9(offset[9],inc,sub,p[8],load,clk,reset,p[9],pc[9]); 
    pc_slice pcslice10(offset[10],inc,sub,p[9],load,clk,reset,p[10],pc[10]);
    pc_slice pcslice11(offset[11],inc,sub,p[10],load,clk,reset,p[11],pc[11]); 
    pc_slice pcslice12(offset[12],inc,sub,p[11],load,clk,reset,p[12],pc[12]); 
    pc_slice pcslice13(offset[13],inc,sub,p[12],load,clk,reset,p[13],pc[13]); 
    pc_slice pcslice14(offset[14],inc,sub,p[13],load,clk,reset,p[14],pc[14]); 
    pc_slice pcslice15(offset[15],inc,sub,p[14],load,clk,reset,p[15],pc[15]);
endmodule
