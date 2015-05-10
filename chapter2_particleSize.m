function varargout = chapter2_particleSize(varargin)
% CHAPTER2_PARTICLESIZE MATLAB code for chapter2_particleSize.fig
%      CHAPTER2_PARTICLESIZE, by itself, creates a new CHAPTER2_PARTICLESIZE or raises the existing
%      singleton*.
%
%      H = CHAPTER2_PARTICLESIZE returns the handle to a new CHAPTER2_PARTICLESIZE or the handle to
%      the existing singleton*.
%
%      CHAPTER2_PARTICLESIZE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER2_PARTICLESIZE.M with the given input arguments.
%
%      CHAPTER2_PARTICLESIZE('Property','Value',...) creates a new CHAPTER2_PARTICLESIZE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter2_particleSize_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter2_particleSize_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter2_particleSize

% Last Modified by GUIDE v2.5 27-Dec-2013 15:47:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter2_particleSize_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter2_particleSize_OutputFcn, ...
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


% --- Executes just before chapter2_particleSize is made visible.
function chapter2_particleSize_OpeningFcn(hObject, eventdata, handles, varargin)
%include functions
addpath(genpath('chapter2'));
addpath(genpath('shared'));
addpath(genpath('conversion'));

handles.Res=-1;
handles.Ren=-1;
handles.Ut=-1;
handles.DENF=-1;
handles.DENP=-1;
handles.VIS=-1;
handles.SPHERICITY=-1;
handles.SIZE=-1;
handles.Re=-1;
handles.Cd=-1;
handles.sp=1;
handles.vis=0;
handles.denP=0;
handles.den=0;
handles.vel=0;
handles.strDenP='kg/m3';
handles.strVis='Pas';
handles.strVel='m/s';
handles.strDen='kg/m3';
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes chapter2_particleSize wait for user response (see UIRESUME)
% uiwait(handles.calculate);


% --- Outputs from this function are returned to the command line.
function varargout = chapter2_particleSize_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function vel_Callback(hObject, eventdata, handles)
vel= str2double(get(hObject,'String'));
handles.vel = vel;
guidata(hObject,handles); 

% --- Executes during object creation, after setting all properties.
function vel_CreateFcn(hObject, eventdata, handles)
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


% --- Executes on selection change in menuVel.
function menuVel_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        strVel='m/s';
    case 2
        strVel='ft/s';
    case 3
        strVel='cm/s';
    case 4
        strVel='mm/s';
    case 5
        strVel='ft/min';
    case 6
        strVel='m/min';
    case 7
        strVel='cm/min';
    case 8
        strVel='mm/min';
    case 9
        strVel='km/h';
end
handles.strVel = strVel;
guidata(hObject,handles); 


% --- Executes during object creation, after setting all properties.
function menuVel_CreateFcn(hObject, eventdata, handles)
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
vel= convertSpeed(handles.vel,handles.strVel);
viscosity=convertViscosity(handles.vis,handles.strVis);
sp=handles.sp;

errorCode=validateInput_chapter2_particleSize(denF,denP,viscosity,vel,sp);

if(~isempty(errorCode))
    errorMessage = getErrorMessage(errorCode);
    errorMessage = sprintf(errorMessage);
    set(handles.errorBox,'String',errorMessage);
    set(handles.cd, 'String', '-');
    set(handles.re, 'String', '-'); 
    set(handles.x, 'String', '-');
    set(handles.isNewton,'String','-');
    set(handles.isStokes,'String','-');
    set(handles.newtonX,'String','-');
    set(handles.newtonRe,'String','-');
    set(handles.stokesX,'String','-');
    set(handles.stokesRe,'String','-');
    handles.Re=-2;
else
    [size, Re ,Cd]=calcSize(denF,denP,vel,viscosity,sp);
    if (sp==1)
        [Xs Res]=calcSize03(denF,denP,vel,viscosity);
        [Xn Ren]=calcSize500(denF,denP,vel,viscosity);
        handles.Ren=Ren;
        handles.Res=Res;
        if (Xs~=0)
            set(handles.isStokes,'String','Applicable');
            set(handles.isNewton,'String','Not Applicable');
            set(handles.stokesX,'String',sprintf('%.6f m',Xs));
            set(handles.stokesRe,'String',Res);
            set(handles.newtonRe,'String',Ren);
        elseif (Xn~=0)
            set(handles.isNewton,'String','Applicable');
            set(handles.isStokes,'String','Not Applicable');
            set(handles.newtonX,'String',sprintf('%.6f m',Xn));
            set(handles.newtonRe,'String',Ren);
            set(handles.stokesRe,'String',Res);
         else
            set(handles.isNewton,'String','Not Applicable');
            set(handles.isStokes,'String','Not Applicable');
            set(handles.newtonX,'String','N/A');
            set(handles.newtonRe,'String',Ren);
            set(handles.stokesX,'String','N/A');
            set(handles.stokesRe,'String',Res);
        end
    else
        set(handles.isNewton,'String','Not Applicable');
        set(handles.isStokes,'String','Not Applicable');
        set(handles.newtonX,'String','N/A');
        set(handles.newtonRe,'String','N/A');
        set(handles.stokesX,'String','N/A');
        set(handles.stokesRe,'String','N/A');
    end
    
    set(handles.errorBox,'String','');
    set(handles.cd, 'String', Cd);
    set(handles.re, 'String', Re); 
    set(handles.x, 'String', sprintf('%.6f m',size));
    handles.Cd = Cd;
    handles.Re = Re;
    handles.Ut=vel;
    handles.DENF=denF;
    handles.DENP=denP;
    handles.VIS=viscosity;
    handles.SPHERICITY=sp;
    handles.SIZE=size;
end
guidata(hObject,handles); 


function graph_Callback(hObject, eventdata, handles)
Re=handles.Re;
Cd=handles.Cd;
if (Re==-2)
    errorMessage=sprintf('ERROR!\nInvalid input\nPlease reenter values and calculate before plotting graph');
     set(handles.errorBox,'String',errorMessage);
elseif ((Re==-1)||(Cd==-1))
    errorMessage=sprintf('ERROR!\nPlease Calculate before plotting graph');
    set(handles.errorBox,'String',errorMessage);
else
    setappdata(0,'re',Re);
    setappdata(0,'cd',Cd);
    chapter2_particleSize_graph
end


% --- Executes on button press in showWorking.
function showWorking_Callback(hObject, eventdata, handles)
Re=handles.Re;
Res=handles.Res;
Ren=handles.Ren;
Cd=handles.Cd;
Ut=handles.Ut;
DENF=handles.DENF;
DENP=handles.DENP;
VIS=handles.VIS;
SPH=handles.SPHERICITY;
SIZE=handles.SIZE;
if (Re==-2)
    errorMessage=sprintf('ERROR!\nInvalid input\nPlease reenter values and calculate before showing working');
     set(handles.errorBox,'String',errorMessage);
elseif ((Re==-1)||(Cd==-1)||(Res==-1)||(Ren==-1)||(Ut==-1)||(DENF==-1)||(DENP==-1)||(VIS==-1)||(SPH==-1)||(SIZE==-1))
    errorMessage=sprintf('ERROR!\nPlease Calculate before showing working');
    set(handles.errorBox,'String',errorMessage);
else
    setappdata(0,'re',handles.Re);
    setappdata(0,'res',handles.Res);
    setappdata(0,'ren',handles.Ren);
    setappdata(0,'cd',handles.Cd);
    setappdata(0,'Ut',handles.Ut);
    setappdata(0,'denF',handles.DENF);
    setappdata(0,'denP',handles.DENP);
    setappdata(0,'vis',handles.VIS);
    setappdata(0,'sphericity',handles.SPHERICITY);
    setappdata(0,'size',handles.SIZE);
    chapter2_particleSize_calculation
end
