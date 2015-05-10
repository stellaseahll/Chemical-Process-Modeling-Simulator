function varargout = chapter8_pneumatictransport_simple(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @chapter8_pneumatictransport_simple_OpeningFcn, ...
    'gui_OutputFcn',  @chapter8_pneumatictransport_simple_OutputFcn, ...
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


function chapter8_pneumatictransport_simple_OpeningFcn(hObject, eventdata, handles, varargin)
%include functions
addpath(genpath('chapter8'));
addpath(genpath('chapter2'));
addpath(genpath('shared'));
addpath(genpath('conversion'));
handles.vis=0;
handles.denP=0;
handles.den=0;
handles.si=0;
handles.Ufsv=0;
handles.Mp=0;
handles.diameter=0;
handles.numBends=0;
handles.verticalLength=0;
handles.horizontalLength=0;
handles.strMp='kg/h';
handles.strUfsv='m/s';
handles.strDenP='kg/m3';
handles.strVis='Pas';
handles.strSi='m';
handles.strDen='kg/m3';
handles.strDiameter='m';
handles.strVerticalLength='m';
handles.strHorizontalLength='m';
handles.hor=0;
handles.ver=0;
handles.UFS=-1;
handles.DENF=-1;
handles.DENP=-1;
handles.VIS=-1;
handles.DIA=-1;
handles.MASSP=-1;
handles.SIZE=-1;
handles.HORIZONTALLENGTH=-1;
handles.VERTICALLENGTH=-1;
handles.NUMBENDS=-1;
handles.TYPE=-1;
handles.PTOTAL=-1;
handles.PVERTICAL=-1;
handles.PBEND=-1;
handles.PHORIZONTAL=-1;
handles.output = hObject;
set(handles.horizontal,'Value',0);
set(handles.vertical,'Value',0);
set(handles.none,'Value',1);

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes chapter8_pneumatictransport_simple wait for user response (see UIRESUME)
% uiwait(handles.calculate);


% --- Outputs from this function are returned to the command line.
function varargout = chapter8_pneumatictransport_simple_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;



function size_Callback(hObject, eventdata, handles)
si= str2double(get(hObject,'String'));
handles.si = si;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function size_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function density_Callback(hObject, eventdata, handles)
den= str2double(get(hObject,'String'));
handles.den = den;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function density_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function denP_Callback(hObject, eventdata, handles)
denP= str2double(get(hObject,'String'));
handles.denP = denP;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function denP_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function viscosity_Callback(hObject, eventdata, handles)
vis= str2double(get(hObject,'String'));
handles.vis = vis;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function viscosity_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menuSi.
function menuSi_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        strSi='m';
    case 2
        strSi='cm';
    case 3
        strSi='mm';
    case 4
        strSi='um';
    case 5
        strSi='ft';
    case 6
        strSi='in';
end
handles.strSi = strSi;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function menuSi_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menuDen.
function menuDen_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case {1,2}
        strDen='kg/m3';
    case {3}
        strDen='lb/ft3';
    case {4,5}
        strDen='g/cm3';
end
handles.strDen = strDen;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function menuDen_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menudenP.
function menudenP_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case {1,2}
        strDenP='kg/m3';
    case {3}
        strDenP='lb/ft3';
    case {4,5}
        strDenP='g/cm3';
end
handles.strDenP = strDenP;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function menudenP_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menuVis.
function menuVis_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        strVis='Pas';
    case 2
        strVis='cp';
    case 3
        strVis='psf.s';
    case 4
        strVis='lb/ft/s';
end
handles.strVis = strVis;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function menuVis_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
denF= convertDensity(handles.den,handles.strDen);
denP= convertDensity(handles.denP,handles.strDenP);
size= convertLength(handles.si,handles.strSi);
diameter=convertLength(handles.diameter,handles.strDiameter);
vis=convertViscosity(handles.vis,handles.strVis);
Mp=convertMassFlowRate(handles.Mp,handles.strMp,'kg/s');
Ufs=convertSpeed(handles.Ufsv,handles.strUfsv);
verticalLength=convertLength(handles.verticalLength,handles.strVerticalLength);
horizontalLength=convertLength(handles.horizontalLength,handles.strHorizontalLength);
numBends=handles.numBends;
if (get(handles.horizontal,'Value')==1)
    type=1;
elseif (get(handles.vertical,'Value')==1)
    type=2;
elseif (get(handles.none,'Value')==1)
    type=3;
end
errorCode=validateInput_chapter8_simple(denF,denP,vis,Ufs,size,diameter,Mp,verticalLength,horizontalLength,numBends,type); %%%%%%
if(~isempty(errorCode))
    handles.TYPE=-2;
    errorMessage = getErrorMessage(errorCode);
    errorMessage = sprintf(errorMessage);
    set(handles.errorBox,'String',errorMessage);
    set(handles.pTotal,'String','-');
    set(handles.pBend,'String','-');
    set(handles.pVertical,'String','-');
    set(handles.pHorizontal,'String','-');
    set(handles.Usalt,'String','-');
    set(handles.Uchoke,'String','-');
else
    set(handles.errorBox,'String','');
    Usalt=findSaltationConditions(Mp,denP,denF,size,diameter);
    Uchoke=findChokingConditions(Mp,denP,denF,size,vis,diameter);
    Usalt=round(Usalt*100000)/100000;
    Uchoke=round(Uchoke*100000)/100000;
    Ufs=round(Ufs*100000)/100000;
    if (verticalLength==0)
        set(handles.Usalt,'String',sprintf('%.5f m/s',Usalt));
        set(handles.Uchoke,'String','-');
        if (Ufs<Usalt)
            set(handles.errorBox,'String',sprintf('Error!\n\nSuperficial velocity cannot be smaller than saltation velocity'));
            set(handles.pTotal,'String','-');
            set(handles.pBend,'String','-');
            set(handles.pVertical,'String','-');
            set(handles.pHorizontal,'String','-');
            return;
        elseif (Ufs<1.5*Usalt)
            set(handles.errorBox,'String',sprintf('Warning!\n\nSuperficial velocity is less than 1.5 times saltation velocity, saltation may still occur'));
        else
            set(handles.errorBox,'String','');
        end
    elseif (horizontalLength==0)
        set(handles.Uchoke,'String',sprintf('%.5f m/s',Uchoke));
        set(handles.Usalt,'String','-');
        if (Ufs<Uchoke)
            set(handles.errorBox,'String',sprintf('Error!\n\nSuperficial velocity cannot be smaller than choking velocity'));
            set(handles.pTotal,'String','-');
            set(handles.pBend,'String','-');
            set(handles.pVertical,'String','-');
            set(handles.pHorizontal,'String','-');
            return;
        elseif (Ufs<1.5*Uchoke)
            set(handles.errorBox,'String',sprintf('Warning!\n\nSuperficial velocity is less than 1.5 times choking velocity, choking may still occur'));
        else
            set(handles.errorBox,'String','');
        end
    else
        set(handles.Uchoke,'String',sprintf('%.5f m/s',Uchoke));
        set(handles.Usalt,'String',sprintf('%.5f m/s',Usalt));
        if (Ufs<max([Usalt Uchoke]))
            set(handles.errorBox,'String',sprintf('Error!\n\nSuperficial velocity cannot be smaller than saltation/choking velocity'));
            set(handles.pTotal,'String','-');
            set(handles.pBend,'String','-');
            set(handles.pVertical,'String','-');
            set(handles.pHorizontal,'String','-');
            return;
        elseif (Ufs<max([Usalt Uchoke])*1.5)
            set(handles.errorBox,'String',sprintf('Warning!\n\nSuperficial velocity is less than 1.5 times saltation/choking velocity, saltation/choking may still occur'));
        else
            set(handles.errorBox,'String','');
        end
    end
    
    if (type==1)
        pHorizontal=findHorizontalPipeConditions(Mp,denP,denF,size,vis,diameter,horizontalLength,Ufs,1);
        pVertical=findVerticalPipeConditions(Mp,denP,denF,size,vis,diameter,verticalLength,0,Ufs,0);
    elseif (type==2)
        pHorizontal=findHorizontalPipeConditions(Mp,denP,denF,size,vis,diameter,horizontalLength,Ufs,0);
        pVertical=findVerticalPipeConditions(Mp,denP,denF,size,vis,diameter,verticalLength,0,Ufs,1);
    else
        pHorizontal=findHorizontalPipeConditions(Mp,denP,denF,size,vis,diameter,horizontalLength,Ufs,0);
        pVertical=findVerticalPipeConditions(Mp,denP,denF,size,vis,diameter,verticalLength,0,Ufs,0);
    end
    pBend=findBendConditions(Mp,denP,denF,size,vis,diameter,Ufs)*numBends;
    pTotal=pBend+pVertical+pHorizontal;
    if (horizontalLength~=0)
        set(handles.pHorizontal,'String',sprintf('%.4f Pa',pHorizontal));
    else
         set(handles.pHorizontal,'String','-');
    end
    if (verticalLength~=0)
         set(handles.pVertical,'String',sprintf('%.4f Pa',pVertical));
    else
         set(handles.pVertical,'String','-');
    end
    if (numBends~=0)
        set(handles.pBend,'String',sprintf('%.4f Pa',pBend));
    else
         set(handles.pBend,'String','-');
    end
    set(handles.pTotal,'String',sprintf('%.4f Pa',pTotal));
    handles.UFS=Ufs;
    handles.DENF=denF;
    handles.DENP=denP;
    handles.VIS=vis;
    handles.DIA=diameter;
    handles.MASSP=Mp;
    handles.SIZE=size;
    handles.HORIZONTALLENGTH=horizontalLength;
    handles.VERTICALLENGTH=verticalLength;
    handles.NUMBENDS=numBends;
    handles.TYPE=type;
    handles.PTOTAL=pTotal;
    handles.PVERTICAL=pVertical;
    handles.PBEND=pBend;
    handles.PHORIZONTAL=pHorizontal;
    guidata(hObject,handles);
end

function Ufsv_Callback(hObject, eventdata, handles)
Ufsv = str2double(get(hObject,'String'));
handles.Ufsv = Ufsv;
guidata(hObject,handles);

function Ufsv_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Mp_Callback(hObject, eventdata, handles)
Mp = str2double(get(hObject,'String'));
handles.Mp = Mp;
guidata(hObject,handles);

function Mp_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function diameter_Callback(hObject, eventdata, handles)
dia= str2double(get(hObject,'String'));
handles.diameter = dia;
guidata(hObject,handles);


function diameter_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in menuUfsv.
function menuUfsv_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        str14='m/s';
    case 2
        str14='ft/s';
    case 3
        str14='cm/s';
    case 4
        str14='mm/s';
    case 5
        str14='ft/min';
    case 6
        str14='m/min';
    case 7
        str14='cm/min';
    case 8
        str14='mm/min';
    case 9
        str14='km/h';
end
handles.strUfsv = str14;
guidata(hObject,handles);

function menuUfsv_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function menuMp_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        tmpstr='kg/h';
    case 2
        tmpstr='kg/min';
    case 3
        tmpstr='kg/s';
    case 4
        tmpstr='g/h';
    case 5
        tmpstr='g/min';
    case 6
        tmpstr='g/s';
    case 7
        tmpstr='lb/h';
    case 8
        tmpstr='lb/min';
    case 9
        tmpstr='lb/s';
end
handles.strMp = tmpstr;
guidata(hObject,handles);

function menuMp_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function menuDiameter_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function menuDiameter_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        tmpstr='m';
    case 2
        tmpstr='cm';
    case 3
        tmpstr='mm';
    case 4
        tmpstr='um';
    case 5
        tmpstr='ft';
    case 6
        tmpstr='in';
end
handles.strDiameter = tmpstr;
guidata(hObject,handles);

function addPipeType_Callback(hObject, eventdata, handles)
handles.pipeType = get(hObject,'Value');
guidata(hObject,handles);

function addPipeType_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function addPipeLength_Callback(hObject, eventdata, handles)
pipeLength= str2double(get(hObject,'String'));
handles.pipeLength = pipeLength;
guidata(hObject,handles);

function addPipeLength_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function horizontalLength_Callback(hObject, eventdata, handles)
tmp= str2double(get(hObject,'String'));
handles.horizontalLength = tmp;
guidata(hObject,handles);


function horizontalLength_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menuHorizontalLength.
function menuHorizontalLength_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        tmpstr='m';
    case 2
        tmpstr='cm';
    case 3
        tmpstr='km';
    case 4
        tmpstr='mm';
    case 5
        tmpstr='ft';
    case 6
        tmpstr='in';
    case 7
        tmpstr='mile';
end
handles.strHorizontalLength = tmpstr;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function menuHorizontalLength_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function verticalLength_Callback(hObject, eventdata, handles)
tmp= str2double(get(hObject,'String'));
handles.verticalLength = tmp;
guidata(hObject,handles);


function verticalLength_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function menuVerticalLength_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        tmpstr='m';
    case 2
        tmpstr='cm';
    case 3
        tmpstr='km';
    case 4
        tmpstr='mm';
    case 5
        tmpstr='ft';
    case 6
        tmpstr='in';
    case 7
        tmpstr='mile';
end
handles.strVerticalLength = tmpstr;
guidata(hObject,handles);

function menuVerticalLength_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function numBends_Callback(hObject, eventdata, handles)
tmp= str2double(get(hObject,'String'));
handles.numBends = tmp;
guidata(hObject,handles);

function numBends_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function showWorking_Callback(hObject, eventdata, handles)
Ufs=handles.UFS;
denF=handles.DENF;
denP=handles.DENP;
vis=handles.VIS;
dia=handles.DIA;
massP=handles.MASSP;
size=handles.SIZE;
horizontalLength=handles.HORIZONTALLENGTH;
verticalLength=handles.VERTICALLENGTH;
numBends=handles.NUMBENDS;
type=handles.TYPE;
pTotal=handles.PTOTAL;
pVertical=handles.PVERTICAL;
pBend=handles.PBEND;
pHorizontal=handles.PHORIZONTAL;
if (type==-2)
    errorMessage=sprintf('ERROR!\nInvalid input\nPlease reenter values and calculate before showing working');
     set(handles.errorBox,'String',errorMessage);
elseif (type==-1)
    errorMessage=sprintf('ERROR!\nPlease Calculate before showing working');
    set(handles.errorBox,'String',errorMessage);
else
    setappdata(0,'type',type);
    setappdata(0,'Ufs',Ufs);
    setappdata(0,'denF',denF);
    setappdata(0,'denP',denP);
    setappdata(0,'vis',vis);
    setappdata(0,'dia',dia);
    setappdata(0,'massP',massP);
    setappdata(0,'size',size);
    setappdata(0,'horizontalLength',horizontalLength);
    setappdata(0,'verticalLength',verticalLength);
    setappdata(0,'numBends',numBends);
    setappdata(0,'pHorizontal',pHorizontal);
    setappdata(0,'pVertical',pVertical);
    setappdata(0,'pTotal',pTotal);
    setappdata(0,'pBend',pBend);
    chapter8_pneumatictransport_simple_calculation
end


function horizontal_Callback(hObject, eventdata, handles)
set(handles.horizontal,'Value',1);
set(handles.vertical,'Value',0);
set(handles.none,'Value',0);

function vertical_Callback(hObject, eventdata, handles)
set(handles.horizontal,'Value',0);
set(handles.vertical,'Value',1);
set(handles.none,'Value',0);

function none_Callback(hObject, eventdata, handles)
set(handles.horizontal,'Value',0);
set(handles.vertical,'Value',0);
set(handles.none,'Value',1);
