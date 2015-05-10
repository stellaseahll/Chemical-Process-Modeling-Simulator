function varargout = conversion(varargin)
% CONVERSION M-file for conversion.fig
%      CONVERSION, by itself, creates a new CONVERSION or raises the existing
%      singleton*.
%
%      H = CONVERSION returns the handle to a new CONVERSION or the handle to
%      the existing singleton*.
%
%      CONVERSION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONVERSION.M with the given input arguments.
%
%      CONVERSION('Property','Value',...) creates a new CONVERSION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before conversion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to conversion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% blah blah blah

% Edit the above text to modify the response to help conversion

% Last Modified by GUIDE v2.5 04-Dec-2013 08:09:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @conversion_OpeningFcn, ...
                   'gui_OutputFcn',  @conversion_OutputFcn, ...
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


% --- Executes just before conversion is made visible.
function conversion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to conversion (see VARARGIN)

% include path to function files
addpath(genpath('conversion'));

% Choose default command line output for conversion

handles.input=0;
handles.input2=0;
handles.input3=0;
handles.input4=0;
handles.input5=0;
handles.input6=0;
handles.input7=0;
handles.input8=0;
handles.input9=0;
handles.input10=0;
handles.str1='m2';
handles.str2='m2';
handles.str3='m';
handles.str4='m';
handles.str5='m3';
handles.str6='m3';
handles.str7='kg';
handles.str8='kg';
handles.str9='pa';
handles.str10='pa';
handles.str11='K';
handles.str12='K';
handles.str13='m/s';
handles.str14='m/s';
handles.str15='J';
handles.str16='J';
handles.str17='kg/m3';
handles.str18='kg/m3';
handles.str19='Pas';
handles.str20='Pas';
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes conversion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = conversion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function input_Callback(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input as text
%        str2double(get(hObject,'String')) returns contents of input as a double
input= str2double(get(hObject,'String'));
handles.input = input;
guidata(hObject,handles); 

% --- Executes during object creation, after setting all properties.
function input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in unit1.
function unit1_Callback(hObject, eventdata, handles)
% hObject    handle to unit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns unit1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from unit1
contents = get(hObject,'Value');
switch contents
    case 1
        str1='m2';
    case 2
        str1='cm2';
    case 3
        str1='km2';
    case 4
        str1='mm2';
    case 5
        str1='ft2';
    case 6
        str1='in2';
end
handles.str1 = str1;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function unit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in unit2.
function unit2_Callback(hObject, eventdata, handles)
% hObject    handle to unit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns unit2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from unit2
contents = get(hObject,'Value');
switch contents
    case 1
        str2='m2';
    case 2
        str2='cm2';
    case 3
        str2='km2';
    case 4
        str2='mm2';
    case 5
        str2='ft2';
    case 6
        str2='in2';
end
handles.str2 = str2;
guidata(hObject,handles); 

% --- Executes during object creation, after setting all properties.
function unit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in calculate1.
function calculate1_Callback(hObject, eventdata, handles)
% hObject    handle to calculate1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ans = convertArea(handles.input,handles.str1,handles.str2);
set(handles.ans, 'String', ans);



function input2_Callback(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input2 as text
%        str2double(get(hObject,'String')) returns contents of input2 as a double
input2= str2double(get(hObject,'String'));
handles.input2 = input2;
guidata(hObject,handles); 


% --- Executes during object creation, after setting all properties.
function input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in unit3.
function unit3_Callback(hObject, eventdata, handles)
% hObject    handle to unit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns unit3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from unit3
contents = get(hObject,'Value');
switch contents
    case 1
        str3='m';
    case 2
        str3='cm';
    case 3
        str3='km';
    case 4
        str3='mm';
    case 5
        str3='um';
    case 6
        str3='ft';
    case 7
        str3='in';
    case 8
        str3='mile';
end
handles.str3 = str3;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function unit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in unit4.
function unit4_Callback(hObject, eventdata, handles)
% hObject    handle to unit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns unit4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from unit4
contents = get(hObject,'Value');
switch contents
    case 1
        str4='m';
    case 2
        str4='cm';
    case 3
        str4='km';
    case 4
        str4='mm';
    case 5
        str4='um';
    case 6
        str4='ft';
    case 7
        str4='in';
    case 8
        str4='mile';
end
handles.str4 = str4;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function unit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculate2.
function calculate2_Callback(hObject, eventdata, handles)
% hObject    handle to calculate2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over calculate2.
ans2 = convertLength(handles.input2,handles.str3,handles.str4);
set(handles.ans2, 'String', ans2);



function input3_Callback(hObject, eventdata, handles)
% hObject    handle to input3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input3 as text
%        str2double(get(hObject,'String')) returns contents of input3 as a double
input3= str2double(get(hObject,'String'));
handles.input3 = input3;
guidata(hObject,handles); 


% --- Executes during object creation, after setting all properties.
function input3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit6.
function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns edit6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edit6
contents = get(hObject,'Value');
switch contents
    case 1
        str6='m3';
    case {2,9}
        str6='cm3';
    case 3
        str6='km3';
    case 4
        str6='mm3';
    case 5
        str6='ft3';
    case 6
        str6='in3';
    case {7,10}
        str6='L';
    case 8
        str6='gal';
end
handles.str6 = str6;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit5.
function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns edit5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edit5
contents = get(hObject,'Value');
switch contents
    case 1
        str5='m3';
    case {2,9}
        str5='cm3';
    case 3
        str5='km3';
    case 4
        str5='mm3';
    case 5
        str5='ft3';
    case 6
        str5='in3';
    case {7,10}
        str5='L';
    case 8
        str5='gal';
end
handles.str5 = str5;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculate3.
function calculate3_Callback(hObject, eventdata, handles)
% hObject    handle to calculate3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ans3 = convertVolume(handles.input3,handles.str5,handles.str6);
set(handles.ans3, 'String', ans3);



function input4_Callback(hObject, eventdata, handles)
% hObject    handle to input4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input4 as text
%        str2double(get(hObject,'String')) returns contents of input4 as a double
input4= str2double(get(hObject,'String'));
handles.input4 = input4;
guidata(hObject,handles); 



% --- Executes during object creation, after setting all properties.
function input4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in edit8.
function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns edit8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edit8
contents = get(hObject,'Value');
switch contents
    case 1
        str8='kg';
    case 2
        str8='g';
    case 3
        str8='mg';
    case 4
        str8='ton';
    case 5
        str8='lb';
end
handles.str8 = str8;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit7.
function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns edit7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edit7
contents = get(hObject,'Value');
switch contents
    case 1
        str7='kg';
    case 2
        str7='g';
    case 3
        str7='mg';
    case 4
        str7='ton';
    case 5
        str7='lb';
end
handles.str7 = str7;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in calculate4.
function calculate4_Callback(hObject, eventdata, handles)
% hObject    handle to calculate4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ans4 = convertMass(handles.input4,handles.str7,handles.str8);
set(handles.ans4, 'String', ans4);



function input5_Callback(hObject, eventdata, handles)
% hObject    handle to input5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input5 as text
%        str2double(get(hObject,'String')) returns contents of input5 as a double
input5= str2double(get(hObject,'String'));
handles.input5 = input5;
guidata(hObject,handles); 

% --- Executes during object creation, after setting all properties.
function input5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit9_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        str9='Pa';
    case 2
        str9='kPa';
    case 3
        str9='atm';
    case 4
        str9='bar';
    case 5
        str9='psf';
    case 6
        str9='psi';
    case 7
        str9='mmHg';
    case 8
        str9='mmh2o';
 	case 9
        str9='fth2o';
    case 10
        str9='english';
end
handles.str9 = str9;
guidata(hObject,handles);

function edit9_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in edit10.
function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns edit10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edit10
contents = get(hObject,'Value');
switch contents
    case 1
        str10='Pa';
    case 2
        str10='kPa';
    case 3
        str10='atm';
    case 4
        str10='bar';
    case 5
        str10='psf';
    case 6
        str10='psi';
    case 7
        str10='mmHg';
    case 8
        str10='mmh2o';
 	case 9
        str10='fth2o';
    case 10
        str10='english';
end
handles.str10 = str10;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in calculate5.
function calculate5_Callback(hObject, eventdata, handles)
ans5 = convertPressure(handles.input5,handles.str9,handles.str10);
set(handles.ans5, 'String', ans5);



function input6_Callback(hObject, eventdata, handles)
input6= str2double(get(hObject,'String'));
handles.input6 = input6;
guidata(hObject,handles); 


% --- Executes during object creation, after setting all properties.
function input6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit12.
function edit12_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        str12='K';
    case 2
        str12='C';
    case 3
        str12='F';
    case 4
        str12='R';
end
handles.str12 = str12;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit11.
function edit11_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        str11='K';
    case 2
        str11='C';
    case 3
        str11='F';
    case 4
        str11='R';
end
handles.str11 = str11;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculate6.
function calculate6_Callback(hObject, eventdata, handles)
ans6 = convertTemperature(handles.input6,handles.str11,handles.str12);
set(handles.ans6, 'String', ans6);



function input7_Callback(hObject, eventdata, handles)
input7= str2double(get(hObject,'String'));
handles.input7= input7;
guidata(hObject,handles); 


% --- Executes during object creation, after setting all properties.
function input7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit14.
function edit14_Callback(hObject, eventdata, handles)
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
handles.str14 = str14;
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit13.
function edit13_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        str13='m/s';
    case 2
        str13='ft/s';
    case 3
        str13='cm/s';
    case 4
        str13='mm/s';
    case 5
        str13='ft/min';
    case 6
        str13='m/min';
    case 7
        str13='cm/min';
    case 8
        str13='mm/min';
    case 9
        str13='km/h';
end
handles.str13 = str13;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculate7.
function calculate7_Callback(hObject, eventdata, handles)
ans7 = convertSpeed(handles.input7,handles.str13,handles.str14);
set(handles.ans7, 'String', ans7);

function input10_Callback(hObject, eventdata, handles)
input10= str2double(get(hObject,'String'));
handles.input10= input10;
guidata(hObject,handles); 


function input10_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calculate10_Callback(hObject, eventdata, handles)
ans10 = convertViscosity(handles.input10,handles.str19,handles.str20);
set(handles.ans10, 'String', ans10);


% --- Executes on selection change in edit19.
function edit19_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        str19='Pas';
    case 2
        str19='cp';
    case 3
        str19='psf.s';
    case 4
        str19='lb/ft/s';
end
handles.str19 = str19;
guidata(hObject,handles);


function edit19_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit20_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        str20='Pas';
    case 2
        str20='cp';
    case 3
        str20='psfs';
    case 4
        str20='english';
end
handles.str20 = str20;
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input9_Callback(hObject, eventdata, handles)
input9= str2double(get(hObject,'String'));
handles.input9= input9;
guidata(hObject,handles); 

% --- Executes during object creation, after setting all properties.
function input9_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculate9.
function calculate9_Callback(hObject, eventdata, handles)
ans9 = convertDensity(handles.input9,handles.str17,handles.str18);
set(handles.ans9, 'String', ans9);


% --- Executes on selection change in edit17.
function edit17_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        str17='kg/m3';
    case 2
        str17='lb/ft3';
    case 3
        str17='g/cm3';
end
handles.str17 = str17;
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit18.
function edit18_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        str18='kg/m3';
    case 2
        str18='lb/ft3';
    case 3
        str18='g/cm3';
end
handles.str18 = str18;
guidata(hObject,handles);


function edit18_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function input8_Callback(hObject, eventdata, handles)
input8= str2double(get(hObject,'String'));
handles.input8= input8;
guidata(hObject,handles); 

function input8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit15.
function edit15_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        str15='J';
    case 2
        str15='kJ';
    case 3
        str15='Btu';
    case 4
        str15='cal';
    case 5
        str15='kWh';
    case 6
        str15='lb ft';
    case 7
        str15='english';
    case 8
        str15='eV';
end
handles.str15 = str15;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit16.
function edit16_Callback(hObject, eventdata, handles)
contents = get(hObject,'Value');
switch contents
    case 1
        str16='J';
    case 2
        str16='kJ';
    case 3
        str16='Btu';
    case 4
        str16='cal';
    case 5
        str16='kWh';
    case 6
        str16='lb ft';
    case 7
        str16='english';
    case 8
        str16='eV';
end
handles.str16 = str16;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in calculate8.
function calculate8_Callback(hObject, eventdata, handles)
ans8 = convertEnergy(handles.input8,handles.str15,handles.str16);
set(handles.ans8, 'String', ans8);
