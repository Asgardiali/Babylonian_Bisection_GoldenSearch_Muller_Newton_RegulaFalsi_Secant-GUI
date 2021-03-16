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

cla(handles.axes);                      % Önceki iþlemden kalan grafiði temizler.
cla(handles.dataTable);                 % Önceki iþlemden kalan iterasyon listesini temizler.

a=str2double(get(handles.katsayiA,'string'));           % Verilen fonksiyon için gerekli olan a ve c deðerlerini
c=str2double(get(handles.katsayiC,'string'));           % kullanýcýdan almak için gerekli olan kod ve çevirme iþlemi
xi=str2double(get(handles.altSinir,'string'));          % Alt ve üst deðerler kullanýcý tarafýndan alýnýyor.
xf=str2double(get(handles.ustSinir,'string'));

if (fonk(xi,a,c)*fonk(xf,a,c)<0)            % Regule Falsi kuralýný þartýný hesapladým.
    
    str="x^"+a+c;
    xmreel=fzero(str,[xi, xf]);             % Kullanýcýnýn girdiði deðerlere göre gerçek kök deðeri hesapladým.

    data=[];                                % Ýterasyon tablosuna veri girmek için data dizisi oluþturdum.
    errorFark=1;                            % Hata deðerlerini baþlangýç olarak 1 verdim.
    errorBagil=1;
    epsilon=0.00001;
    xm=xf;
    xmold=xi+5;
    iter=1000;                              % Maksimum iterasyon sayýsý
    data(1,1)=xmold;                        % data dizisine ilk verileri atadým.
    data(1,2)=errorBagil;
    data(1,3)=errorFark;

    for i=1:1:100

        if (abs(xmreel-xm)>epsilon && errorFark>0.000001)           % Ýterasyonun bitmesi için gerekli þart

            if(fonk(xi,a,c)*fonk(xf,a,c)<0 )                        % Ýterasyon iþlemi gerçekleþtiriyorum.

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

                data(i,1)=xm;                               % Çýkan sonuçlarý data dizisine kaydettim.
                data(i,2)=abs(xmreel-xm)/abs(xmreel);       % Sonuçlar arasýndaki baðýl hata hesaplanýyor.
                data(i,3)=abs(xm-xmold);                    % Sonuçlar arasýndaki fark hesaplanýyor.
                xmold=xm;
                line(handles.axes,[0,i+5],[xmreel xmreel]); % Çýkan sonuçlarý anlýk olarak grafiðe çizdirdim.
                plot(handles.axes,i,xm,'o');
                ylim(handles.axes,[xi-5 xf+5]);
                xlim(handles.axes,[0 i]);
                ylabel('Ýterayon sonucu');
                xlabel('Ýterasyon sayýsý')
                hold on;
                datacursormode on;
            else
                % Kullanýcýnýn girdiði aralýkta kök yoksa hata veriyor.
                f = msgbox({'Regule Falsi Metodu';'Girilen aralýk deðerinde denklemin reel kökü yoktur.';'Lütfen baþka bir aralýk deðeri giriniz!!!'});
                break;

            end

        else
            continue;      
        end
        i=i+1;
        set(handles.dataTable,'data',data); % Tüm iterasyon deðerlerini tabloya yazdýrdým.
    end
    legend('Xi','Xf','Xmreel','Xm');
    
else            %Regula Falsi kuralýna uymayan giriþ yapýlýrsa hata veriyor.
    f = msgbox({'Regule Falsi Metodu';'Girilen aralýk deðerinde denklemin reel kökü yoktur.';'Lütfen baþka bir aralýk deðeri giriniz!!!'});
end
