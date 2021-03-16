function varargout = Odev_2(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Odev_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Odev_2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function Odev_2_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = Odev_2_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function aKatsayi_Callback(hObject, eventdata, handles)

function aKatsayi_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function cKatsayi_Callback(hObject, eventdata, handles)

function cKatsayi_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function babylonianResult_Callback(hObject, eventdata, handles)

function babylonianResult_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function babylonian_Callback(hObject, eventdata, handles)
cla(handles.axes);
cla(handles.dataTable);
error=1;
result=1;
a=str2double(get(handles.aKatsayi,'string'));
c=str2double(get(handles.cKatsayi,'string'));
data=[];

if(c<0 && a==2)
    
    x0=(-c)^(1/a);    
    ustSinir=ceil(x0);
    altSinir=floor(x0);
    x(1)=(abs(ustSinir+altSinir))/2;
    set(handles.startValueBabylonian,'string',x(1));
    data(1,3)=result;
    data(1,2)=error;
    data(1,1)=x(1);

    for i=1:1:10000

    if(error>=0.00001 && result>=0.000001)
        x(i+1)=0.5*(x(i)+(-c/x(i)));
        error=abs(x(i+1)-x0)/abs(x0);
        result=abs(x(i+1)-x(i));
        set(handles.axes,'visible','on');
        stem(handles.axes,i,x(i),'o');
        ylim(handles.axes,[altSinir-1 ustSinir]);
        xlim(handles.axes,[0 i+5]);
        ylabel('Ýterayon sonucu');
        xlabel('Ýterasyon sayýsý');
        hold on;
        datacursormode on;
        x(i)=x(i+1);
        data(i+1,1)=x(i);
        data(i+1,2)=error;
        data(i+1,3)=result;

    else
        continue;
    end
    end
    set(handles.dataTable,'visible','on');
    set(handles.dataTable,'Data',data);
    set(handles.babylonianResult,'string',data(size(data,1),1));
    line(handles.axes,[0,i+5],[x0,x0]);
    
else
    f = msgbox({'Babylonian Kuralý';'Fonksiyon ikinci dereceden olmalý';'Sabit sayý deðeri ise c<0 olmalýdýr.'});
    set(handles.dataTable,'visible','off');
    set(handles.axes,'visible','off');
end

function bisection_Callback(hObject, eventdata, handles)
cla(handles.axes);
cla(handles.dataTable);
a=str2double(get(handles.aKatsayi,'string'));
c=str2double(get(handles.cKatsayi,'string'));
xi=str2double(get(handles.xiAltsinir,'string'));
xf=str2double(get(handles.xfUstsinir,'string'));

data=[];
x(1)=0;
errorBagil=1;
errorFark=1;

data(1,1)=x(1);
data(1,2)=errorBagil;
data(1,3)=errorFark;

dif=fonk(xi,a,c)*fonk(xf,a,c);
xreel=(-c)^(1/a);
set(handles.xValue,'string',(xi+xf)/2);

if(dif>0)
       f = msgbox({'Bisection Kuralý';'Girilen aralýk deðerinde denklemin reel kökü yoktur.';'Lütfen baþka bir aralýk deðeri giriniz!!!'});
       set(handles.dataTable,'visible','off');
       set(handles.axes,'visible','off');
end

for i=2:1:1000
     if(errorFark>=0.000001 && errorBagil>0.00001)
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
            set(handles.axes,'visible','on');
            line(handles.axes,[0,i+5],[xreel xreel]);
            plot(handles.axes,i,x(i),'o');
            ylim(handles.axes,[xi-5 xf+5]);
            xlim(handles.axes,[0 i+5]);
            ylabel('Ýterayon sonucu');
            xlabel('Ýterasyon sayýsý');
            hold on;
            datacursormode on;
         end
        
     else
        set(handles.dataTable,'visible','on');
        set(handles.dataTable,'data',data);
        set(handles.bisectionResult,'string',data(size(data,1),1));
        continue;
     end
end

function goldenSection_Callback(hObject, eventdata, handles)

a=str2double(get(handles.aKatsayi,'string'));
c=str2double(get(handles.cKatsayi,'string'));
xi=str2double(get(handles.xiAltsinir,'string'));
xf=str2double(get(handles.xfUstsinir,'string'));

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
    
        plot(handles.axes,k,xi,'o');    
        ylim(handles.axes,[xi-5 xf+10]);    
        xlim(handles.axes,[0 k+5]);
        hold on;
        plot(handles.axes,k,xf,'*');    
        ylim(handles.axes,[xi-5 xf+10]);    
        xlim(handles.axes,[0 k+5]);
        datacursormode on;
        legend('Xi','Xf');
    
end
set(handles.dataTable,'visible','on');
set(handles.dataTable,'data',data);
set(handles.valueGolden,'string',xi);


function popupmenu_Callback(hObject, eventdata, handles)

contents=cellstr(get(handles.popupmenu,'string'));
popchoose=contents{get(handles.popupmenu,'value')};
popchoose
if(strcmp(popchoose,'Bir Yöntem Seçiniz...'))
    
    set(handles.aKatsayi,'visible','off');
    set(handles.cKatsayi,'visible','off');
    set(handles.dataTable,'visible','off');
    set(handles.axes,'visible','off');
    
    set(handles.babylonian,'visible','off');
    set(handles.babylonianResult,'visible','off');
    set(handles.startValue,'visible','off');
    set(handles.startValueBabylonian,'visible','off');
    
    set(handles.bisection,'visible','off');
    set(handles.xiAltsinir,'visible','off');
    set(handles.xfUstsinir,'visible','off');
    set(handles.xValue,'visible','off');
    set(handles.xstartValue,'visible','off');
    
    

elseif(strcmp(popchoose,'Babylonian Metot'))
    cla(handles.axes);
    cla(handles.dataTable);
    set(handles.dataTable,'visible','off');
    set(handles.axes,'visible','off');
    set(handles.aKatsayi,'visible','on');
    set(handles.cKatsayi,'visible','on');
    set(handles.babylonian,'visible','on');
    set(handles.babylonianResult,'visible','on');
    set(handles.startValue,'visible','on');
    set(handles.startValueBabylonian,'visible','on');
    
    set(handles.bisection,'visible','off');
    set(handles.bisectionResult,'visible','off');
    set(handles.xiAltsinir,'visible','off');
    set(handles.xfUstsinir,'visible','off');
    set(handles.xValue,'visible','off');
    set(handles.xstartValue,'visible','off');
    
    

elseif(strcmp(popchoose,'Bisection Metot'))
    cla(handles.axes);
    cla(handles.dataTable);
    set(handles.dataTable,'visible','off');
    set(handles.axes,'visible','off');
    set(handles.aKatsayi,'visible','on');
    set(handles.cKatsayi,'visible','on');
    set(handles.bisection,'visible','on');
    set(handles.bisectionResult,'visible','on');
    set(handles.xiAltsinir,'visible','on');
    set(handles.xfUstsinir,'visible','on');
    set(handles.xValue,'visible','on');
    set(handles.xstartValue,'visible','on');
    
    set(handles.babylonian,'visible','off');
    set(handles.babylonianResult,'visible','off');
    set(handles.startValue,'visible','off');
    set(handles.startValueBabylonian,'visible','off');    
    
    
elseif(strcmp(popchoose,'Altýn Bölüm Arama Algoritmasý'))
 
    
    set(handles.aKatsayi,'visible','on');
    set(handles.cKatsayi,'visible','on');
    set(handles.dataTable,'visible','off');
    set(handles.axes,'visible','off');
    
    set(handles.babylonian,'visible','off');
    set(handles.babylonianResult,'visible','off');
    set(handles.startValue,'visible','off');
    set(handles.startValueBabylonian,'visible','off');
    
    set(handles.bisection,'visible','off');
    set(handles.xiAltsinir,'visible','on');
    set(handles.xfUstsinir,'visible','on');
    set(handles.xValue,'visible','off');
    set(handles.xstartValue,'visible','off');
    
    set(handles.goldenSection,'visible','on');
    set(handles.valueGolden,'visible','on');

end    
    
function popupmenu_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function startValueBabylonian_Callback(hObject, eventdata, handles)

function startValueBabylonian_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function bisectionResult_Callback(hObject, eventdata, handles)

function bisectionResult_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function xiAltsinir_Callback(hObject, eventdata, handles)

function xiAltsinir_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function xfUstsinir_Callback(hObject, eventdata, handles)

function xfUstsinir_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function xValue_Callback(hObject, eventdata, handles)

function xValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valueGolden_CreateFcn(hObject, eventdata, handles)
