function varargout = mullerGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mullerGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @mullerGUI_OutputFcn, ...
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

function mullerGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = mullerGUI_OutputFcn(hObject, eventdata, handles) 

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



function x0Value_Callback(hObject, eventdata, handles)

function x0Value_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultMuller_Callback(hObject, eventdata, handles)

function resultMuller_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function x1Value_Callback(hObject, eventdata, handles)

function x1Value_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2Value_Callback(hObject, eventdata, handles)

function x2Value_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton1_Callback(hObject, eventdata, handles)

cla(handles.axes);                      % Önceki iþlemden kalan grafiði temizler.
cla(handles.dataTable);                 % Önceki iþlemden kalan iterasyon listesini temizler.

a=str2double(get(handles.katsayiA,'string'));       % Verilen fonksiyon için gerekli olan a ve c deðerlerini
c=str2double(get(handles.katsayiC,'string'));       % kullanýcýdan almak için gerekli olan kod ve çevirme iþlemi

x1=str2double(get(handles.x1Value,'string'));       % Alt ve üst deðerler kullanýcý tarafýndan alýnýyor.
x2=str2double(get(handles.x2Value,'string'));

kmax=1000;                              % Maksimum iterasyon sayýsý
tolerans=0.000001;                      % Tolerans deðeri
data=[];                                % Data dizi oluþturdum.

x(1)=x1;                                % Kullanýcý 1. ve 2. deðerleri giriyor
x(2)=x2;
x(3)=(x1+x2)/2;                         % 3. deðer otomatik hesapladým
set(handles.x3Value,'string',x(3));     % ve kullanýcýnýn görmesini saðladým.

data(1,1)=x(1);                         % Baþlangýç deðerlerini data dizisine kaydettim.
data(2,1)=x(2);
data(3,1)=x(3);

y(1)=fonk(x(1),a,c);                    % Fonksiyonun aldýðý deðerleri buldum.
y(2)=fonk(x(2),a,c);
y(3)=fonk(x(3),a,c);

b(1)=(y(2)-y(1))/(x(2)-x(1));           % B katsayýsýný hesapladým. 

xreel=(-c)^(1/a);                       % Gerçek kökü buldum.
    
errorFark=abs(x(1)-0);                  % Ýki deðer arasýndaki farklarý elde ettim.
data(1,3)=errorFark;
errorFark=abs(x(2)-x(1));
data(2,3)=errorFark;
errorFark=abs(x(3)-x(2));
data(3,3)=errorFark;

errorBagil=abs(xreel-x(1))/abs(xreel);  % Baðýl hatayý elde ettim.
data(1,2)=errorBagil;
errorBagil=abs(xreel-x(2))/abs(xreel);
data(2,2)=errorBagil;
errorBagil=abs(xreel-x(3))/abs(xreel);
data(3,2)=errorBagil;

plot(handles.axes,1,x(1),'o');          % Baþlangýç deðerlerini grafiðe çizdirdim.
hold on;
plot(handles.axes,2,x(2),'o');
hold on;
plot(handles.axes,3,x(3),'o');
hold on;


for k=3:1:kmax
    
    b(k-1)=(y(k)-y(k-1))/(x(k)-x(k-1));             % Ýterasyon iþlemlerini yaptýðým döngü
    d(k-2)=(b(k-1)-b(k-2))/(x(k)-x(k-2));
    s=b(k-1)+(x(k)-x(k-1))*d(k-2);
    x(k+1)=x(k)-(2*y(k))/(s+sign(s)*sqrt((s^2)-(4*y(k))*d(k-2)));
    data(k+1,1)=x(k+1);                             % Elde edilen deðerleri data dizisine kaydediyorum.
    y(k+1)=fonk(x(k+1),a,c);
    errorFark=abs(x(k+1)-x(k));
    data(k+1,3)=errorFark;                          % Aradaki farký ve baðýl hatayý data dizisine kaydettim.
    errorBagil=abs(xreel-x(k+1))/abs(xreel);
    data(k+1,2)=errorBagil;
    
    line(handles.axes,[0,k+5],[xreel xreel]);       % Çýkan sonuçlarý anlýk olarak grafiðe çizdirdim.
    plot(handles.axes,k,x(k+1),'o');
    xlim(handles.axes,[0 k+5]);
    ylabel('Ýterayon sonucu');
    xlabel('Ýterasyon sayýsý');
    hold on;
    datacursormode on;
    
    if(errorFark<tolerans && errorBagil<0.00001)
        set(handles.dataTable,'Data',data);         % Tüm iterasyon deðerlerini tabloya yazdýrdým.
        set(handles.resultMuller,'string',data(size(data,1),1));
        break;
    end
    iter=k;
    
    
end
