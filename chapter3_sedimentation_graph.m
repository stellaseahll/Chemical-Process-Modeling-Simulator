function varargout = chapter3_sedimentation_graph(varargin)
% CHAPTER3_SEDIMENTATION_GRAPH MATLAB code for chapter3_sedimentation_graph.fig
%      CHAPTER3_SEDIMENTATION_GRAPH, by itself, creates a new CHAPTER3_SEDIMENTATION_GRAPH or raises the existing
%      singleton*.
%
%      H = CHAPTER3_SEDIMENTATION_GRAPH returns the handle to a new CHAPTER3_SEDIMENTATION_GRAPH or the handle to
%      the existing singleton*.
%
%      CHAPTER3_SEDIMENTATION_GRAPH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER3_SEDIMENTATION_GRAPH.M with the given input arguments.
%
%      CHAPTER3_SEDIMENTATION_GRAPH('Property','Value',...) creates a new CHAPTER3_SEDIMENTATION_GRAPH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter3_sedimentation_graph_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter3_sedimentation_graph_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter3_sedimentation_graph

% Last Modified by GUIDE v2.5 29-Dec-2013 16:36:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_sedimentation_graph_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_sedimentation_graph_OutputFcn, ...
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


function chapter3_sedimentation_graph_OpeningFcn(hObject, eventdata, handles, varargin)
addpath(genpath('chapter3/sedimentation'));
C=getappdata(0,'C');
Ups=getappdata(0,'Ups');
n=getappdata(0,'n');
ut=getappdata(0,'Ut');
Uint=getappdata(0,'Uint');
type=getappdata(0,'type');
%% set graphs
axes(handles.graph);
cla;
[handles.h_main,handles.h_pointX,handles.h_pointY, handles.h_line]=getHandlesSedimentation(n,ut,C,Ups);
setGraph_Sedimentation(handles.h_main,handles.h_pointX,handles.h_pointY,handles.h_line);
set(handles.graph,'visible','on');
%%
set(handles.CB,'Value',0);
set(handles.CS,'Value',0);
set(handles.CBmin,'Value',0);
set(handles.CEmax,'Value',0);
set(handles.CEmin,'Value',0);
set(handles.AB,'Value',0);
set(handles.BS,'Value',0);
set(handles.BEmin,'Value',0);
set(handles.EmaxS,'Value',0);
set(handles.UpsCB,'Value',0);
set(handles.UpsCBmin,'Value',0);
set(handles.UpsCEmax,'Value',0);
set(handles.UpsCEmin,'Value',0);
%% set up checkboxes
if ((type==1)&&isnan(C(1)))
    set(handles.CB,'Visible','On');
    set(handles.CS,'Visible','On');
    set(handles.CBmin,'Visible','Off');
    set(handles.CEmax,'Visible','Off');
    set(handles.CEmin,'Visible','Off');
    set(handles.AB,'Visible','On');
    set(handles.BS,'Visible','On');
    set(handles.BEmin,'Visible','Off');
    set(handles.EmaxS,'Visible','Off');
    set(handles.UpsCB,'Visible','On');
    set(handles.UpsCBmin,'Visible','Off');
    set(handles.UpsCEmax,'Visible','Off');
    set(handles.UpsCEmin,'Visible','Off');
elseif (type==1)
    set(handles.CB,'Visible','On');
    set(handles.CS,'Visible','On');
    set(handles.CBmin,'Visible','On');
    set(handles.CEmax,'Visible','On');
    set(handles.CEmin,'Visible','Off');
    set(handles.AB,'Visible','On');
    set(handles.BS,'Visible','On');
    set(handles.BEmin,'Visible','Off');
    set(handles.EmaxS,'Visible','On');
    set(handles.UpsCB,'Visible','On');
    set(handles.UpsCBmin,'Visible','On');
    set(handles.UpsCEmax,'Visible','On');
    set(handles.UpsCEmin,'Visible','Off');
else
    set(handles.CB,'Visible','On');
    set(handles.CS,'Visible','On');
    set(handles.CBmin,'Visible','On');
    set(handles.CEmax,'Visible','On');
    set(handles.CEmin,'Visible','On');
    set(handles.AB,'Visible','On');
    set(handles.BS,'Visible','Off');
    set(handles.BEmin,'Visible','On');
    set(handles.EmaxS,'Visible','On');
    set(handles.UpsCB,'Visible','On');
    set(handles.UpsCBmin,'Visible','On');
    set(handles.UpsCEmax,'Visible','On');
    set(handles.UpsCEmin,'Visible','On');
end
handles.C=C;
handles.Ups=Ups;
handles.n=n;
handles.Ut=ut;
handles.Uint=Uint;
handles.type=type;
handles.output = hObject;
guidata(hObject, handles);



function varargout = chapter3_sedimentation_graph_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function CEmax_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointX(3),'Visible','On');
else
   set(handles.h_pointX(3),'Visible','Off');
end

function CEmin_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointX(2),'Visible','On');
else
   set(handles.h_pointX(2),'Visible','Off');
end


function CS_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointX(1),'Visible','On');
else
   set(handles.h_pointX(1),'Visible','Off');
end


function CBmin_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointX(4),'Visible','On');
else
   set(handles.h_pointX(4),'Visible','Off');
end

function CB_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointX(5),'Visible','On');
else
   set(handles.h_pointX(5),'Visible','Off');
end

function AB_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_line(1),'Visible','On');
else
   set(handles.h_line(1),'Visible','Off');
end

function BS_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_line(2),'Visible','On');
else
   set(handles.h_line(2),'Visible','Off');
end

function BEmin_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_line(3),'Visible','On');
else
   set(handles.h_line(3),'Visible','Off');
end

function EmaxS_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_line(4),'Visible','On');
else
   set(handles.h_line(4),'Visible','Off');
end


function UpsCB_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointY(1),'Visible','On');
else
   set(handles.h_pointY(1),'Visible','Off');
end

function UpsCBmin_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointY(2),'Visible','On');
else
   set(handles.h_pointY(2),'Visible','Off');
end

function UpsCEmin_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointY(3),'Visible','On');
else
   set(handles.h_pointY(3),'Visible','Off');
end

function UpsCEmax_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointY(4),'Visible','On');
else
   set(handles.h_pointY(4),'Visible','Off');
end


function showWorking_Callback(hObject, eventdata, handles)
setappdata(0,'C',handles.C);
setappdata(0,'Ups',handles.Ups);
setappdata(0,'n',handles.n);
setappdata(0,'Ut',handles.Ut);
setappdata(0,'Uint',handles.Uint);
setappdata(0,'type',handles.type);
chapter3_sedimentation_calculation
