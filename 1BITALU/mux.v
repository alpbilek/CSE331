module hw1(i0,i1,i2,i3,s0,s1,z);
input i0,i1,i2,i3,s0,s1;
output z;
wire n0,n1,n2,n3;
wire tem0,tem1,tem2,tem3;

and(tem0,~s0,~s1);
and(tem1,~s0,s1);
and(tem2,s0,~s1);
and(tem3,s0,s1);

and(n0,i0,tem0);
and(n1,i1,tem1);
and(n2,i2,tem2);
and(n3,i3,tem3);
or(z,n0,n1,n2,n3);



endmodule