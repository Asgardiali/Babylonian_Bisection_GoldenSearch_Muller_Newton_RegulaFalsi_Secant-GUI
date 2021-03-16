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

cla(handles.axes);                  % Önceki iþlemden kalan grafiði temizler.
cla(handles.dataTable);             % Önceki iþlemden kalan iterasyon listesini temizler.

a=str2double(get(handles.katsayiA,'string'));       % Verilen fonksiyon için gerekli olan a ve c deðerlerini
c=str2double(get(handles.katsayiC,'string'));       % kullanýcýdan almak için gerekli olan kod ve çevirme iþlemi

xold=str2double(get(handles.x0,'string'));          % x'in baþlangýç deðerini kullanýcýdan alýyorum.

if(xold==0)                         %Newton kuralýna uymayan giriþ yapýlýrsa hata veriyor.
    f = msgbox({'Newton Metodu';'Girilen baþlangýç deðeri 0 olmamalýdýr.';'Lütfen farklý bir sayý giriniz!!!'});
end

plot(handles.axes,1,xold,'o');      % Ýlk deðerleri çizdirdim.
hold on;

xreel=(-c)^(1/a);                   % Kullanýcýnýn girdiði deðerlere göre gerçek kök deðeri hesapladým.
tolerans=0.000001;                  % Tolerans deðeri
errorBagil=1;                       % Hata deðerlerini baþlangýç olarak 1 verdim.
errorFark=1;

data=[];                            % Ýterasyon tablosuna veri girmek için data dizisi oluþturdum.
data(1,1)=xold;                     % data dizisine ilk verileri atadým.
data(1,2)=errorBagil;
data(1,3)=errorFark;

for i=1:1:1000
    
    if(errorFark>tolerans && errorBagil>0.00001)                % Ýterasyonun bitmesi için gerekli þart
        xnew=xold-(((fonk(xold,a,c))/(dfonk(xold,a))));         % Ýterasyon iþlemi gerçekleþtiriyorum.
        data(i,1)=xnew;
        errorFark=abs(xold-xnew);                               % Sonuçlar arasýndaki fark hesaplanýyor.
        data(i,3)=errorFark;
        errorBagil=abs(xreel-xnew)/abs(xreel);                  % Sonuçlar arasýndaki baðýl hata hesaplanýyor.
        data(i,2)=errorBagil;
        line(handles.axes,[0,i+5],[xreel xreel]);               % Çýkan sonuçlarý anlýk olarak grafiðe çizdirdim.
        plot(handles.axes,i+1,xnew,'o');
        xlim(handles.axes,[0 i+5]);
        ylabel('Ýterayon sonucu');
        xlabel('Ýterasyon sayýsý');
        hold on;
        datacursormode on;
        xold=xnew;
    else   
        continue;        
    end
    set(handles.dataTable,'Data',data);                         % Tüm iterasyon deðerlerini tabloya yazdýrdým.
end
