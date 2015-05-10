function varargout = chapter7_fluidization_calculation(varargin)
% CHAPTER7_FLUIDIZATION_CALCULATION MATLAB code for chapter7_fluidization_calculation.fig
%      CHAPTER7_FLUIDIZATION_CALCULATION, by itself, creates a new CHAPTER7_FLUIDIZATION_CALCULATION or raises the existing
%      singleton*.
%
%      H = CHAPTER7_FLUIDIZATION_CALCULATION returns the handle to a new CHAPTER7_FLUIDIZATION_CALCULATION or the handle to
%      the existing singleton*.
%
%      CHAPTER7_FLUIDIZATION_CALCULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER7_FLUIDIZATION_CALCULATION.M with the given input arguments.
%
%      CHAPTER7_FLUIDIZATION_CALCULATION('Property','Value',...) creates a new CHAPTER7_FLUIDIZATION_CALCULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter7_fluidization_calculation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter7_fluidization_calculation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter7_fluidization_calculation

% Last Modified by GUIDE v2.5 29-Dec-2013 15:26:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter7_fluidization_calculation_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter7_fluidization_calculation_OutputFcn, ...
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


% --- Executes just before chapter7_fluidization_calculation is made visible.
function chapter7_fluidization_calculation_OpeningFcn(hObject, eventdata, handles, varargin)
addpath(genpath('chapter3'));
addpath(genpath('chapter2'));
addpath(genpath('chapter7'));
handles.Ufs=getappdata(0,'Ufs');
handles.Umf=getappdata(0,'Umf');
handles.denF=getappdata(0,'denF');
handles.denP=getappdata(0,'denP');
handles.vis=getappdata(0,'vis');
handles.massP=getappdata(0,'massP');
handles.size=getappdata(0,'size');
handles.height=getappdata(0,'height');
handles.dia=getappdata(0,'dia');
if (handles.Ufs>handles.Umf)
    [handles.n, handles.Ut, handles.Ar, handles.Re ,handles.Cd]=findFlux_KhanRichardson(handles.denF,handles.denP,handles.size,handles.vis,handles.dia);
    set(handles.part3,'Visible','On');
else
    set(handles.part3,'Visible','Off');
    handles.n=0;
    handles.Ut=0;
end
axes(handles.plot);
cla;
showFluidization_Umf(handles.size,handles.denF,handles.denP,handles.vis,handles.massP,handles.dia,handles.height,handles.Ufs);

set(handles.showGraph,'Visible','Off');
set(handles.part1,'Value',1);
set(handles.part2,'Value',0);
set(handles.part3,'Value',0);
handles.output = hObject;
guidata(hObject, handles);



function varargout = chapter7_fluidization_calculation_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function plot_CreateFcn(hObject, eventdata, handles)



function part1_Callback(hObject, eventdata, handles)
set(handles.part1,'Value',1);
set(handles.part2,'Value',0);
set(handles.part3,'Value',0);
axes(handles.plot);
cla;
set(handles.showGraph,'Visible','Off');
showFluidization_Umf(handles.size,handles.denF,handles.denP,handles.vis,handles.massP,handles.dia,handles.height,handles.Ufs);

function part2_Callback(hObject, eventdata, handles)
set(handles.part1,'Value',0);
set(handles.part2,'Value',1);
set(handles.part3,'Value',0);
axes(handles.plot);
cla;
set(handles.showGraph,'Visible','Off');
showFluidization_Bed(handles.size,handles.denF,handles.denP,handles.vis,handles.massP,handles.dia,handles.height,handles.Ufs,handles.n,handles.Ut);


function part3_Callback(hObject, eventdata, handles)
set(handles.part1,'Value',0);
set(handles.part2,'Value',0);
set(handles.part3,'Value',1);
axes(handles.plot);
cla;
showEquationFluxKR(handles.size,handles.denF,handles.denP,handles.vis,handles.dia,handles.Ar,handles.n,handles.Re,handles.Cd,handles.Ut);
set(handles.showGraph,'Visible','On');

% --- Executes on button press in showGraph.
function showGraph_Callback(hObject, eventdata, handles)
setappdata(0,'re',handles.Re);
setappdata(0,'cd',handles.Cd);
chapter2_terminalV_graph
