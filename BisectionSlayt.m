f=inline('x.^2-55')
a=0;
b=100;
kmax=10;
tol=0.00001;
ya=f(a);
yb=f(b);
if sign(ya)==sign(yb)
    error('function has same sign at end points');
end
disp('     step          a       b       m         ym        bound')
for k=1:kmax
   m=(a+b)/2;
   ym=f(m);
   iter=k;
   bound=(b-a)/2;
   out=[iter,a,b,m,ym,bound];
   disp(out)
   if sign(ym)==sign(ya)
      b=m;
      yb=ym;
   else
      a=m;
      ya=ym;
   end        
   if(iter>=kmax)
      disp('zero not found to desired tolerance')
   end
end
