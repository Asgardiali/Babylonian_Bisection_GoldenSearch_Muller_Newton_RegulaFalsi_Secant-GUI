clear all
clc

a=input('a= ');
c=input('c= ');
xi=input('xi= ');
xf=input('xf= ');

str="x^"+a+c;
xmreel=fzero(str,[xi, xf]);
data=[];
errorFark=1;
errorBagil=1;
epsilon=0.000001;
xm=10;
xmold=1;
iter=1000;
data(1,1)=xmold;
data(1,2)=errorBagil;
data(1,3)=errorFark;

i=1;

while((abs(xf-xi)>epsilon) && (i<iter))
    
    if(fonk(xi,a,c)*fonk(xf,a,c)<0)
   
        xm=((xi*fonk(xf,a,c))-(xf*fonk(xi,a,c)))/(fonk(xf,a,c)-fonk(xi,a,c));
                
        if(fonk(xm,a,c)<0)            
            xi=xm;
        else
            xf=xm;
        end
        
        data(i,1)=xm;
        data(i,2)=abs(xmreel-xm)/abs(xmreel);
        data(i,3)=abs(xm-xmold);
    else
    
        f = msgbox({'Regule Falsi Metodu';'Girilen aralýk deðerinde denklemin reel kökü yoktur.';'Lütfen baþka bir aralýk deðeri giriniz!!!'});
   
    end
    i=i+1;

end