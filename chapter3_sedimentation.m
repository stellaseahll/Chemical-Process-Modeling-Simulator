function varargout = chapter3_sedimentation(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_sedimentation_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_sedimentation_OutputFcn, ...
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


function chapter3_sedimentation_OpeningFcn(hObject, eventdata, handles, varargin)
addpath(genpath('chapter3'));
addpath(genpath('shared'));
addpath(genpath('conversion'));
handles.type=-1;
handles.n=0;
handles.ut=0;
handles.Ups=0;
handles.Uint=0;
handles.C=0;
handles.CS=0;
handles.CB=0;
handles.unitUt='m/s';
handles.output = hObject;
guidata(hObject, handles);

function varargout = chapter3_sedimentation_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function exp_Callback(hObject, eventdata, handles)
n= str2double(get(hObject,'String'));
handles.n =n;
guidata(hObject,handles); 


function exp_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Ut_Callback(hObject, eventdata, handles)
Ut= str2double(get(hObject,'String'));
handles.ut =Ut;
guidata(hObject,handles); 


function Ut_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function CS_Callback(hObject, eventdata, handles)
CS= str2double(get(hObject,'String'));
handles.CS =CS;
guidata(hObject,handles); 


function CS_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function CB_Callback(hObject, eventdata, handles)
CB= str2double(get(hObject,'String'));
handles.CB =CB;
guidata(hObject,handles); 

function CB_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function unitUt_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        unit='m/s';
    case 2
        unit='ft/s';
    case 3
        unit='cm/s';
    case 4
        unit='mm/s';
    case 5
        unit='ft/min';
    case 6
        unit='m/min';
    case 7
        unit='cm/min';
    case 8
        unit='mm/min';
    case 9
        unit='km/h';
end
handles.unitUt = unit;
guidata(hObject,handles); 

function unitUt_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function calculate_Callback(hObject, eventdata, handles)
Ut= convertSpeed(handles.ut,handles.unitUt);
CS=handles.CS;
CB=handles.CB;
n=handles.n;
errorCode=validateInput_chapter3_sedimentation(n,Ut,CS,CB);
if(~isempty(errorCode))
    C=0;
    Ups=0;
    Uint=0;
    type=0;
    handles.type=-2;
    errorMessage = getErrorMessage(errorCode);
    errorMessage = sprintf(errorMessage);
    set(handles.errorBox,'String',errorMessage);
    set(handles.CBmin, 'String', '-'); 
    set(handles.CBmax, 'String', '-');
    set(handles.CEmin, 'String', '-');
    set(handles.CEmax, 'String', '-');
    set(handles.sedimentationType,'String','');
else
    [C Ups type Uint]=parseInput(n,Ut,CS,CB);
    set(handles.sedimentationType,'String',type);
    if (isnan(C(1)))
        set(handles.CBmin,'String','N/A');
        set(handles.CEmin,'String','N/A');
        set(handles.CEmax,'String','N/A');
        set(handles.CBmax,'String','N/A');
    else
        set(handles.CBmin,'String',sprintf('%.4f',round(C(1)*10000)/10000));
        set(handles.CEmin,'String',sprintf('%.4f',round(C(3)*10000)/10000));
        set(handles.CEmax,'String',sprintf('%.4f',round(C(4)*10000)/10000));
        set(handles.CBmax,'String',sprintf('%.4f',round(C(4)*10000)/10000));
    end
    set(handles.AB,'String',sprintf('%.5f m/s',Uint(1)));
    if (type==1)
        set(handles.BS,'String',sprintf('%.5f m/s',Uint(2)));
        set(handles.BEmin,'String','N/A');
        set(handles.EmaxS,'String','N/A');
    else
       set(handles.BS,'String','N/A');
       set(handles.BEmin,'String',sprintf('%.5f m/s',Uint(2)));
       set(handles.EmaxS,'String',sprintf('%.5f m/s',Uint(3)));
    end
    set(handles.errorBox,'String','');
    handles.C=C;
    handles.Ups=Ups;
    handles.ut=Ut;
    handles.Uint=Uint;
    handles.type=type;
    guidata(hObject,handles);
end




function showGraph_Callback(hObject, eventdata, handles)
C=handles.C;
Ups=handles.Ups;
type=handles.type;
n=handles.n;
Ut=handles.ut;
Uint=handles.Uint;
if (type==-2)
    errorMessage=sprintf('ERROR!\nInvalid input\nPlease reenter values and calculate before showing graph');
     set(handles.errorBox,'String',errorMessage);
elseif (type==-1)
    errorMessage=sprintf('ERROR!\nPlease Calculate before showing graph');
    set(handles.errorBox,'String',errorMessage);
else 
    setappdata(0,'C',C);
    setappdata(0,'Ups',Ups);
    setappdata(0,'n',n);
    setappdata(0,'Ut',Ut);
    setappdata(0,'type',type);
    setappdata(0,'Uint',Uint);
    set(handles.errorBox,'String','');
    chapter3_sedimentation_graph
end



function KRLaw_Callback(hObject, eventdata, handles)
chapter3_khanrichardson;

function newtonLaw_Callback(hObject, eventdata, handles)
chapter3_newton;

function stokeLaw_Callback(hObject, eventdata, handles)
chapter3_stoke;


% --- Executes on button press in getResult.
function getResult_Callback(hObject, eventdata, handles)
Ut=getappdata(0,'Ut');
n=getappdata(0,'n');
set(handles.Ut, 'String', Ut);
set(handles.exp, 'String', n);


% --- Executes on button press in simulation.
function simulation_Callback(hObject, eventdata, handles)
C=handles.C;
Ups=handles.Ups;
type=handles.type;
n=handles.n;
ut=handles.ut;
Uint=handles.Uint;
if (type==-2)
    errorMessage=sprintf('ERROR!\nInvalid input\nPlease reenter values and calculate before showing simulation');
     set(handles.errorBox,'String',errorMessage);
elseif (type==-1)
    errorMessage=sprintf('ERROR!\nPlease Calculate before showing simulation');
    set(handles.errorBox,'String',errorMessage);
else
    setappdata(0,'C',C);
    setappdata(0,'Ups',Ups);
    setappdata(0,'n',n);
    setappdata(0,'Ut',ut);
    setappdata(0,'type',type);
    setappdata(0,'Uint',Uint);
    chapter3_sedimentation_simulation
end


% --- Executes on button press in showWorking.
function showWorking_Callback(hObject, eventdata, handles)
C=handles.C;
Ups=handles.Ups;
type=handles.type;
n=handles.n;
Ut=handles.ut;
Uint=handles.Uint;
if (type==-2)
    errorMessage=sprintf('ERROR!\nInvalid input\nPlease reenter values and calculate before showing graph');
     set(handles.errorBox,'String',errorMessage);
elseif (type==-1)
    errorMessage=sprintf('ERROR!\nPlease Calculate before showing graph');
    set(handles.errorBox,'String',errorMessage);
else 
    setappdata(0,'C',C);
    setappdata(0,'Ups',Ups);
    setappdata(0,'n',n);
    setappdata(0,'Ut',Ut);
    setappdata(0,'type',type);
    setappdata(0,'Uint',Uint);
    set(handles.errorBox,'String','');
    chapter3_sedimentation_calculation
end
