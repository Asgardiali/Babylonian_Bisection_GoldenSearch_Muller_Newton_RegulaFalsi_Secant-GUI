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

% cla(handles.axes);                      % Önceki iþlemden kalan grafiði temizler.
% cla(handles.dataTable);                 % Önceki iþlemden kalan iterasyon listesini temizler.

a=str2double(get(handles.katsayiA,'string'));       % Verilen fonksiyon için gerekli olan a ve c deðerlerini
c=str2double(get(handles.katsayiC,'string'));       % kullanýcýdan almak için gerekli olan kod ve çevirme iþlemi
xi=str2double(get(handles.altSinir,'string'));      % Alt ve üst deðerler kullanýcý tarafýndan alýnýyor.
xf=str2double(get(handles.ustSinir,'string'));

epsilon=0.000001;              % Tolerans deðeri.
iter= 1000;                    % Ýterasyon maksimum sayýsý   
tau=double((sqrt(5)-1)/2);     % Altýn oran hesaplanmasý. 

k=1;                           % Ýterasyon parametresi
data=[];                       % Data dizi tanýmladým.
data(1,1)=xi;                  % data dizisine ilk verileri atadým. 
data(1,2)=xf;
data(1,3)=1;

x1=xi+(1-tau)*(xf-xi);                      
x2=xi+tau*(xf-xi);

f_x1=fonk(x1,a,c);                     
f_x2=fonk(x2,a,c);

while ((abs(xf-xi)>epsilon) && (k<iter))    % Ýterasyonun bitmesi için gerekli þart
    k=k+1;
    
    if(f_x1<f_x2)                   % Altýn bölüm arama kuralýný saðlamasý için koþul koydum.
                
        xf=x2;
        x2=x1;
        x1=xi+(1-tau)*(xf-xi);      % Ýterasyon iþlemi gerçekleþtiriyorum.  
        f_x1=fonk(x1,a,c);
        f_x2=fonk(x2,a,c);        
        data(k,1)=xi;               % Çýkan sonuçlarý data dizisine kaydettim.
        data(k,2)=xf;
        data(k,3)=abs(xf-xi);       % Ýki deðer arasýndaki farký hesapladým.
        
    else
        xi=x1;
        x1=x2;
        x2=xi+tau*(xf-xi);          % Ýterasyon iþlemi gerçekleþtiriyorum.
        f_x1=fonk(x1,a,c);
        f_x2=fonk(x2,a,c);        
        data(k,1)=xi;               % Çýkan sonuçlarý data dizisine kaydettim.
        data(k,2)=xf;
        data(k,3)=abs(xf-xi);       % Ýki deðer arasýndaki farký hesapladým.
        
    end
    
    plot(handles.axes,k,xi,'o');    % Çýkan sonuçlarý anlýk olarak grafiðe çizdirdim.
    ylim(handles.axes,[xi-5 xf+10]);    
    xlim(handles.axes,[0 k+5]);
    hold on;
    plot(handles.axes,k,xf,'*');    % Çýkan sonuçlarý anlýk olarak grafiðe çizdirdim.
    ylim(handles.axes,[xi-5 xf+10]);    
    xlim(handles.axes,[0 k+5]);
    datacursormode on;
end
set(handles.dataTable,'visible','on');
set(handles.dataTable,'data',data); % Tüm iterasyon deðerlerini tabloya yazdýrdým.
set(handles.valueGolden,'string',xi);
