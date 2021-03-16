a=input('a= ');
c=input('c= ');
syms z;

f(z)=z.^a+c;

[x,y]=Muller(f,1,2,0.00001,1000)

data=[];
say=max(size(x));

for k=1:say
    data(k,1)=k;
    data(k,2)=x(k);
    data(k,3)=y(k);
end