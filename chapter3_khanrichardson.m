function varargout = chapter3_khanrichardson(varargin)
% CHAPTER3_KHANRICHARDSON MATLAB code for chapter3_khanrichardson.fig
%      CHAPTER3_KHANRICHARDSON, by itself, creates a new CHAPTER3_KHANRICHARDSON or raises the existing
%      singleton*.
%
%      H = CHAPTER3_KHANRICHARDSON returns the handle to a new CHAPTER3_KHANRICHARDSON or the handle to
%      the existing singleton*.
%
%      CHAPTER3_KHANRICHARDSON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER3_KHANRICHARDSON.M with the given input arguments.
%
%      CHAPTER3_KHANRICHARDSON('Property','Value',...) creates a new CHAPTER3_KHANRICHARDSON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter3_khanrichardson_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter3_khanrichardson_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter3_khanrichardson

% Last Modified by GUIDE v2.5 27-Dec-2013 17:41:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_khanrichardson_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_khanrichardson_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before chapter3_khanrichardson is made visible.
function chapter3_khanrichardson_OpeningFcn(hObject, eventdata, handles, varargin)
%include functions
addpath(genpath('chapter3'));
addpath(genpath('shared'));
addpath(genpath('conversion'));

Ut=0;
n=0;
handles.Re=-1;
handles.UT=-1;
handles.DENF=-1;
handles.DENP=-1;
handles.VIS=-1;
handles.SIZE=-1;
handles.DIA=-1;
handles.Cd=-1;
handles.Ar=-1;
handles.n=-1;
handles.dia=0;
handles.sp=1;
handles.vis=0;
handles.denP=0;
handles.den=0;
handles.si=0;
handles.strDenP='kg/m3';
handles.strVis='Pas';
handles.strSi='m';
handles.strDia='m';
handles.strDen='kg/m3';
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes chapter3_khanrichardson wait for user response (see UIRESUME)
% uiwait(handles.calculate);


% --- Outputs from this function are returned to the command line.
function varargout = chapter3_khanrichardson_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
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



function sphericity_Callback(hObject, eventdata, handles)
sp= str2double(get(hObject,'String'));
handles.sp = sp;
guidata(hObject,handles); 

% --- Executes during object creation, after setting all properties.
function sphericity_CreateFcn(hObject, eventdata, handles)
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
handles.strDen=strDen;
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
diameter= convertLength(handles.diameter,handles.strDia);
viscosity=convertViscosity(handles.vis,handles.strVis);
sp=handles.sp;

errorCode=validateInput_chapter3_thickener_KRLaw(denF,denP,size,viscosity,diameter);

if(~isempty(errorCode))
    handles.Re=-2;
    errorMessage = getErrorMessage(errorCode);
    errorMessage = sprintf(errorMessage);
    set(handles.errorBox,'String',errorMessage);
    set(handles.krUt,'String','-');
    set(handles.krN,'String','-');
    Ut=0;
    n=0;
else
    set(handles.errorBox,'String','');
    [n Ut Ar Re Cd]=findFlux_KhanRichardson(denF,denP,size,viscosity,diameter);
    set(handles.krUt,'String',sprintf('%.5f m/s',Ut));
    set(handles.krN,'String',n);
    handles.Re=Re;
    handles.UT=Ut;
    handles.DENF=denF;
    handles.DENP=denP;
    handles.VIS=viscosity;
    handles.SIZE=size;
    handles.DIA=diameter;
    handles.Cd=Cd;
    handles.Ar=Ar;
    handles.n=n;
end
setappdata(0,'Ut',Ut);
setappdata(0,'n',n);

guidata(hObject,handles); 



function diameter_Callback(hObject, eventdata, handles)
diameter= str2double(get(hObject,'String'));
handles.diameter = diameter;
guidata(hObject,handles); 

% --- Executes during object creation, after setting all properties.
function diameter_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menuDiameter.
function menuDiameter_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        strDia='m';
    case 2
        strDia='cm';
    case 3
        strDia='mm';
    case 4
        strDia='um';
    case 5
        strDia='ft';
    case 6
        strDia='in';
end
handles.strDia = strDia;
guidata(hObject,handles); 

function menuDiameter_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function showWorking_Callback(hObject, eventdata, handles)

if (handles.Re==-2)
    errorMessage=sprintf('ERROR!\nInvalid input\nPlease reenter values and calculate before showing working');
     set(handles.errorBox,'String',errorMessage);
elseif ((handles.Re==-1)||(handles.UT==-1)||(handles.DENF==-1)||(handles.DENP==-1)||(handles.VIS==-1)||(handles.SIZE==-1))
    errorMessage=sprintf('ERROR!\nPlease Calculate before showing working');
    set(handles.errorBox,'String',errorMessage);
else
    setappdata(0,'Re',handles.Re);
    setappdata(0,'UT',handles.UT);
    setappdata(0,'denF',handles.DENF);
    setappdata(0,'denP',handles.DENP);
    setappdata(0,'vis',handles.VIS);
    setappdata(0,'size',handles.SIZE);
    setappdata(0,'dia',handles.DIA);
    setappdata(0,'Cd',handles.Cd);
    setappdata(0,'Ar',handles.Ar);
    setappdata(0,'n',handles.n);
    chapter3_khanrichardson_calculation
end
