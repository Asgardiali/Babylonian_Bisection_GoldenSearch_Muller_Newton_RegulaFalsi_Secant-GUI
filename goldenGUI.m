function varargout = goldenGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @goldenGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @goldenGUI_OutputFcn, ...
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

function goldenGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = goldenGUI_OutputFcn(hObject, eventdata, handles) 

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

function valueGolden_Callback(hObject, eventdata, handles)

function valueGolden_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calcGolden_Callback(hObject, eventdata, handles)

% cla(handles.axes);                      % �nceki i�lemden kalan grafi�i temizler.
% cla(handles.dataTable);                 % �nceki i�lemden kalan iterasyon listesini temizler.

a=str2double(get(handles.katsayiA,'string'));       % Verilen fonksiyon i�in gerekli olan a ve c de�erlerini
c=str2double(get(handles.katsayiC,'string'));       % kullan�c�dan almak i�in gerekli olan kod ve �evirme i�lemi
xi=str2double(get(handles.altSinir,'string'));      % Alt ve �st de�erler kullan�c� taraf�ndan al�n�yor.
xf=str2double(get(handles.ustSinir,'string'));

epsilon=0.000001;              % Tolerans de�eri.
iter= 1000;                    % �terasyon maksimum say�s�   
tau=double((sqrt(5)-1)/2);     % Alt�n oran hesaplanmas�. 

k=1;                           % �terasyon parametresi
data=[];                       % Data dizi tan�mlad�m.
data(1,1)=xi;                  % data dizisine ilk verileri atad�m. 
data(1,2)=xf;
data(1,3)=1;

x1=xi+(1-tau)*(xf-xi);                      
x2=xi+tau*(xf-xi);

f_x1=fonk(x1,a,c);                     
f_x2=fonk(x2,a,c);

while ((abs(xf-xi)>epsilon) && (k<iter))    % �terasyonun bitmesi i�in gerekli �art
    k=k+1;
    
    if(f_x1<f_x2)                   % Alt�n b�l�m arama kural�n� sa�lamas� i�in ko�ul koydum.
                
        xf=x2;
        x2=x1;
        x1=xi+(1-tau)*(xf-xi);      % �terasyon i�lemi ger�ekle�tiriyorum.  
        f_x1=fonk(x1,a,c);
        f_x2=fonk(x2,a,c);        
        data(k,1)=xi;               % ��kan sonu�lar� data dizisine kaydettim.
        data(k,2)=xf;
        data(k,3)=abs(xf-xi);       % �ki de�er aras�ndaki fark� hesaplad�m.
        
    else
        xi=x1;
        x1=x2;
        x2=xi+tau*(xf-xi);          % �terasyon i�lemi ger�ekle�tiriyorum.
        f_x1=fonk(x1,a,c);
        f_x2=fonk(x2,a,c);        
        data(k,1)=xi;               % ��kan sonu�lar� data dizisine kaydettim.
        data(k,2)=xf;
        data(k,3)=abs(xf-xi);       % �ki de�er aras�ndaki fark� hesaplad�m.
        
    end
    
    plot(handles.axes,k,xi,'o');    % ��kan sonu�lar� anl�k olarak grafi�e �izdirdim.
    ylim(handles.axes,[xi-5 xf+10]);    
    xlim(handles.axes,[0 k+5]);
    hold on;
    plot(handles.axes,k,xf,'*');    % ��kan sonu�lar� anl�k olarak grafi�e �izdirdim.
    ylim(handles.axes,[xi-5 xf+10]);    
    xlim(handles.axes,[0 k+5]);
    datacursormode on;
end
set(handles.dataTable,'visible','on');
set(handles.dataTable,'data',data); % T�m iterasyon de�erlerini tabloya yazd�rd�m.
set(handles.valueGolden,'string',xi);
