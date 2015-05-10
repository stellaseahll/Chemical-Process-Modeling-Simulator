function varargout = chapter3_sedimentation_simulation(varargin)
% CHAPTER3_SEDIMENTATION_SIMULATION MATLAB code for chapter3_sedimentation_simulation.fig
%      CHAPTER3_SEDIMENTATION_SIMULATION, by itself, creates a new CHAPTER3_SEDIMENTATION_SIMULATION or raises the existing
%      singleton*.
%
%      H = CHAPTER3_SEDIMENTATION_SIMULATION returns the handle to a new CHAPTER3_SEDIMENTATION_SIMULATION or the handle to
%      the existing singleton*.
%
%      CHAPTER3_SEDIMENTATION_SIMULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER3_SEDIMENTATION_SIMULATION.M with the given input arguments.
%
%      CHAPTER3_SEDIMENTATION_SIMULATION('Property','Value',...) creates a new CHAPTER3_SEDIMENTATION_SIMULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter3_sedimentation_simulation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter3_sedimentation_simulation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter3_sedimentation_simulation

% Last Modified by GUIDE v2.5 16-Dec-2013 14:07:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_sedimentation_simulation_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_sedimentation_simulation_OutputFcn, ...
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

function chapter3_sedimentation_simulation_OpeningFcn(hObject, eventdata, handles, varargin)

C=getappdata(0,'C');
Ups=getappdata(0,'Ups');
n=getappdata(0,'n');
ut=getappdata(0,'Ut');
type=getappdata(0,'type');
Uint=getappdata(0,'Uint');
handles.C=C;
handles.Ups=Ups;
handles.n=n;
handles.ut=ut;
handles.type=type;
handles.Uint=Uint;
handles.height=0;

handles.output = hObject;

guidata(hObject, handles);

function varargout = chapter3_sedimentation_simulation_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function height_Callback(hObject, eventdata, handles)
height= str2double(get(hObject,'String'));
handles.height=height;
guidata(hObject,handles); 

function height_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function render_Callback(hObject, eventdata, handles)
height=handles.height;
C=handles.C;
Ups=handles.Ups;
n=handles.n;
ut=handles.ut;
type=handles.type;
Uint=handles.Uint;

if(height<=0)
    set(handles.notifBox,'String','ERROR! Invalid Height!');
else
    set(handles.notifBox,'String','Rendering video... Please wait...');
    [M int]=viewSedimentation(Uint,height,type,C,n,ut);
    set(handles.notifBox,'String','Done! The video is ready!');
    set(handles.save,'Visible','on');
    handles.M=M;;
end

guidata(hObject,handles); 




% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
M=handles.M;
setappdata(0,'M',M);
chapter3_sedimentation_saveas
