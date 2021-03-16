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
cla(handles.axes);                      % Önceki iþlemden kalan grafiði temizler.
cla(handles.dataTable);                 % Önceki iþlemden kalan iterasyon listesini temizler.

a=str2double(get(handles.katsayiA,'string'));       % Verilen fonksiyon için gerekli olan a ve c deðerlerini
c=str2double(get(handles.katsayiC,'string'));       % kullanýcýdan almak için gerekli olan kod ve çevirme iþlemi
xi=str2double(get(handles.altSinir,'string'));      % Alt ve üst deðerler kullanýcý tarafýndan alýnýyor.
xf=str2double(get(handles.ustSinir,'string'));

data=[];                % Ýterasyon tablosuna veri girmek için data dizisi oluþturdum.
x(1)=0;                 % x'in baþlangýç deðerini verdim.
errorBagil=1;           % Hata deðerlerini baþlangýç olarak 1 verdim.
errorFark=1;

data(1,1)=x(1);         % data dizisine ilk verileri atadým. 
data(1,2)=errorBagil;
data(1,3)=errorFark;

dif=fonk(xi,a,c)*fonk(xf,a,c);      % Bisection kuralýný þartýný hesapladým.  
xreel=(-c)^(1/a);       % Kullanýcýnýn girdiði deðerlere göre gerçek kök deðeri hesapladým.
set(handles.startValue,'string',(xi+xf)/2);     % Baþlangýç deðerini kullanýcýya göstermek için ekrana yazdýrýldý.

if(dif>0)           %Bisection kuralýna uymayan giriþ yapýlýrsa hata veriyor.
       f = msgbox({'Bisection Metodu';'Girilen aralýk deðerinde denklemin reel kökü yoktur.';'Lütfen baþka bir aralýk deðeri giriniz!!!'});
end

for i=2:1:1000
    
     if(errorFark>=0.000001 && errorBagil>0.00001)          % Ýterasyonun bitmesi için gerekli þart
         
         x(i)=(xi+xf)/2;                    % Ýterasyon iþlemi gerçekleþtiriyorum.
         fx=fonk(x(i),a,c);
             
             if(fx<0)
                xi=x(i);
             else
                xf=x(i);
             end

            errorBagil=abs(x(i)-xreel)/abs(xreel);      % Sonuçlar arasýndaki baðýl hata hesaplanýyor.
            errorFark=abs(x(i)-xreel);                  % Sonuçlar arasýndaki fark hesaplanýyor.
            data(i,1)=x(i);                             % Çýkan sonuçlarý data dizisine kaydettim.
            data(i,2)=errorBagil;
            data(i,3)=errorFark;
            line(handles.axes,[0,i+5],[xreel xreel]);   % Çýkan sonuçlarý anlýk olarak grafiðe çizdirdim.
            plot(handles.axes,i,x(i),'o');
            ylim(handles.axes,[xi-5 xf+5]);
            xlim(handles.axes,[0 i+5]);
            ylabel('Ýterayon sonucu');
            xlabel('Ýterasyon sayýsý');
            hold on;
            datacursormode on;
        else
        set(handles.dataTable,'data',data);             % Tüm iterasyon deðerlerini tabloya yazdýrdým.
        set(handles.resultBisection,'string',data(size(data,1),1));
        continue;
     end
end
