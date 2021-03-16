function varargout = secantGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @secantGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @secantGUI_OutputFcn, ...
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

function secantGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = secantGUI_OutputFcn(hObject, eventdata, handles) 

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

function x1_Callback(hObject, eventdata, handles)

function x1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function x2_Callback(hObject, eventdata, handles)

function x2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function xi_Callback(hObject, eventdata, handles)

function xi_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function xf_Callback(hObject, eventdata, handles)

function xf_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calcSecant_Callback(hObject, eventdata, handles)

cla(handles.axes);                      % �nceki i�lemden kalan grafi�i temizler.
cla(handles.dataTable);                 % �nceki i�lemden kalan iterasyon listesini temizler.

epsilon=0.000001;                       % Tolerans de�eri


a=str2double(get(handles.katsayiA,'string'));       % Verilen fonksiyon i�in gerekli olan a ve c de�erlerini
c=str2double(get(handles.katsayiC,'string'));       % kullan�c�dan almak i�in gerekli olan kod ve �evirme i�lemi

x1=str2double(get(handles.x1,'string'));            % Kullan�c�dan istenen de�erler al�n�yor.
x2=str2double(get(handles.x2,'string'));

xi=str2double(get(handles.xi,'string'));            % Alt ve �st de�erler kullan�c� taraf�ndan al�n�yor.
xf=str2double(get(handles.xf,'string'));

xreel=(-c)^(1/a);                                   % Kullan�c�n�n girdi�i de�erlere g�re ger�ek k�k de�eri hesaplad�m.

data=[];                                            % �terasyon tablosuna veri girmek i�in data dizisi olu�turdum.
x(1)=x1;
x(2)=x2;

data(1,1)=x(1);                                     % data dizisine ilk verileri atad�m.
data(2,1)=x(2);

errorBagil=abs(xreel-x(1))/abs(xreel);
data(1,2)=errorBagil;
errorBagil=abs(xreel-x(2))/abs(xreel);
data(2,2)=errorBagil;



errorFark=abs(data(1,1)-data(2,1));
data(1,3)=0;
data(2,3)=errorFark;

plot(handles.axes,1,x(1),'*');
hold on;
plot(handles.axes,2,x(2),'*');
hold on;

for i=2:1:10
    
    if(errorFark>epsilon)           % �terasyonun bitmesi i�in gerekli �art
                                    % �terasyon i�lemi ger�ekle�tiriyorum.  
        x(i+1)=x(i)-(((fonk(x(i),a,c)*(x(i)-x(i-1))))/(fonk(x(i),a,c)-fonk(x(i-1),a,c)));
        data(i+1,1)=x(i+1);                             % ��kan sonu�lar� data dizisine kaydettim.
        data(i+1,2)=abs(xreel-x(i+1))/abs(xreel);       % Sonu�lar aras�ndaki ba��l hata hesaplan�yor.
        errorBagil=data(i+1,2);                         % ��kan sonu�lar� data dizisine kaydettim.
        data(i+1,3)=abs(x(i)-x(i+1));                   % Sonu�lar aras�ndaki fark hesaplan�yor.
        errorFark=data(i+1,3);                          % ��kan sonu�lar� data dizisine kaydettim.
        line(handles.axes,[0,i+5],[xreel,xreel]);       % ��kan sonu�lar� anl�k olarak grafi�e �izdirdim.
        plot(handles.axes,i,x(i),'*');
        xlim(handles.axes,[0 i+5]);
        ylabel('�terayon sonucu');
        xlabel('�terasyon say�s�');
        hold on;
        datacursormode on;
    else
        continue;
    end    
end

set(handles.dataTable,'data',data);                     % T�m iterasyon de�erlerini tabloya yazd�rd�m.
data=0;
