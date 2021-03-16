
a=input('"f=(x^a)+c" fonksiyonu i�in a de�i�kenini giriniz=  ');
c=input('"f=(x^a)+c" fonksiyonu i�in c de�i�kenini giriniz=  ');
xi=input('K�klerini bulmak istedi�iniz alt s�n�r= ');
xf=input('K�klerini bulmak istedi�iniz �st s�n�r= ');

epsilon=0.000001;              
iter= 50;                       
tau=double((sqrt(5)-1)/2);    

k=1;
data=[];
data(1,1)=xi;
data(1,2)=xf;
data(1,3)=1;

x1=xi+(1-tau)*(xf-xi);             
x2=xi+tau*(xf-xi);
f_x1=f(x1);                     
f_x2=f(x2);

while ((abs(xf-xi)>epsilon) && (k<iter))
    k=k+1;
    
    if(f_x1<f_x2)
        
        xf=x2;
        x2=x1;
        x1=xi+(1-tau)*(xf-xi);
        
        f_x1=fonk(x1,a,c);
        f_x2=fonk(x2,a,c);
        
        data(k,1)=xi;
        data(k,2)=xf;
        data(k,3)=abs(xf-xi);
        
    else
        xi=x1;
        x1=x2;
        x2=xi+tau*(xf-xi);
        
        f_x1=fonk(x1,a,c);
        f_x2=fonk(x2,a,c);
        
        data(k,1)=xi;
        data(k,2)=xf;
        data(k,3)=abs(xf-xi);
        
    end
    
end
