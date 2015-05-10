function varargout = chapter3_sedimentation_saveas(varargin)
% CHAPTER3_SEDIMENTATION_SAVEAS MATLAB code for chapter3_sedimentation_saveas.fig
%      CHAPTER3_SEDIMENTATION_SAVEAS, by itself, creates a new CHAPTER3_SEDIMENTATION_SAVEAS or raises the existing
%      singleton*.
%
%      H = CHAPTER3_SEDIMENTATION_SAVEAS returns the handle to a new CHAPTER3_SEDIMENTATION_SAVEAS or the handle to
%      the existing singleton*.
%
%      CHAPTER3_SEDIMENTATION_SAVEAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER3_SEDIMENTATION_SAVEAS.M with the given input arguments.
%
%      CHAPTER3_SEDIMENTATION_SAVEAS('Property','Value',...) creates a new CHAPTER3_SEDIMENTATION_SAVEAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter3_sedimentation_saveas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter3_sedimentation_saveas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter3_sedimentation_saveas

% Last Modified by GUIDE v2.5 16-Dec-2013 14:37:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_sedimentation_saveas_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_sedimentation_saveas_OutputFcn, ...
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


% --- Executes just before chapter3_sedimentation_saveas is made visible.
function chapter3_sedimentation_saveas_OpeningFcn(hObject, eventdata, handles, varargin)
handles.filename='sedimentation';
handles.fps=30;
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = chapter3_sedimentation_saveas_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function fileName_Callback(hObject, eventdata, handles)
filename= get(hObject,'String');
handles.filename=filename;
guidata(hObject,handles); 

% --- Executes during object creation, after setting all properties.
function fileName_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fps_Callback(hObject, eventdata, handles)
fps= str2double(get(hObject,'String'));
handles.fps=fps;
guidata(hObject,handles); 

function fps_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
fps=handles.fps;
filename=handles.filename;
M=getappdata(0,'M');

writerObj = VideoWriter(filename,'MPEG-4');
writerObj.FrameRate = fps;
writerObj.open;
writeVideo(writerObj,M);
writerObj.close;

close(handles.chapter3_sedimentation_saveas)
