function varargout = chapter3_newton_calculation(varargin)
% CHAPTER3_NEWTON_CALCULATION MATLAB code for chapter3_newton_calculation.fig
%      CHAPTER3_NEWTON_CALCULATION, by itself, creates a new CHAPTER3_NEWTON_CALCULATION or raises the existing
%      singleton*.
%
%      H = CHAPTER3_NEWTON_CALCULATION returns the handle to a new CHAPTER3_NEWTON_CALCULATION or the handle to
%      the existing singleton*.
%
%      CHAPTER3_NEWTON_CALCULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER3_NEWTON_CALCULATION.M with the given input arguments.
%
%      CHAPTER3_NEWTON_CALCULATION('Property','Value',...) creates a new CHAPTER3_NEWTON_CALCULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter3_newton_calculation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter3_newton_calculation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter3_newton_calculation

% Last Modified by GUIDE v2.5 27-Dec-2013 18:23:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_newton_calculation_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_newton_calculation_OutputFcn, ...
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


% --- Executes just before chapter3_newton_calculation is made visible.
function chapter3_newton_calculation_OpeningFcn(hObject, eventdata, handles, varargin)
addpath(genpath('chapter2'));
addpath(genpath('chapter3'));

handles.Re=getappdata(0,'re');
handles.Ut=getappdata(0,'UT');
handles.size=getappdata(0,'size');
handles.denF=getappdata(0,'denF');
handles.denP=getappdata(0,'denP');
handles.vis=getappdata(0,'vis');
axes(handles.plot);
cla;
showEquationFluxNewton(handles.size,handles.denF,handles.denP,handles.vis,handles.Ut,handles.Re);
handles.output = hObject;
guidata(hObject, handles);



function varargout = chapter3_newton_calculation_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate plot
