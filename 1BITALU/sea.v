module myxor(x1,x2,f);
input x1,x2;
output f;
wire n1,n2;
and(n1,x1,~x2);
and(n2,x2,~x1);
or(f,n1,n2);


endmodule