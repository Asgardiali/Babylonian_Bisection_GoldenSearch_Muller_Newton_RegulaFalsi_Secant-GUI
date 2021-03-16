a=input('a= ');
c=input('c= ');

x1=input('x1= ');
x2=input('x2= ');

xi=input('xi= ');
xf=input('xf= ');

epsilon=0.000001;
errorBagil=1;

str="x^"+a+c;
xreel=fzero(str,[xi, xf]);

data=[];
x(1)=x1;
x(2)=x2;

data(1,1)=x(1);
data(2,1)=x(2);

data(1,2)=abs(xreel-x(1))/abs(xreel);
data(2,2)=abs(xreel-x(2))/abs(xreel);

data(1,3)=0;
data(2,3)=abs(data(1,1)-data(2,1));
tolerans=data(2,1)-data(1,1);

for i=2:1:10
    
    if(tolerans>epsilon)
    
        x(i+1)=x(i)-(((fonk(x(i),a,c)*(x(i)-x(i-1))))/(fonk(x(i),a,c)-fonk(x(i-1),a,c)));
        data(i+1,1)=x(i+1);
        data(i+1,2)=abs(xreel-x(i+1))/abs(xreel);
        data(i+1,3)=abs(x(i)-x(i+1));
    else
        continue;
    end
    
    tolerans=data(i,1)-data(i-1,1);
    
end