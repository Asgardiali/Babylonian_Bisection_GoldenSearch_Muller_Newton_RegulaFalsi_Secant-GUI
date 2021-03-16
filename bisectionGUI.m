function varargout = bisectionGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bisectionGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @bisectionGUI_OutputFcn, ...
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

function bisectionGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = bisectionGUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function katsayiA_Callback(hObject, eventdata, handles)

function katsayiA_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function katsayiC_Callback(hObject, eventdata, handles)

function katsayiC_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function altSinir_Callback(hObject, eventdata, handles)

function altSinir_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ustSinir_Callback(hObject, eventdata, handles)

function ustSinir_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function resultBisection_Callback(hObject, eventdata, handles)

function resultBisection_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function startValue_Callback(hObject, eventdata, handles)

function startValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calcBisection_Callback(hObject, eventdata, handles)
cla(handles.axes);                      % �nceki i�lemden kalan grafi�i temizler.
cla(handles.dataTable);                 % �nceki i�lemden kalan iterasyon listesini temizler.

a=str2double(get(handles.katsayiA,'string'));       % Verilen fonksiyon i�in gerekli olan a ve c de�erlerini
c=str2double(get(handles.katsayiC,'string'));       % kullan�c�dan almak i�in gerekli olan kod ve �evirme i�lemi
xi=str2double(get(handles.altSinir,'string'));      % Alt ve �st de�erler kullan�c� taraf�ndan al�n�yor.
xf=str2double(get(handles.ustSinir,'string'));

data=[];                % �terasyon tablosuna veri girmek i�in data dizisi olu�turdum.
x(1)=0;                 % x'in ba�lang�� de�erini verdim.
errorBagil=1;           % Hata de�erlerini ba�lang�� olarak 1 verdim.
errorFark=1;

data(1,1)=x(1);         % data dizisine ilk verileri atad�m. 
data(1,2)=errorBagil;
data(1,3)=errorFark;

dif=fonk(xi,a,c)*fonk(xf,a,c);      % Bisection kural�n� �art�n� hesaplad�m.  
xreel=(-c)^(1/a);       % Kullan�c�n�n girdi�i de�erlere g�re ger�ek k�k de�eri hesaplad�m.
set(handles.startValue,'string',(xi+xf)/2);     % Ba�lang�� de�erini kullan�c�ya g�stermek i�in ekrana yazd�r�ld�.

if(dif>0)           %Bisection kural�na uymayan giri� yap�l�rsa hata veriyor.
       f = msgbox({'Bisection Metodu';'Girilen aral�k de�erinde denklemin reel k�k� yoktur.';'L�tfen ba�ka bir aral�k de�eri giriniz!!!'});
end

for i=2:1:1000
    
     if(errorFark>=0.000001 && errorBagil>0.00001)          % �terasyonun bitmesi i�in gerekli �art
         
         x(i)=(xi+xf)/2;                    % �terasyon i�lemi ger�ekle�tiriyorum.
         fx=fonk(x(i),a,c);
             
             if(fx<0)
                xi=x(i);
             else
                xf=x(i);
             end

            errorBagil=abs(x(i)-xreel)/abs(xreel);      % Sonu�lar aras�ndaki ba��l hata hesaplan�yor.
            errorFark=abs(x(i)-xreel);                  % Sonu�lar aras�ndaki fark hesaplan�yor.
            data(i,1)=x(i);                             % ��kan sonu�lar� data dizisine kaydettim.
            data(i,2)=errorBagil;
            data(i,3)=errorFark;
            line(handles.axes,[0,i+5],[xreel xreel]);   % ��kan sonu�lar� anl�k olarak grafi�e �izdirdim.
            plot(handles.axes,i,x(i),'o');
            ylim(handles.axes,[xi-5 xf+5]);
            xlim(handles.axes,[0 i+5]);
            ylabel('�terayon sonucu');
            xlabel('�terasyon say�s�');
            hold on;
            datacursormode on;
        else
        set(handles.dataTable,'data',data);             % T�m iterasyon de�erlerini tabloya yazd�rd�m.
        set(handles.resultBisection,'string',data(size(data,1),1));
        continue;
     end
end
