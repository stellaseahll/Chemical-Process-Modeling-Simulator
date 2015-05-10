function varargout = chapter2_terminalV(varargin)
% CHAPTER2_TERMINALV MATLAB code for chapter2_terminalV.fig
%      CHAPTER2_TERMINALV, by itself, creates a new CHAPTER2_TERMINALV or raises the existing
%      singleton*.
%
%      H = CHAPTER2_TERMINALV returns the handle to a new CHAPTER2_TERMINALV or the handle to
%      the existing singleton*.
%
%      CHAPTER2_TERMINALV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER2_TERMINALV.M with the given input arguments.
%
%      CHAPTER2_TERMINALV('Property','Value',...) creates a new CHAPTER2_TERMINALV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter2_terminalV_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter2_terminalV_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter2_terminalV

% Last Modified by GUIDE v2.5 27-Dec-2013 14:28:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter2_terminalV_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter2_terminalV_OutputFcn, ...
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


% --- Executes just before chapter2_terminalV is made visible.
function chapter2_terminalV_OpeningFcn(hObject, eventdata, handles, varargin)
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
handles.si=0;
handles.strDenP='kg/m3';
handles.strVis='Pas';
handles.strSi='m';
handles.strDen='kg/m3';
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes chapter2_terminalV wait for user response (see UIRESUME)
% uiwait(handles.calculate);


% --- Outputs from this function are returned to the command line.
function varargout = chapter2_terminalV_OutputFcn(hObject, eventdata, handles) 
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
viscosity=convertViscosity(handles.vis,handles.strVis);
sp=handles.sp;

errorCode=validateInput_chapter2_terminalV(denF,denP,viscosity,size,sp);

if(~isempty(errorCode))
    errorMessage = getErrorMessage(errorCode);
    errorMessage = sprintf(errorMessage);
    set(handles.errorBox,'String',errorMessage);
    set(handles.cd, 'String', '-');
    set(handles.re, 'String', '-'); 
    set(handles.uf, 'String', '-');
    handles.Re=-2;
    set(handles.isNewton,'String','-');
    set(handles.isStokes,'String','-');
    set(handles.newtonUt,'String','-');
    set(handles.newtonRe,'String','-');
    set(handles.stokesUt,'String','-');
    set(handles.stokesRe,'String','-');
else
    [uf, Re ,Cd]=calcTermV(denF,denP,size,viscosity,sp);
    if (sp==1)
        [Uts Res]=calcTermV03(denF,denP,size,viscosity);
        [Utn Ren]=calcTermV500(denF,denP,size,viscosity);
        handles.Ren=Ren;
        handles.Res=Res;
        if (Uts~=0)
            set(handles.isStokes,'String','Applicable');
            set(handles.isNewton,'String','Not Applicable');
            set(handles.stokesUt,'String',sprintf('%.5f m/s',Uts));
            set(handles.newtonUt,'String','N/A');
            set(handles.stokesRe,'String',Res);
            set(handles.newtonRe,'String',Ren);
        elseif (Utn~=0)
            set(handles.isNewton,'String','Applicable');
            set(handles.isStokes,'String','Not Applicable');
            set(handles.newtonUt,'String',sprintf('%.5f m/s',Utn));
            set(handles.newtonRe,'String',Ren);
            set(handles.stokesRe,'String',Res);
            set(handles.stokesUt,'String','N/A');
         else
            set(handles.isNewton,'String','Not Applicable');
            set(handles.isStokes,'String','Not Applicable');
            set(handles.newtonUt,'String','N/A');
            set(handles.newtonRe,'String',Ren);
            set(handles.stokesUt,'String','N/A');
            set(handles.stokesRe,'String',Res);
        end
    else
        set(handles.isNewton,'String','Not Applicable');
        set(handles.isStokes,'String','Not Applicable');
        set(handles.newtonUt,'String','N/A');
        set(handles.newtonRe,'String','N/A');
        set(handles.stokesUt,'String','N/A');
        set(handles.stokesRe,'String','N/A');
    end
    
    set(handles.errorBox,'String','');
    set(handles.cd, 'String', Cd);
    set(handles.re, 'String', Re); 
    set(handles.uf, 'String', sprintf('%.5f m/s',uf));
  
    handles.Cd = Cd;
    handles.Re = Re;
    handles.Ut=uf;
    handles.DENF=denF;
    handles.DENP=denP;
    handles.VIS=viscosity;
    handles.SPHERICITY=sp;
    handles.SIZE=size;
end

guidata(hObject,handles); 


% --- Executes on button press in graph.
function graph_Callback(hObject, eventdata, handles)
Re=handles.Re;
Cd=handles.Cd;
if (Re==-2)
    errorMessage=sprintf('ERROR!\nInvalid input\nPlease reenter values and calculate before plotting graph');
     set(handles.errorBox,'String',errorMessage);
elseif ((Re==-1)||(Cd==-1))
    errorMessage=sprintf('ERROR!\nPlease calculate before plotting graph');
    
    set(handles.errorBox,'String',errorMessage);
else
    setappdata(0,'re',Re);
    setappdata(0,'cd',Cd);
    chapter2_terminalV_graph
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
    errorMessage=sprintf('ERROR!\nPlease calculate before showing working');
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
    chapter2_terminalV_calculation
end
