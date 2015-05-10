function varargout = chapter3_khanrichardson_calculation(varargin)
% CHAPTER3_KHANRICHARDSON_CALCULATION MATLAB code for chapter3_khanrichardson_calculation.fig
%      CHAPTER3_KHANRICHARDSON_CALCULATION, by itself, creates a new CHAPTER3_KHANRICHARDSON_CALCULATION or raises the existing
%      singleton*.
%
%      H = CHAPTER3_KHANRICHARDSON_CALCULATION returns the handle to a new CHAPTER3_KHANRICHARDSON_CALCULATION or the handle to
%      the existing singleton*.
%
%      CHAPTER3_KHANRICHARDSON_CALCULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER3_KHANRICHARDSON_CALCULATION.M with the given input arguments.
%
%      CHAPTER3_KHANRICHARDSON_CALCULATION('Property','Value',...) creates a new CHAPTER3_KHANRICHARDSON_CALCULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter3_khanrichardson_calculation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter3_khanrichardson_calculation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter3_khanrichardson_calculation

% Last Modified by GUIDE v2.5 27-Dec-2013 18:24:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_khanrichardson_calculation_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_khanrichardson_calculation_OutputFcn, ...
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


% --- Executes just before chapter3_khanrichardson_calculation is made visible.
function chapter3_khanrichardson_calculation_OpeningFcn(hObject, eventdata, handles, varargin)
addpath(genpath('chapter2'));
handles.Re=getappdata(0,'Re');
handles.Ut=getappdata(0,'UT');
handles.size=getappdata(0,'size');
handles.denF=getappdata(0,'denF');
handles.denP=getappdata(0,'denP');
handles.vis=getappdata(0,'vis');
handles.dia=getappdata(0,'dia');
handles.Cd=getappdata(0,'Cd');
handles.Ar=getappdata(0,'Ar');
handles.n=getappdata(0,'n');
axes(handles.plot);
cla;
showEquationFluxKR(handles.size,handles.denF,handles.denP,handles.vis,handles.dia,handles.Ar,handles.n,handles.Re,handles.Cd,handles.Ut);
handles.output = hObject;
guidata(hObject, handles);



function varargout = chapter3_khanrichardson_calculation_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in showGraph.
function showGraph_Callback(hObject, eventdata, handles)
setappdata(0,'re',handles.Re);
setappdata(0,'cd',handles.Cd);
chapter2_terminalV_graph;


% --- Executes during object creation, after setting all properties.
function plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate plot
