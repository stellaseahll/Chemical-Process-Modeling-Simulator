function varargout = chapter8_pneumatictransport(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter8_pneumatictransport_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter8_pneumatictransport_OutputFcn, ...
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


function chapter8_pneumatictransport_OpeningFcn(hObject, eventdata, handles, varargin)
%include functions
addpath(genpath('chapter8'));
addpath(genpath('chapter2'));
addpath(genpath('shared'));
addpath(genpath('conversion'));
rotate3d on;
axes(handles.pipeDiag);
view(36,-10);
handles.pipeType=1;
handles.prevPipeType=0;
handles.pipeLength=0;
handles.unitPipeLength='m';
handles.deletePipeNumber=0;
handles.pipeNumber=1;
handles.details='Pipe Details';
handles.xyz=[0 0 0];
handles.storeType=0;
handles.storePipe=0;
handles.storeLength=0;
set(handles.isAccelerated,'Value',1);
set(handles.isNotAccelerated,'Value',0);
handles.vis=0;
handles.denP=0;
handles.den=0;
handles.si=0;
handles.Ufsv=0;
handles.Mp=0;
handles.diameter=0;
handles.strMp='kg/h';
handles.strUfsv='m/s';
handles.strDenP='kg/m3';
handles.strVis='Pas';
handles.strSi='m';
handles.strDen='kg/m3';
handles.strDiameter='m';
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

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes chapter8_pneumatictransport wait for user response (see UIRESUME)
% uiwait(handles.calculate);


% --- Outputs from this function are returned to the command line.
function varargout = chapter8_pneumatictransport_OutputFcn(hObject, eventdata, handles) 
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
pipeNumber=handles.pipeNumber;
errorCode=validateInput_chapter8(denF,denP,vis,Ufs,size,diameter,Mp,pipeNumber);
if(~isempty(errorCode))
    handles.TYPE=-2;
    errorMessage = getErrorMessage(errorCode);
    errorMessage = sprintf(errorMessage);
    set(handles.errorBox,'String',errorMessage);
    set(handles.pTotal,'String',0);
    set(handles.Usalt,'String',0);
    set(handles.Uchoke,'String',0);
    set(handles.pVertical,'String',0);
    set(handles.pHorizontal,'String',0);
    set(handles.pBend,'String',0);
else
    set(handles.errorBox,'String','');
    Usalt=findSaltationConditions(Mp,denP,denF,size,diameter);
    Uchoke=findChokingConditions(Mp,denP,denF,size,vis,diameter);
    Usalt=round(Usalt*1000000)/1000000;
    Uchoke=round(Uchoke*1000000)/1000000;
    storeType=handles.storeType;
    storeLength=handles.storeLength;
    if (sum(storeType==2)==0)
        set(handles.Usalt,'String',sprintf('%.4f m/s',Usalt));
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
    elseif (sum(storeType==1)==0)
        set(handles.Uchoke,'String',sprintf('%.4f m/s',Uchoke));
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
        set(handles.Uchoke,'String',sprintf('%.4f m/s',Uchoke));
        set(handles.Usalt,'String',sprintf('%.4f m/s',Usalt));
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
    verticalStoreLength=storeLength(storeType==2);
    horizontalLength=sum(storeLength(storeType==1));
    verticalLengthUp=sum(verticalStoreLength(verticalStoreLength>0));
    verticalLengthDown=abs(sum(verticalStoreLength(verticalStoreLength<0)));
    numBends=sum(handles.storeType==0);
    if (get(handles.isAccelerated,'Value')==1)
        type=3;
        pHorizontal=findHorizontalPipeConditions(Mp,denP,denF,size,vis,diameter,horizontalLength,Ufs,0);
        pVertical=findVerticalPipeConditions(Mp,denP,denF,size,vis,diameter,verticalLengthUp,verticalLengthDown,Ufs,0);
    elseif (handles.storeType(1)==1)
        type=1;
        pHorizontal=findHorizontalPipeConditions(Mp,denP,denF,size,vis,diameter,horizontalLength,Ufs,1);
        pVertical=findVerticalPipeConditions(Mp,denP,denF,size,vis,diameter,verticalLengthUp,verticalLengthDown,Ufs,0);
    else
        type=2;
        pHorizontal=findHorizontalPipeConditions(Mp,denP,denF,size,vis,diameter,horizontalLength,Ufs,0);
        pVertical=findVerticalPipeConditions(Mp,denP,denF,size,vis,diameter,verticalLengthUp,verticalLengthDown,Ufs,1);
    end
    pBend=findBendConditions(Mp,denP,denF,size,vis,diameter,Ufs)*numBends;
    pTotal=pHorizontal+pVertical+pBend;
    set(handles.pTotal,'String',sprintf('%.4f Pa',pTotal));
    if (sum(storeType==1)~=0)
        set(handles.pHorizontal,'String',sprintf('%.4f Pa',pHorizontal));
    else
         set(handles.pHorizontal,'String','-');
    end
    if (sum(storeType==2)~=0)
         set(handles.pVertical,'String',sprintf('%.4f Pa',pVertical));
    else
         set(handles.pVertical,'String','-');
    end
    if (sum(storeType==0)~=0)
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
    handles.VERTICALLENGTHUP=verticalLengthUp;
    handles.VERTICALLENGTHDOWN=verticalLengthDown;
    handles.NUMBENDS=numBends;
    handles.TYPE=type;
    handles.PTOTAL=pTotal;
    handles.PVERTICAL=pVertical;
    handles.PBEND=pBend;
    handles.PHORIZONTAL=pHorizontal;
    guidata(hObject, handles);
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
        tmpstr='km';
    case 4
        tmpstr='mm';
    case 5
        tmpstr='um';
    case 6
        tmpstr='ft';
    case 7
        tmpstr='in';
    case 8
        tmpstr='mile';
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

function menuLength_Callback(hObject, eventdata, handles)
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
handles.unitPipeLength = tmpstr;
guidata(hObject,handles);

function menuLength_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function addPipeButton_Callback(hObject, eventdata, handles)
prevPipeType=handles.prevPipeType;
pipeType = handles.pipeType;
pipeLength = convertLength(handles.pipeLength,handles.unitPipeLength);
errorCode=validateInput_chapter8_graph(pipeLength,pipeType,prevPipeType);
if(~isempty(errorCode))
    errorMessage = getErrorMessage(errorCode);
    errorMessage = sprintf(errorMessage);
    set(handles.errorBoxPipe,'String',errorMessage);
else
    set(handles.errorBoxPipe,'String','');
    pipeNumber = handles.pipeNumber;
    if (pipeType<=2)
        handles.storeType(pipeNumber)=1; %horizontal
    elseif (pipeType<=6)
        handles.storeType(pipeNumber)=2; %vertical
    else
        handles.storeType(pipeNumber)=0; %bend
    end
    if (pipeType>6)
        handles.storeLength(pipeNumber)=NaN;
    elseif (pipeType==6)
        handles.storeLength(pipeNumber)=-pipeLength;
    else
        handles.storeLength(pipeNumber)=pipeLength;
    end
    handles.storePipe(pipeNumber)=pipeType;
    pipeNumber = pipeNumber+1;
    pipeStr=getPipeStr(pipeType);
    set(handles.pipeNumberGUI,'String',pipeNumber);
    handles.pipeNumber=pipeNumber;
    if (pipeType<=6)
        handles.details=strvcat(handles.details,sprintf('%s, Length= %.3f m\n',pipeStr,pipeLength));
    else
        handles.details=strvcat(handles.details,sprintf('%s\n',pipeStr));
    end
    axes(handles.pipeDiag);
    setGraph();
    handles.xyz=drawPipe(pipeLength,pipeType,prevPipeType,handles.xyz,pipeNumber);
    set(handles.pipeDetails,'String',handles.details);
    handles.prevPipeType=pipeType;
    set(handles.errorBoxPipe,'String','');
    guidata(hObject,handles);
end
    
    

function pipeStr=getPipeStr(pipeType)
switch pipeType
    case 1
        pipeStr='Horizontal (Forward)';
        return;
    case 2
        pipeStr='Horizontal (Backward)';
        return;
    case 3
        pipeStr='Horizontal (Right)';
        return;
    case 4
        pipeStr='Horizontal (Left)';
        return;
    case 5
        pipeStr='Vertical (Up)';
        return;
    case 6
        pipeStr='Vertical (Down)';
        return;
    case 7
        pipeStr='Bend (Forward)';
        return;
    case 8
        pipeStr='Bend (Backward)';
        return;
    case 9
        pipeStr='Bend (Right)';
        return;
    case 10
        pipeStr='Bend (Left)';
        return;
    case 11
        pipeStr='Bend (Up)';
        return;
    case 12
        pipeStr='Bend (Down)';
        return;
end
        

% --- Executes on selection change in pipeDetails.
function pipeDetails_Callback(hObject, eventdata, handles)
% hObject    handle to pipeDetails (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pipeDetails contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pipeDetails

function pipeDetails_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function deletePipeNumber_Callback(hObject, eventdata, handles)




function deletePipeNumber_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function deletePipeButton_Callback(hObject, eventdata, handles)
if (handles.pipeNumber==1)
    set(handles.errorBoxPipe,'String',sprintf('Error!\n\nNothing to delete'));
    return;
elseif (handles.pipeNumber==2)
    handles.storeLength=0;
    handles.prevPipeType=0;
    handles.storePipe=0;
    handles.storeType=0;
    handles.pipeNumber=1;
    handles.xyz=[0 0 0];
    handles.details='Pipe Details';
    set(handles.pipeDetails,'String',handles.details);
    set(handles.pipeNumberGUI,'String',1);
    axes(handles.pipeDiag);
    cla;
    guidata(hObject,handles);
   return;
end
type=handles.storePipe;
prev=[0 type(1:end-1)];
pipeLength=handles.storeLength;
pipeNumber=handles.pipeNumber;
axes(handles.pipeDiag);
cla;
setGraph();
XYZ=[0 0 0];
handles.details='Pipe Details';
for i=1:length(type)-1
    XYZ=drawPipe(pipeLength(i),type(i),prev(i),XYZ,i-1);
    pipeStr=getPipeStr(type(i));
    if (type(i)<=6)
        handles.details=strvcat(handles.details,sprintf('%s, Length= %.3f m\n',pipeStr,pipeLength(i)));
    else
        handles.details=strvcat(handles.details,sprintf('%s\n',pipeStr));
    end
end
set(handles.pipeDetails,'String',handles.details);
set(handles.pipeNumberGUI,'String',pipeNumber-1);
handles.xyz=XYZ;
handles.prevPipeType=type(end-1);
handles.storePipe=handles.storePipe(1:end-1);
handles.storeLength=handles.storeLength(1:end-1);
handles.storeType=handles.storeType(1:end-1);
handles.pipeNumber=handles.pipeNumber-1;
guidata(hObject,handles);
   
    


% --- Executes on button press in showWorking.
function showWorking_Callback(hObject, eventdata, handles)
Ufs=handles.UFS;
denF=handles.DENF;
denP=handles.DENP;
vis=handles.VIS;
dia=handles.DIA;
massP=handles.MASSP;
size=handles.SIZE;
horizontalLength=handles.HORIZONTALLENGTH;
verticalLengthUp=handles.VERTICALLENGTHUP;
verticalLengthDown=handles.VERTICALLENGTHDOWN;
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
    setappdata(0,'verticalLengthUp',verticalLengthUp);
    setappdata(0,'verticalLengthDown',verticalLengthDown);
    setappdata(0,'numBends',numBends);
    setappdata(0,'pHorizontal',pHorizontal);
    setappdata(0,'pVertical',pVertical);
    setappdata(0,'pTotal',pTotal);
    setappdata(0,'pBend',pBend);
    chapter8_pneumatictransport_calculation
end



% --- Executes on button press in isAccelerated.
function isAccelerated_Callback(hObject, eventdata, handles)
set(handles.isAccelerated,'Value',1);
set(handles.isNotAccelerated,'Value',0);

% --- Executes on button press in isNotAccelerated.
function isNotAccelerated_Callback(hObject, eventdata, handles)
set(handles.isAccelerated,'Value',0);
set(handles.isNotAccelerated,'Value',1);
