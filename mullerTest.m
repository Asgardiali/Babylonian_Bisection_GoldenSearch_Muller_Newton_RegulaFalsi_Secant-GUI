a=input('a= ');
c=input('c= ');

x1=input('X1= ');
x2=input('X2= ');

kmax=1000;
tolerans=0.000001;

x(1)=x1;
x(2)=x2;
x(3)=(x1+x2)/2;

y(1)=fonk(x(1),a,c);
y(2)=fonk(x(2),a,c);
y(3)=fonk(x(3),a,c);

b(1)=(y(2)-y(1))/(x(2)-x(1));

for k=3:1:kmax
    
    b(k-1)=(y(k)-y(k-1))/(x(k)-x(k-1));
    d(k-2)=(b(k-1)-b(k-2))/(x(k)-x(k-2));
    s=b(k-1)+(x(k)-x(k-1))*d(k-2);
    x(k+1)=x(k)-(2*y(k))/(s+sign(s)*sqrt((s^2)-(4*y(k))*d(k-2)));
    y(k+1)=fonk(x(k+1),a,c);
    if(abs(x(k+1)-x(k))<tolerans)
        break;
    end
    iter=k;
    
    
end

