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

cla(handles.axes);                      % Önceki iþlemden kalan grafiði temizler.
cla(handles.dataTable);                 % Önceki iþlemden kalan iterasyon listesini temizler.

epsilon=0.000001;                       % Tolerans deðeri


a=str2double(get(handles.katsayiA,'string'));       % Verilen fonksiyon için gerekli olan a ve c deðerlerini
c=str2double(get(handles.katsayiC,'string'));       % kullanýcýdan almak için gerekli olan kod ve çevirme iþlemi

x1=str2double(get(handles.x1,'string'));            % Kullanýcýdan istenen deðerler alýnýyor.
x2=str2double(get(handles.x2,'string'));

xi=str2double(get(handles.xi,'string'));            % Alt ve üst deðerler kullanýcý tarafýndan alýnýyor.
xf=str2double(get(handles.xf,'string'));

xreel=(-c)^(1/a);                                   % Kullanýcýnýn girdiði deðerlere göre gerçek kök deðeri hesapladým.

data=[];                                            % Ýterasyon tablosuna veri girmek için data dizisi oluþturdum.
x(1)=x1;
x(2)=x2;

data(1,1)=x(1);                                     % data dizisine ilk verileri atadým.
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
    
    if(errorFark>epsilon)           % Ýterasyonun bitmesi için gerekli þart
                                    % Ýterasyon iþlemi gerçekleþtiriyorum.  
        x(i+1)=x(i)-(((fonk(x(i),a,c)*(x(i)-x(i-1))))/(fonk(x(i),a,c)-fonk(x(i-1),a,c)));
        data(i+1,1)=x(i+1);                             % Çýkan sonuçlarý data dizisine kaydettim.
        data(i+1,2)=abs(xreel-x(i+1))/abs(xreel);       % Sonuçlar arasýndaki baðýl hata hesaplanýyor.
        errorBagil=data(i+1,2);                         % Çýkan sonuçlarý data dizisine kaydettim.
        data(i+1,3)=abs(x(i)-x(i+1));                   % Sonuçlar arasýndaki fark hesaplanýyor.
        errorFark=data(i+1,3);                          % Çýkan sonuçlarý data dizisine kaydettim.
        line(handles.axes,[0,i+5],[xreel,xreel]);       % Çýkan sonuçlarý anlýk olarak grafiðe çizdirdim.
        plot(handles.axes,i,x(i),'*');
        xlim(handles.axes,[0 i+5]);
        ylabel('Ýterayon sonucu');
        xlabel('Ýterasyon sayýsý');
        hold on;
        datacursormode on;
    else
        continue;
    end    
end

set(handles.dataTable,'data',data);                     % Tüm iterasyon deðerlerini tabloya yazdýrdým.
data=0;
