a=input('a= ');
c=input('c= ');
xold=input('x0= ');
%0 olunca hata verecek
data=[];
data(1,1)=xold;
xreel=(-c)^(1/a);
tolerans=0.000001;
errorBagil=1;
errorFark=1;

for i=1:1:1000
    
    if(errorFark>tolerans && errorBagil>0.00001)
        xnew=xold-((fonk(xold,a,c))/(dfonk(xold,a)));
        data(1,i)=xnew;
        errorFark=abs(xold-xnew);
        errorBagil=abs(xreel-xnew)/abs(xreel);
        xold=xnew;
    else   
        continue;
    end
    
    
end
