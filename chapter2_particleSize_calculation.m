function varargout = chapter2_particleSize_calculation(varargin)
% CHAPTER2_PARTICLESIZE_CALCULATION MATLAB code for chapter2_particleSize_calculation.fig
%      CHAPTER2_PARTICLESIZE_CALCULATION, by itself, creates a new CHAPTER2_PARTICLESIZE_CALCULATION or raises the existing
%      singleton*.
%
%      H = CHAPTER2_PARTICLESIZE_CALCULATION returns the handle to a new CHAPTER2_PARTICLESIZE_CALCULATION or the handle to
%      the existing singleton*.
%
%      CHAPTER2_PARTICLESIZE_CALCULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER2_PARTICLESIZE_CALCULATION.M with the given input arguments.
%
%      CHAPTER2_PARTICLESIZE_CALCULATION('Property','Value',...) creates a new CHAPTER2_PARTICLESIZE_CALCULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter2_particleSize_calculation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter2_particleSize_calculation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter2_particleSize_calculation

% Last Modified by GUIDE v2.5 27-Dec-2013 14:16:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter2_particleSize_calculation_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter2_particleSize_calculation_OutputFcn, ...
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


% --- Executes just before chapter2_particleSize_calculation is made visible.
function chapter2_particleSize_calculation_OpeningFcn(hObject, eventdata, handles, varargin)
addpath(genpath('chapter2'));

handles.Re=getappdata(0,'re');
handles.Res=getappdata(0,'res');
handles.Ren=getappdata(0,'ren');
handles.Cd=getappdata(0,'cd');
handles.Ut=getappdata(0,'Ut');
handles.size=getappdata(0,'size');
handles.denF=getappdata(0,'denF');
handles.denP=getappdata(0,'denP');
handles.vis=getappdata(0,'vis');
handles.sphericity=getappdata(0,'sphericity');
if (handles.sphericity~=1)
    set(handles.methodNewton,'visible','off');
    set(handles.methodStoke,'visible','off');
end
set(handles.methodGraph,'Value',1);
axes(handles.plot);
cla;
showEquationGraph_ParticleSize(handles.Ut,handles.denF,handles.denP,handles.vis,handles.sphericity,handles.Re,handles.Cd,handles.size);
handles.output = hObject;
guidata(hObject, handles);



function varargout = chapter2_particleSize_calculation_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function methodGraph_Callback(hObject, eventdata, handles)
set(handles.methodStoke, 'Value', 0);
set(handles.methodNewton, 'Value', 0);
set(handles.methodGraph, 'Value', 1);
axes(handles.plot);
cla;
showEquationGraph_ParticleSize(handles.Ut,handles.denF,handles.denP,handles.vis,handles.sphericity,handles.Re,handles.Cd,handles.size);
guidata(hObject, handles);

function methodStoke_Callback(hObject, eventdata, handles)
set(handles.methodGraph, 'Value', 0);
set(handles.methodNewton, 'Value', 0);
set(handles.methodStoke, 'Value', 1);
axes(handles.plot);
cla;
showEquationStoke_ParticleSize(handles.Ut,handles.denF,handles.denP,handles.vis,handles.Res);
guidata(hObject, handles);

% --- Executes on button press in methodNewton.
function methodNewton_Callback(hObject, eventdata, handles)
set(handles.methodGraph, 'Value', 0);
set(handles.methodStoke, 'Value', 0);
set(handles.methodNewton, 'Value', 1);
axes(handles.plot);
cla;
showEquationNewton_ParticleSize(handles.Ut,handles.denF,handles.denP,handles.vis,handles.Ren);
guidata(hObject, handles);
