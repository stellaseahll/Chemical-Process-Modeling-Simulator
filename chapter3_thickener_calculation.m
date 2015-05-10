function varargout = chapter3_thickener_calculation(varargin)
% CHAPTER3_THICKENER_CALCULATION MATLAB code for chapter3_thickener_calculation.fig
%      CHAPTER3_THICKENER_CALCULATION, by itself, creates a new CHAPTER3_THICKENER_CALCULATION or raises the existing
%      singleton*.
%
%      H = CHAPTER3_THICKENER_CALCULATION returns the handle to a new CHAPTER3_THICKENER_CALCULATION or the handle to
%      the existing singleton*.
%
%      CHAPTER3_THICKENER_CALCULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER3_THICKENER_CALCULATION.M with the given input arguments.
%
%      CHAPTER3_THICKENER_CALCULATION('Property','Value',...) creates a new CHAPTER3_THICKENER_CALCULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter3_thickener_calculation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter3_thickener_calculation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter3_thickener_calculation

% Last Modified by GUIDE v2.5 29-Dec-2013 12:18:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_thickener_calculation_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_thickener_calculation_OutputFcn, ...
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


% --- Executes just before chapter3_thickener_calculation is made visible.
function chapter3_thickener_calculation_OpeningFcn(hObject, eventdata, handles, varargin)
addpath(genpath('chapter3'));
handles.flux_grad=getappdata(0,'fluxgrad');
handles.C=getappdata(0,'C');
handles.Ups=getappdata(0,'Ups');
handles.hasMinPoint=getappdata(0,'hasMinPoint');
handles.isOverload=getappdata(0,'isOverload');
handles.n=getappdata(0,'n');
handles.Ut=getappdata(0,'Ut');
handles.F=getappdata(0,'F');
handles.L=getappdata(0,'L');
handles.V=getappdata(0,'V');
handles.A=getappdata(0,'A');
handles.type=getappdata(0,'type');
axes(handles.plot);
cla;
showThickener_part1(handles.n,handles.Ut,handles.C,handles.Ups,handles.flux_grad,handles.F,handles.L,handles.V,handles.A);
set(handles.part1,'Value',1);
set(handles.part2,'Value',0);
set(handles.part3,'Value',0);
set(handles.part4,'Value',0);
handles.output = hObject;
guidata(hObject, handles);



function varargout = chapter3_thickener_calculation_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function plot_CreateFcn(hObject, eventdata, handles)



function part1_Callback(hObject, eventdata, handles)
set(handles.part1,'Value',1);
set(handles.part2,'Value',0);
set(handles.part3,'Value',0);
set(handles.part4,'Value',0);
axes(handles.plot);
cla;
showThickener_part1(handles.n,handles.Ut,handles.C,handles.Ups,handles.flux_grad,handles.F,handles.L,handles.V,handles.A);

function part2_Callback(hObject, eventdata, handles)
set(handles.part1,'Value',0);
set(handles.part2,'Value',1);
set(handles.part3,'Value',0);
set(handles.part4,'Value',0);
axes(handles.plot);
cla;
showThickener_part2(handles.n,handles.Ut,handles.C,handles.Ups,handles.flux_grad,handles.F,handles.L,handles.V,handles.A,handles.type);


function part3_Callback(hObject, eventdata, handles)
set(handles.part1,'Value',0);
set(handles.part2,'Value',0);
set(handles.part3,'Value',1);
set(handles.part4,'Value',0);
axes(handles.plot);
cla;
showThickener_part3(handles.n,handles.Ut,handles.C,handles.Ups,handles.flux_grad,handles.F,handles.L,handles.V,handles.A,handles.type);

function part4_Callback(hObject, eventdata, handles)
set(handles.part1,'Value',0);
set(handles.part2,'Value',0);
set(handles.part3,'Value',0);
set(handles.part4,'Value',1);
axes(handles.plot);
cla;
showThickener_part4(handles.n,handles.Ut,handles.C,handles.Ups,handles.flux_grad,handles.F,handles.L,handles.V,handles.A,handles.type);
