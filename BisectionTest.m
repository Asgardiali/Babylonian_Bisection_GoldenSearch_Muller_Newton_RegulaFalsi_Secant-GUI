
a=input('"f=(x^a)+c" fonksiyonu i�in a de�i�kenini giriniz=  ');
c=input('"f=(x^a)+c" fonksiyonu i�in c de�i�kenini giriniz=  ');
xi=input('K�klerini bulmak istedi�iniz alt s�n�r= ');
xf=input('K�klerini bulmak istedi�iniz �st s�n�r= ');
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
   
