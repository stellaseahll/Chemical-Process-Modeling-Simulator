function varargout = chapter3_thickener(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_thickener_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_thickener_OutputFcn, ...
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


function chapter3_thickener_OpeningFcn(hObject, eventdata, handles, varargin)
addpath(genpath('chapter3'));
addpath(genpath('shared'));
addpath(genpath('conversion'));
handles.hasMinPoint=0;
handles.isOverload=0;
handles.fluxgrad=0;
handles.f=-1;
handles.l=-1;
handles.v=-1;
handles.a=-1;
handles.n=0;
handles.ut=0;
handles.Ups=0;
handles.CF=0;
handles.F=0;
handles.L=0;
handles.V=0;
handles.A=0;
handles.C=0;
handles.type=0;
handles.unitUt='m/s';
handles.unitF='m3/s';
handles.unitL='m3/s';
handles.unitV='m3/s';
handles.unitA='m2';
set(handles.Cmax,'visible','off');
set(handles.textCmax,'visible','off');
handles.output = hObject;
guidata(hObject, handles);

function varargout = chapter3_thickener_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function exp_Callback(hObject, eventdata, handles)
n= str2double(get(hObject,'String'));
handles.n = n;
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



function CF_Callback(hObject, eventdata, handles)
CF= str2double(get(hObject,'String'));
handles.CF =CF;
guidata(hObject,handles); 


% --- Executes during object creation, after setting all properties.
function CF_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function F_Callback(hObject, eventdata, handles)
F= str2double(get(hObject,'String'));
handles.F =F;
guidata(hObject,handles); 


function F_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_Callback(hObject, eventdata, handles)
L= str2double(get(hObject,'String'));
handles.L=L;
guidata(hObject,handles); 


function L_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function V_Callback(hObject, eventdata, handles)
V= str2double(get(hObject,'String'));
handles.V =V;
guidata(hObject,handles); 



function V_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function A_Callback(hObject, eventdata, handles)
A= str2double(get(hObject,'String'));
handles.A =A;
guidata(hObject,handles); 



function A_CreateFcn(hObject, eventdata, handles)
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


function unitF_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        unit='m3/s';
    case 2
        unit='m3/min';
    case 3
        unit='m3/h';
    case 4
        unit='cm3/s';
    case 5
        unit='cm3/min';
    case 6
        unit='cm3/h'; 
    case 7
        unit='L/s';
    case 8
        unit='L/min';
    case 9
        unit='L/h';
    case 10
        unit='ft3/s';
    case 11
        unit='ft3/min';
    case 12
        unit='ft3/h';
end
handles.unitF = unit;
guidata(hObject,handles); 

function unitF_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function unitL_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        unit='m3/s';
    case 2
        unit='m3/min';
    case 3
        unit='m3/h';
    case 4
        unit='cm3/s';
    case 5
        unit='cm3/min';
    case 6
        unit='cm3/h'; 
    case 7
        unit='L/s';
    case 8
        unit='L/min';
    case 9
        unit='L/h';
    case 10
        unit='ft3/s';
    case 11
        unit='ft3/min';
    case 12
        unit='ft3/h';
end
handles.unitL = unit;
guidata(hObject,handles); 



function unitL_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function unitV_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        unit='m3/s';
    case 2
        unit='m3/min';
    case 3
        unit='m3/h';
    case 4
        unit='cm3/s';
    case 5
        unit='cm3/min';
    case 6
        unit='cm3/h'; 
    case 7
        unit='L/s';
    case 8
        unit='L/min';
    case 9
        unit='L/h';
    case 10
        unit='ft3/s';
    case 11
        unit='ft3/min';
    case 12
        unit='ft3/h';
end
handles.unitL = unit;
guidata(hObject,handles); 



function unitV_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function unitA_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        unit='m2';
    case 2
        unit='cm2';
    case 3
        unit='km2';
    case 4
        unit='mm2';
    case 5
        unit='ft2';
    case 6
        unit='in2'; 
end
handles.unitA = unit;
guidata(hObject,handles); 


function unitA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function calculate_Callback(hObject, eventdata, handles)
Ut= convertSpeed(handles.ut,handles.unitUt);
F=convertVolumetricFlowRate(handles.F,handles.unitF);
L=convertVolumetricFlowRate(handles.L,handles.unitL);
V=convertVolumetricFlowRate(handles.V,handles.unitV);
A=convertArea(handles.A,handles.unitA);
errorCode=validateInput_chapter3_thickener(handles.n,Ut,handles.CF,F,L,V,A);
if(~isempty(errorCode))
    handles.f=-2;
    C=0;
    Ups=0;
    hasMinPoint=0;
    isOverload=0;
    flux_grad=0;
    errorMessage = getErrorMessage(errorCode);
    errorMessage = sprintf(errorMessage);
    set(handles.errorBox,'String',errorMessage);
    set(handles.CL, 'String', '-');
    set(handles.CV, 'String', '-'); 
    set(handles.CB, 'String', '-');
    set(handles.CT, 'String', '-');
    set(handles.criticalCF, 'String', '-');
    set(handles.thickenerState,'String','');
else
    [flux_grad C Ups hasMinPoint isOverload]=parseInput_thickener(handles.n,Ut,F,L,V,A,handles.CF);
    if ((~hasMinPoint)&&((round(C(6)*10000)/10000)==(round(C(2)*10000)/10000)))
        handles.type=1;
        C(6)=C(2);
        C(4)=0;
        C(5)=0;
    elseif (~hasMinPoint&&isOverload)
        handles.type=2;
    elseif (~hasMinPoint&&~isOverload)
        handles.type=3;
    elseif ((round(C(6)*10000)/10000)==(round(C(2)*10000)/10000))
        C(6)=C(2);
        C(4)=0;
        C(5)=0;
        handles.type=4;
    elseif (isOverload)
        handles.type=5;
    else
        handles.type=6;
    end
    if (handles.type==4||handles.type==5)
        set(handles.Cmax,'Visible','On');
        set(handles.Cmax,'String',sprintf('%.4f',round(C(7)*10000)/10000));
        set(handles.textCmax,'visible','On');
    else
        set(handles.Cmax,'Visible','Off');
        set(handles.textCmax,'Visible','Off');
    end
    set(handles.CL,'String',sprintf('%.4f',round(C(3)*10000)/10000));
    set(handles.CV,'String',sprintf('%.4f',round(C(4)*10000)/10000));
    set(handles.CB,'String',sprintf('%.4f',round(C(1)*10000)/10000));
    set(handles.CT,'String',sprintf('%.4f',round(C(5)*10000)/10000));
    set(handles.criticalCF,'String',sprintf('%.4f',round(C(6)*10000)/10000));
    if (abs(C(2)-C(6))<0.0001)
        set(handles.thickenerState,'String','Critically Loaded');
    elseif (isOverload)
        set(handles.thickenerState,'String','Overloaded');
    else
        set(handles.thickenerState,'String','Underloaded');
    end

    set(handles.errorBox,'String','');
    handles.fluxgrad=flux_grad;
    handles.C=C;
    handles.Ups=Ups;
    handles.hasMinPoint=hasMinPoint;
    handles.isOverload=isOverload;
    handles.ut=Ut;
    handles.f=F;
    handles.l=L;
    handles.v=V;
    handles.a=A;
    guidata(hObject,handles);
end




function showGraph_Callback(hObject, eventdata, handles)
fluxgrad=handles.fluxgrad;
C=handles.C;
Ups=handles.Ups;
hasMinPoint=handles.hasMinPoint;
isOverload=handles.isOverload;
n=handles.n;
Ut=handles.ut;
F=handles.f;
L=handles.l;
V=handles.v;
A=handles.a;
type=handles.type;
if (F==-2)
    errorMessage=sprintf('ERROR!\nInvalid input\nPlease reenter values and calculate before showing graph');
     set(handles.errorBox,'String',errorMessage);
elseif (F==-1)
    errorMessage=sprintf('ERROR!\nPlease Calculate before showing graph');
    set(handles.errorBox,'String',errorMessage);
else
    setappdata(0,'fluxgrad',fluxgrad);
    setappdata(0,'C',C);
    setappdata(0,'Ups',Ups);
    setappdata(0,'hasMinPoint',hasMinPoint);
    setappdata(0,'isOverload',isOverload);
    setappdata(0,'n',n);
    setappdata(0,'Ut',Ut);
    setappdata(0,'F',F);
    setappdata(0,'L',L);
    setappdata(0,'V',V);
    setappdata(0,'A',A);
    setappdata(0,'type',type);
    chapter3_thickener_graph
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


function Cmax_CreateFcn(hObject, eventdata, handles)


function showWorking_Callback(hObject, eventdata, handles)
fluxgrad=handles.fluxgrad;
C=handles.C;
Ups=handles.Ups;
hasMinPoint=handles.hasMinPoint;
isOverload=handles.isOverload;
n=handles.n;
Ut=handles.ut;
F=handles.f;
L=handles.l;
V=handles.v;
A=handles.a;
type=handles.type;
if (F==-2)
    errorMessage=sprintf('ERROR!\nInvalid input\nPlease reenter values and calculate before showing working');
     set(handles.errorBox,'String',errorMessage);
elseif (F==-1)
    errorMessage=sprintf('ERROR!\nPlease Calculate before showing working');
    set(handles.errorBox,'String',errorMessage);
else
    setappdata(0,'fluxgrad',fluxgrad);
    setappdata(0,'C',C);
    setappdata(0,'Ups',Ups);
    setappdata(0,'hasMinPoint',hasMinPoint);
    setappdata(0,'isOverload',isOverload);
    setappdata(0,'n',n);
    setappdata(0,'Ut',Ut);
    setappdata(0,'F',F);
    setappdata(0,'L',L);
    setappdata(0,'V',V);
    setappdata(0,'A',A);
    setappdata(0,'type',type);
    chapter3_thickener_calculation
end
