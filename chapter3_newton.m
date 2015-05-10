function varargout = chapter3_newton(varargin)
% CHAPTER3_NEWTON MATLAB code for chapter3_newton.fig
%      CHAPTER3_NEWTON, by itself, creates a new CHAPTER3_NEWTON or raises the existing
%      singleton*.
%
%      H = CHAPTER3_NEWTON returns the handle to a new CHAPTER3_NEWTON or the handle to
%      the existing singleton*.
%
%      CHAPTER3_NEWTON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER3_NEWTON.M with the given input arguments.
%
%      CHAPTER3_NEWTON('Property','Value',...) creates a new CHAPTER3_NEWTON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter3_newton_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter3_newton_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter3_newton

% Last Modified by GUIDE v2.5 27-Dec-2013 16:33:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_newton_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_newton_OutputFcn, ...
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


% --- Executes just before chapter3_newton is made visible.
function chapter3_newton_OpeningFcn(hObject, eventdata, handles, varargin)
%include functions
addpath(genpath('chapter3'));
addpath(genpath('shared'));
addpath(genpath('conversion'));
n=0;
Uts=0;
handles.Re=-1;
handles.UT=-1;
handles.DENF=-1;
handles.DENP=-1;
handles.VIS=-1;
handles.SIZE=-1;
handles.sp=1;
handles.vis=0;
handles.denP=0;
handles.den=0;
handles.si=0;
handles.strDenP='kg/m3';
handles.strVis='Pas';
handles.strSi='m';
handles.strDen='kg/m3';
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes chapter3_newton wait for user response (see UIRESUME)
% uiwait(handles.calculate);


% --- Outputs from this function are returned to the command line.
function varargout = chapter3_newton_OutputFcn(hObject, eventdata, handles) 
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
viscosity=convertViscosity(handles.vis,handles.strVis);


errorCode=validateInput_chapter3_thickener_StokesAndNewton(denF,denP,size,viscosity);

if(~isempty(errorCode))
    errorMessage = getErrorMessage(errorCode);
    errorMessage = sprintf(errorMessage);
    set(handles.errorBox,'String',errorMessage);
    set(handles.isNewton,'String','Not Applicable');
    set(handles.newtonUt,'String','-');
    set(handles.newtonN,'String','-');
    Uts=0;
    n=0;
    handles.Re=-2;
else
    set(handles.errorBox,'String','');
    [n,Uts, warningStr,Re]=findFlux_Newton(denF,denP,size,viscosity);
    if (Uts~=0&&isempty(warningStr))
        set(handles.isNewton,'String','Applicable');
        set(handles.newtonUt,'String',sprintf('%.5f m/s',Uts));
        set(handles.newtonN,'String',n);
    else
        set(handles.isNewton,'String','Not Applicable');
        set(handles.newtonUt,'String',sprintf('%.5f m/s',Uts));
        set(handles.newtonN,'String',n);
    end
    set(handles.errorBox,'String',warningStr);
    handles.Re = Re;
    handles.UT=Uts;
    handles.DENF=denF;
    handles.DENP=denP;
    handles.VIS=viscosity;
    handles.SIZE=size;
end

setappdata(0,'Ut',Uts);
setappdata(0,'n',n);
guidata(hObject,handles); 


function showWorking_Callback(hObject, eventdata, handles)
Re=handles.Re;
UT=handles.UT;
DENF=handles.DENF;
DENP=handles.DENP;
VIS=handles.VIS;
SIZE=handles.SIZE;
if (Re==-2)
    errorMessage=sprintf('ERROR!\nInvalid input\nPlease reenter values and calculate before showing working');
     set(handles.errorBox,'String',errorMessage);
elseif ((Re==-1)||(UT==-1)||(DENF==-1)||(DENP==-1)||(VIS==-1)||(SIZE==-1))
    errorMessage=sprintf('ERROR!\nPlease Calculate before showing working');
    set(handles.errorBox,'String',errorMessage);
else
    setappdata(0,'re',handles.Re);
    setappdata(0,'UT',handles.UT);
    setappdata(0,'denF',handles.DENF);
    setappdata(0,'denP',handles.DENP);
    setappdata(0,'vis',handles.VIS);
    setappdata(0,'size',handles.SIZE);
    chapter3_newton_calculation
end
