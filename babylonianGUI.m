function varargout = babylonianGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @babylonianGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @babylonianGUI_OutputFcn, ...
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

function babylonianGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = babylonianGUI_OutputFcn(hObject, eventdata, handles) 

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



function startValue_Callback(hObject, eventdata, handles)

function startValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultBabylonian_Callback(hObject, eventdata, handles)

function resultBabylonian_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function calcBabylonian_Callback(hObject, eventdata, handles)

cla(handles.axes);          % �nceki i�lemden kalan grafi�i temizler.
cla(handles.dataTable);     % �nceki i�lemden kalan iterasyon listesini temizler.

error=1;                    % Hata de�erlerini ba�lang�� olarak 1 verdim.
result=1;

a=str2double(get(handles.katsayiA,'string'));   % Verilen fonksiyon i�in gerekli olan a ve c de�erlerini
c=str2double(get(handles.katsayiC,'string'));   % kullan�c�dan almak i�in gerekli olan kod ve �evirme i�lemi
data=[];                                        % �terasyon tablosuna veri girmek i�in data dizisi olu�turdum.

if(c<0 && a==2)             % Babylonian i�in gerekli �arlar� sa�lamas�n� i�in if kontrol� sa�lad�m.
                            % �artlar� sa�lamad��� takdirde else i�erisindeki uyar�y� veriyor.
    x0=(-c)^(1/a);          % Kullan�c�n�n girdi�i de�erlere g�re ger�ek k�k de�eri hesaplad�m.
    ustSinir=ceil(x0);      % Kullan�c�n�n girdi�i alt ve �st s�n�rlar� a�a�� ve yukar� yuvarlad�m.
    altSinir=floor(x0);
    x(1)=(abs(ustSinir+altSinir))/2;            % Bu de�erlere g�re ba�lang�� de�erini hesaplad�m.
    set(handles.startValue,'string',x(1));      % Bu ba�lang�� de�erini kullan�c�ya g�sterdim.
    data(1,3)=result;                           % Her iterasyonda ilk olu�turulan verileri diziye kaydettim.               
    data(1,2)=error;
    data(1,1)=x(1);

    for i=1:1:10000

    if(error>=0.00001 && result>=0.000001)      % �terasyonun durumunu kontrol etmek i�in if ko�ulu olu�turdum.
        
        x(i+1)=(1/a)*(x(i)+(-c/x(i)));          % �terasyon i�lemi ger�ekle�tiriyorum.
        error=abs(x(i+1)-x0)/abs(x0);           % Sonu�lar aras�ndaki ba��l hata hesaplan�yor.               
        result=abs(x(i+1)-x(i));                % Sonu�lar aras�ndaki fark hesaplan�yor.
        plot(handles.axes,i,x(i),'o');          % ��kan sonu�lar� anl�k olarak grafi�e �izdirdim.
        ylim(handles.axes,[altSinir-1 ustSinir]);
        xlim(handles.axes,[0 i+5]);
        ylabel('�terayon sonucu');
        xlabel('�terasyon say�s�');
        hold on;
        datacursormode on;
        x(i)=x(i+1);                            % �terasyon sonucunda ��kan de�eri, iterasyon tekrar ba�a d�nd���nde 
        data(i+1,1)=x(i);                       % i�leme tekrardan ba�lamas� i�indir.
        data(i+1,2)=error;
        data(i+1,3)=result;

    else
        continue;
    end
    end
    set(handles.dataTable,'Data',data);         % Elde edilen data dizisini data table'a aktar�yor.
    set(handles.resultBabylonian,'string',data(size(data,1),1));
    line(handles.axes,[0,i+5],[x0,x0]);
    
else
    f = msgbox({'Babylonian Kural�';'Fonksiyon ikinci dereceden olmal�';'Sabit say� de�eri ise c<0 olmal�d�r.'});
end
