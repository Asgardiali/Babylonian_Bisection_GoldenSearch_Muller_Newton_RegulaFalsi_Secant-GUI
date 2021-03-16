
clear all;
error=1;
a=input('a deðiþkenini giriniz=  ');
c=input('c deðiþkenini giriniz=  ');
data=[];

if(c<0 && a==2)
    
    x0=(-c)^(1/a);
    ustSinir=ceil(x0);
    altSinir=floor(x0);
    x(1)=(abs(ustSinir+altSinir))/2;
    data(1,2)=error;
    data(1,1)=x(1);

    for i=1:1:20

    if(error>=0.00001)
        x(i+1)=0.5*(x(i)+(-c/x(i)));
        error=abs(x(i+1)-x(i))
        x(i)=x(i+1);
        data(i+1,1)=x(i);
        data(i+1,2)=error;

    else
        return;
    end
    end
else
    disp('Yanlýþ Deðerler Girdiniz...')
    
end

