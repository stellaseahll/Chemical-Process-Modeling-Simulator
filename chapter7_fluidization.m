function varargout = chapter7_fluidization(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter7_fluidization_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter7_fluidization_OutputFcn, ...
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


function chapter7_fluidization_OpeningFcn(hObject, eventdata, handles, varargin)
%include functions
addpath(genpath('chapter7'));
addpath(genpath('chapter2'));
addpath(genpath('chapter3'));
addpath(genpath('shared'));
addpath(genpath('conversion'));
handles.vis=0;
handles.denP=0;
handles.den=0;
handles.si=0;
handles.Ufsv=0;
handles.massP=0;
handles.bedDiameter=0;
handles.bedHeight=0;
handles.strBedHeight='m';
handles.strMp='kg/h';
handles.strUfsv='m/s';
handles.strDenP='kg/m3';
handles.strVis='Pas';
handles.strSi='m';
handles.strDen='kg/m3';
handles.strDiameter='m';
handles.VIS=-1;
handles.DENP=-1;
handles.DEN=-1;
handles.SI=-1;
handles.UFSV=-1;
handles.MASSP=-1;
handles.DIA=-1;
handles.HEIGHT=-1;
handles.UMF=-1;
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes chapter7_fluidization wait for user response (see UIRESUME)
% uiwait(handles.calculate);


% --- Outputs from this function are returned to the command line.
function varargout = chapter7_fluidization_OutputFcn(hObject, eventdata, handles) 
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
bedDiameter=convertLength(handles.bedDiameter,handles.strDiameter);
vis=convertViscosity(handles.vis,handles.strVis);
massP=convertMassFlowRate(handles.massP,handles.strMp);
Ufs=convertSpeed(handles.Ufsv,handles.strUfsv);
bedHeight=convertLength(handles.bedHeight,handles.strBedHeight);
errorCode=validateInput_chapter7(denF,denP,vis,Ufs,size,bedDiameter,massP,bedHeight); %%%%%%
if(~isempty(errorCode))
    errorMessage = getErrorMessage(errorCode);
    errorMessage = sprintf(errorMessage);
    set(handles.errorBox,'String',errorMessage);
    set(handles.por,'String','-');
    set(handles.Umf,'String','-');
    set(handles.porFinal,'String','-');
    set(handles.heightFinal,'String','-');
    set(handles.Pfric,'String','-');
    set(handles.pTotal,'String','-');
    set(handles.isFluidized,'String','');
    handles.SI=-2;
    guidata(hObject,handles); 
else
    set(handles.errorBox,'String','');
    [pormf Umf Pfric]=findFluidizationCondition(denF, denP, massP, size, vis,bedHeight, bedDiameter);
     if (pormf<0)
        handles.SI=-2;
        set(handles.errorBox,'String',sprintf('ERROR!\n\nInvalid input\n\nTotal volume of particles = %.5f m3 which is more than volume of bed = %.5f m3.\n\nTry reducing mass of particles or increase volume of bed',massP/denP,bedHeight*pi*bedDiameter^2/4));
        set(handles.por,'String','-');
        set(handles.Umf,'String','-');
        set(handles.porFinal,'String','-');
        set(handles.heightFinal,'String','-');
        set(handles.Pfric,'String','-');
        set(handles.pTotal,'String','-');
        set(handles.isFluidized,'String','');
        guidata(hObject,handles); 
        return;
    end
    [por height Pfric Ptotal Ut] =findBedCondition(denF,denP,massP,size,vis,bedHeight,bedDiameter,Ufs,pormf,Umf,Pfric);
    if (round(por*10000)>=10000)
        handles.SI=-2;
        set(handles.errorBox,'String',sprintf('ERROR!\n\nInvalid input!!\n\nSuperficial velocity entered is greater than terminal velocity of single particle = %.5f m/s which causes particles to flow along with fluid',Ut));
        set(handles.por,'String','-');
        set(handles.Umf,'String','-');
        set(handles.porFinal,'String','-');
        set(handles.heightFinal,'String','-');
        set(handles.Pfric,'String','-');
        set(handles.pTotal,'String','-');
        set(handles.isFluidized,'String','');
        guidata(hObject,handles); 
        return;
    end
    if (Ufs>Umf)
        set(handles.isFluidized,'String','Fluidized');
    else
        set(handles.isFluidized,'String','Not Fluidized');
    end
    set(handles.por,'String',sprintf('%.4f',pormf));
    set(handles.Umf,'String',sprintf('%.5f m/s',Umf));
    set(handles.porFinal,'String',sprintf('%.4f',por));
    set(handles.heightFinal,'String',sprintf('%.4f m',height));
    set(handles.Pfric,'String',sprintf('%.4f Pa',Pfric));
    set(handles.pTotal,'String',sprintf('%.4f Pa',Ptotal));
    handles.VIS=vis;
    handles.DENP=denP;
    handles.DEN=denF;
    handles.SI=size;
    handles.UFSV=Ufs;
    handles.UMF=Umf;
    handles.MASSP=massP;
    handles.DIA=bedDiameter;
    handles.HEIGHT=bedHeight;
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


function massP_Callback(hObject, eventdata, handles)
Mp = str2double(get(hObject,'String'));
handles.massP = Mp;
guidata(hObject,handles); 

function massP_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function bedDiameter_Callback(hObject, eventdata, handles)
dia= str2double(get(hObject,'String'));
handles.bedDiameter = dia;
guidata(hObject,handles); 


function bedDiameter_CreateFcn(hObject, eventdata, handles)
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
        tmpstr='kg';
    case 2
        tmpstr='g';
    case 3
        tmpstr='lb';
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


function bedHeight_Callback(hObject, eventdata, handles)
tmp= str2double(get(hObject,'String'));
handles.bedHeight = tmp;
guidata(hObject,handles); 


function bedHeight_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menuBedHeight.
function menuBedHeight_Callback(hObject, eventdata, handles)
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
handles.strBedHeight = tmpstr;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function menuBedHeight_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in showWorking.
function showWorking_Callback(hObject, eventdata, handles)
vis=handles.VIS;
denP=handles.DENP;
denF=handles.DEN;
size=handles.SI;
Ufs=handles.UFSV;
Umf=handles.UMF;
massP=handles.MASSP;
dia=handles.DIA;
height=handles.HEIGHT;
if (size==-2)
    errorMessage=sprintf('ERROR!\n\nInvalid input\n\nPlease reenter values and calculate before showing working');
     set(handles.errorBox,'String',errorMessage);
elseif (size==-1)
    errorMessage=sprintf('ERROR!\n\nPlease calculate before showing working');
    set(handles.errorBox,'String',errorMessage);
else
    setappdata(0,'Ufs',Ufs);
    setappdata(0,'denF',denF);
    setappdata(0,'denP',denP);
    setappdata(0,'vis',vis);
    setappdata(0,'massP',massP);
    setappdata(0,'size',size);
    setappdata(0,'height',height);
    setappdata(0,'dia',dia);
    setappdata(0,'Umf',Umf);
    chapter7_fluidization_calculation
end
    
