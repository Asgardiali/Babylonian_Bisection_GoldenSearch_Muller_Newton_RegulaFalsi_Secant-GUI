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

cla(handles.axes);          % Önceki iþlemden kalan grafiði temizler.
cla(handles.dataTable);     % Önceki iþlemden kalan iterasyon listesini temizler.

error=1;                    % Hata deðerlerini baþlangýç olarak 1 verdim.
result=1;

a=str2double(get(handles.katsayiA,'string'));   % Verilen fonksiyon için gerekli olan a ve c deðerlerini
c=str2double(get(handles.katsayiC,'string'));   % kullanýcýdan almak için gerekli olan kod ve çevirme iþlemi
data=[];                                        % Ýterasyon tablosuna veri girmek için data dizisi oluþturdum.

if(c<0 && a==2)             % Babylonian için gerekli þarlarý saðlamasýný için if kontrolü saðladým.
                            % þartlarý saðlamadýðý takdirde else içerisindeki uyarýyý veriyor.
    x0=(-c)^(1/a);          % Kullanýcýnýn girdiði deðerlere göre gerçek kök deðeri hesapladým.
    ustSinir=ceil(x0);      % Kullanýcýnýn girdiði alt ve üst sýnýrlarý aþaðý ve yukarý yuvarladým.
    altSinir=floor(x0);
    x(1)=(abs(ustSinir+altSinir))/2;            % Bu deðerlere göre baþlangýç deðerini hesapladým.
    set(handles.startValue,'string',x(1));      % Bu baþlangýç deðerini kullanýcýya gösterdim.
    data(1,3)=result;                           % Her iterasyonda ilk oluþturulan verileri diziye kaydettim.               
    data(1,2)=error;
    data(1,1)=x(1);

    for i=1:1:10000

    if(error>=0.00001 && result>=0.000001)      % Ýterasyonun durumunu kontrol etmek için if koþulu oluþturdum.
        
        x(i+1)=(1/a)*(x(i)+(-c/x(i)));          % Ýterasyon iþlemi gerçekleþtiriyorum.
        error=abs(x(i+1)-x0)/abs(x0);           % Sonuçlar arasýndaki baðýl hata hesaplanýyor.               
        result=abs(x(i+1)-x(i));                % Sonuçlar arasýndaki fark hesaplanýyor.
        plot(handles.axes,i,x(i),'o');          % Çýkan sonuçlarý anlýk olarak grafiðe çizdirdim.
        ylim(handles.axes,[altSinir-1 ustSinir]);
        xlim(handles.axes,[0 i+5]);
        ylabel('Ýterayon sonucu');
        xlabel('Ýterasyon sayýsý');
        hold on;
        datacursormode on;
        x(i)=x(i+1);                            % Ýterasyon sonucunda çýkan deðeri, iterasyon tekrar baþa döndüðünde 
        data(i+1,1)=x(i);                       % iþleme tekrardan baþlamasý içindir.
        data(i+1,2)=error;
        data(i+1,3)=result;

    else
        continue;
    end
    end
    set(handles.dataTable,'Data',data);         % Elde edilen data dizisini data table'a aktarýyor.
    set(handles.resultBabylonian,'string',data(size(data,1),1));
    line(handles.axes,[0,i+5],[x0,x0]);
    
else
    f = msgbox({'Babylonian Kuralý';'Fonksiyon ikinci dereceden olmalý';'Sabit sayý deðeri ise c<0 olmalýdýr.'});
end
