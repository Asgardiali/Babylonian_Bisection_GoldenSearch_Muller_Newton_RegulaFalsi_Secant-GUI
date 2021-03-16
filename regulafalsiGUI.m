function varargout = regulafalsiGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @regulafalsiGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @regulafalsiGUI_OutputFcn, ...
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

function regulafalsiGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);


function varargout = regulafalsiGUI_OutputFcn(hObject, eventdata, handles) 

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

function resultReguleFalsi_Callback(hObject, eventdata, handles)

function resultReguleFalsi_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function startValue_Callback(hObject, eventdata, handles)

function startValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calcReguleFalsi_Callback(hObject, eventdata, handles)

cla(handles.axes);                      % �nceki i�lemden kalan grafi�i temizler.
cla(handles.dataTable);                 % �nceki i�lemden kalan iterasyon listesini temizler.

a=str2double(get(handles.katsayiA,'string'));           % Verilen fonksiyon i�in gerekli olan a ve c de�erlerini
c=str2double(get(handles.katsayiC,'string'));           % kullan�c�dan almak i�in gerekli olan kod ve �evirme i�lemi
xi=str2double(get(handles.altSinir,'string'));          % Alt ve �st de�erler kullan�c� taraf�ndan al�n�yor.
xf=str2double(get(handles.ustSinir,'string'));

if (fonk(xi,a,c)*fonk(xf,a,c)<0)            % Regule Falsi kural�n� �art�n� hesaplad�m.
    
    str="x^"+a+c;
    xmreel=fzero(str,[xi, xf]);             % Kullan�c�n�n girdi�i de�erlere g�re ger�ek k�k de�eri hesaplad�m.

    data=[];                                % �terasyon tablosuna veri girmek i�in data dizisi olu�turdum.
    errorFark=1;                            % Hata de�erlerini ba�lang�� olarak 1 verdim.
    errorBagil=1;
    epsilon=0.00001;
    xm=xf;
    xmold=xi+5;
    iter=1000;                              % Maksimum iterasyon say�s�
    data(1,1)=xmold;                        % data dizisine ilk verileri atad�m.
    data(1,2)=errorBagil;
    data(1,3)=errorFark;

    for i=1:1:100

        if (abs(xmreel-xm)>epsilon && errorFark>0.000001)           % �terasyonun bitmesi i�in gerekli �art

            if(fonk(xi,a,c)*fonk(xf,a,c)<0 )                        % �terasyon i�lemi ger�ekle�tiriyorum.

                plot(handles.axes,i,xi,'*');
                hold on
                plot(handles.axes,i,xf,'d');
                hold on

                xm=((xi*fonk(xf,a,c))-(xf*fonk(xi,a,c)))/(fonk(xf,a,c)-fonk(xi,a,c));

                if(fonk(xm,a,c)<0)            
                    xi=xm;
                else
                    xf=xm;
                end

                data(i,1)=xm;                               % ��kan sonu�lar� data dizisine kaydettim.
                data(i,2)=abs(xmreel-xm)/abs(xmreel);       % Sonu�lar aras�ndaki ba��l hata hesaplan�yor.
                data(i,3)=abs(xm-xmold);                    % Sonu�lar aras�ndaki fark hesaplan�yor.
                xmold=xm;
                line(handles.axes,[0,i+5],[xmreel xmreel]); % ��kan sonu�lar� anl�k olarak grafi�e �izdirdim.
                plot(handles.axes,i,xm,'o');
                ylim(handles.axes,[xi-5 xf+5]);
                xlim(handles.axes,[0 i]);
                ylabel('�terayon sonucu');
                xlabel('�terasyon say�s�')
                hold on;
                datacursormode on;
            else
                % Kullan�c�n�n girdi�i aral�kta k�k yoksa hata veriyor.
                f = msgbox({'Regule Falsi Metodu';'Girilen aral�k de�erinde denklemin reel k�k� yoktur.';'L�tfen ba�ka bir aral�k de�eri giriniz!!!'});
                break;

            end

        else
            continue;      
        end
        i=i+1;
        set(handles.dataTable,'data',data); % T�m iterasyon de�erlerini tabloya yazd�rd�m.
    end
    legend('Xi','Xf','Xmreel','Xm');
    
else            %Regula Falsi kural�na uymayan giri� yap�l�rsa hata veriyor.
    f = msgbox({'Regule Falsi Metodu';'Girilen aral�k de�erinde denklemin reel k�k� yoktur.';'L�tfen ba�ka bir aral�k de�eri giriniz!!!'});
end
