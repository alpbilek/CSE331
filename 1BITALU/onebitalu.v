module onebitalu(ai,bi,lessi,ci,aluop0,aluop1,aluop2,cinext,ri);
input ai,bi,lessi,ci,aluop0,aluop1,aluop2;
output cinext,ri;
wire t1,t2temp0,temp1,temp2,temp3,temp4,temp5;
myxor(.x1(bi),.x2(aluop2),.f(t1));
and(temp0,t1,ai);
or(temp1,t1,ai);
and(t2,~temp0,temp1);
and(temp2,t2,ci);
or(temp3,t2,ci);
and(temp4,~temp2,temp3);
or(cinext,temp0,temp2);

wire n0,n1,n2,n3;
wire tem0,tem1,tem2,tem3;

and(tem0,~aluop0,~aluop1);
and(tem1,~aluop0,aluop1);
and(tem2,aluop0,~aluop1);
and(tem3,aluop0,aluop1);

and(n0,temp0,tem0);
and(n1,temp1,tem1);
and(n2,temp2,tem2);
and(n3,temp3,tem3);
or(ri,n0,n1,n2,n3);



endmodule