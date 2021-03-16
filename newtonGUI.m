function varargout = newtonGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newtonGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @newtonGUI_OutputFcn, ...
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

function newtonGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = newtonGUI_OutputFcn(hObject, eventdata, handles) 

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

function x0_Callback(hObject, eventdata, handles)

function x0_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calcNewton_Callback(hObject, eventdata, handles)

cla(handles.axes);                  % �nceki i�lemden kalan grafi�i temizler.
cla(handles.dataTable);             % �nceki i�lemden kalan iterasyon listesini temizler.

a=str2double(get(handles.katsayiA,'string'));       % Verilen fonksiyon i�in gerekli olan a ve c de�erlerini
c=str2double(get(handles.katsayiC,'string'));       % kullan�c�dan almak i�in gerekli olan kod ve �evirme i�lemi

xold=str2double(get(handles.x0,'string'));          % x'in ba�lang�� de�erini kullan�c�dan al�yorum.

if(xold==0)                         %Newton kural�na uymayan giri� yap�l�rsa hata veriyor.
    f = msgbox({'Newton Metodu';'Girilen ba�lang�� de�eri 0 olmamal�d�r.';'L�tfen farkl� bir say� giriniz!!!'});
end

plot(handles.axes,1,xold,'o');      % �lk de�erleri �izdirdim.
hold on;

xreel=(-c)^(1/a);                   % Kullan�c�n�n girdi�i de�erlere g�re ger�ek k�k de�eri hesaplad�m.
tolerans=0.000001;                  % Tolerans de�eri
errorBagil=1;                       % Hata de�erlerini ba�lang�� olarak 1 verdim.
errorFark=1;

data=[];                            % �terasyon tablosuna veri girmek i�in data dizisi olu�turdum.
data(1,1)=xold;                     % data dizisine ilk verileri atad�m.
data(1,2)=errorBagil;
data(1,3)=errorFark;

for i=1:1:1000
    
    if(errorFark>tolerans && errorBagil>0.00001)                % �terasyonun bitmesi i�in gerekli �art
        xnew=xold-(((fonk(xold,a,c))/(dfonk(xold,a))));         % �terasyon i�lemi ger�ekle�tiriyorum.
        data(i,1)=xnew;
        errorFark=abs(xold-xnew);                               % Sonu�lar aras�ndaki fark hesaplan�yor.
        data(i,3)=errorFark;
        errorBagil=abs(xreel-xnew)/abs(xreel);                  % Sonu�lar aras�ndaki ba��l hata hesaplan�yor.
        data(i,2)=errorBagil;
        line(handles.axes,[0,i+5],[xreel xreel]);               % ��kan sonu�lar� anl�k olarak grafi�e �izdirdim.
        plot(handles.axes,i+1,xnew,'o');
        xlim(handles.axes,[0 i+5]);
        ylabel('�terayon sonucu');
        xlabel('�terasyon say�s�');
        hold on;
        datacursormode on;
        xold=xnew;
    else   
        continue;        
    end
    set(handles.dataTable,'Data',data);                         % T�m iterasyon de�erlerini tabloya yazd�rd�m.
end
