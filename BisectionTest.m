
a=input('"f=(x^a)+c" fonksiyonu için a deðiþkenini giriniz=  ');
c=input('"f=(x^a)+c" fonksiyonu için c deðiþkenini giriniz=  ');
xi=input('Köklerini bulmak istediðiniz alt sýnýr= ');
xf=input('Köklerini bulmak istediðiniz üst sýnýr= ');
k=0;

data=[];
x(1)=0;
errorBagil=1.0;
errorFark=1.0;

data(1,1)=x(1);
data(1,2)=errorBagil;
data(1,3)=errorFark;

for i=2:1:1000
     if(errorFark>=0.000001 && errorBagil>0.00001)
            
    dif=fonk(xi,a,c)*fonk(xf,a,c);
    
    xreel=(-c)^(1/a);
    if(dif<0)

        x(i)=(xi+xf)/2;
        fx=fonk(x(i),a,c);

        if(fx<0)
            xi=x(i);
        else
            xf=x(i);
        end

        errorBagil=abs(x(i)-xreel)/abs(xreel);
        errorFark=abs(x(i)-xreel);
        data(i,1)=x(i);
        data(i,2)=errorBagil;
        data(i,3)=errorFark;
    end
        
    else
        continue;
     end
       k=k+1;  
    end
   
