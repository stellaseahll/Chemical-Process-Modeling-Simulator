function varargout = chapter3_thickener_graph(varargin)
% CHAPTER3_THICKENER_GRAPH MATLAB code for chapter3_thickener_graph.fig
%      CHAPTER3_THICKENER_GRAPH, by itself, creates a new CHAPTER3_THICKENER_GRAPH or raises the existing
%      singleton*.
%
%      H = CHAPTER3_THICKENER_GRAPH returns the handle to a new CHAPTER3_THICKENER_GRAPH or the handle to
%      the existing singleton*.
%
%      CHAPTER3_THICKENER_GRAPH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER3_THICKENER_GRAPH.M with the given input arguments.
%
%      CHAPTER3_THICKENER_GRAPH('Property','Value',...) creates a new CHAPTER3_THICKENER_GRAPH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter3_thickener_graph_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter3_thickener_graph_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter3_thickener_graph

% Last Modified by GUIDE v2.5 28-Dec-2013 14:06:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_thickener_graph_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_thickener_graph_OutputFcn, ...
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


function chapter3_thickener_graph_OpeningFcn(hObject, eventdata, handles, varargin)
addpath(genpath('chapter3'));
flux_grad=getappdata(0,'fluxgrad');
C=getappdata(0,'C');
Ups=getappdata(0,'Ups');
hasMinPoint=getappdata(0,'hasMinPoint');
isOverload=getappdata(0,'isOverload');
n=getappdata(0,'n');
ut=getappdata(0,'Ut');
F=getappdata(0,'F');
L=getappdata(0,'L');
V=getappdata(0,'V');
A=getappdata(0,'A');
type=getappdata(0,'type');
handles.fluxgrad=flux_grad;
handles.C=C;
handles.Ups=Ups;
handles.hasMinPoint=hasMinPoint;
handles.isOverload=isOverload;
handles.n=n;
handles.Ut=ut;
handles.F=F;
handles.L=L;
handles.V=V;
handles.A=A;
handles.type=type;

%% set up top graph
axes(handles.top_graph);
cla;
[handles.h_main_top,handles.h_pointX_top,handles.h_pointY_top, handles.h_line_top]=getHandlesThickener_top(n,ut,flux_grad, C, Ups,hasMinPoint,isOverload);
setGraph_Thickener(handles.h_main_top,handles.h_pointX_top,handles.h_pointY_top,handles.h_line_top);
set(handles.top_graph,'visible','on');
%% set up bottom graph
axes(handles.bottom_graph);
cla;
[handles.h_main_bottom, handles.h_pointX_bottom, handles.h_pointY_bottom, handles.h_line_bottom]=getHandlesThickener_bottom(n,ut,flux_grad,...
    C, Ups,hasMinPoint,isOverload);
setGraph_Thickener(handles.h_main_bottom,handles.h_pointX_bottom,handles.h_pointY_bottom,handles.h_line_bottom);
set(handles.bottom_graph,'visible','on');
%% set up checkboxes
if (type==1)
    set(handles.CF,'Visible','On');
    set(handles.CB,'Visible','Off');
    set(handles.criticalCF,'Visible','Off');
    set(handles.CL,'Visible','On');
    set(handles.CF,'String','CF=CB=CFcrit');
    setpixelposition(handles.CL,[512,430,83,23]);
    setpixelposition(handles.Cmax,[512,430,83,23]);
    set(handles.Cmax,'Visible','Off');
    set(handles.F_A,'Visible','On');
    set(handles.L_A,'Visible','On');
    set(handles.V_A,'Visible','On');
    set(handles.Batch,'Visible','On');
    set(handles.BatchBottom,'Visible','On');
    set(handles.UpsF,'String','FCF/A=LCL/A');
    set(handles.CV,'Visible','On');
    set(handles.CV,'String','CV=CT');
    set(handles.UpsF,'Visible','On');
    set(handles.UpsV,'Visible','On');
    set(handles.UpsL,'Visible','Off');
    set(handles.CT,'Visible','Off');
    set(handles.Upsmax,'Visible','Off');
elseif (type==2)
    set(handles.CF,'Visible','On');
    setpixelposition(handles.CL,[512,411,83,23]);
    setpixelposition(handles.Cmax,[512,430,83,23]);
    set(handles.CF,'String','CF=CB');
    set(handles.CB,'Visible','Off');
    set(handles.criticalCF,'Visible','On');
    set(handles.CL,'Visible','On');
    set(handles.Cmax,'Visible','Off');
    set(handles.F_A,'Visible','On');
    set(handles.L_A,'Visible','On');
    set(handles.V_A,'Visible','On');
    set(handles.Batch,'Visible','On');
    set(handles.BatchBottom,'Visible','On');
    set(handles.UpsF,'Visible','On');
    set(handles.UpsV,'Visible','On');
    set(handles.UpsL,'Visible','On');
    set(handles.UpsF,'String','FCF/A');
    set(handles.UpsL,'String','LCL/A');
    set(handles.CV,'Visible','On');
    set(handles.CV,'String','CV');
    set(handles.CT,'Visible','On');
    set(handles.Upsmax,'Visible','Off');
elseif (type==3)
    setpixelposition(handles.CL,[512,411,83,23]);
    setpixelposition(handles.Cmax,[512,430,83,23]);
    set(handles.CF,'Visible','On');
    set(handles.CF,'String','CF');
    set(handles.criticalCF,'Visible','On');
    set(handles.CL,'Visible','On');
    set(handles.CB,'Visible','On');
    set(handles.Cmax,'Visible','Off');
    set(handles.F_A,'Visible','On');
    set(handles.L_A,'Visible','On');
    set(handles.V_A,'Visible','On');
    set(handles.Batch,'Visible','On');
    set(handles.BatchBottom,'Visible','On');
    set(handles.UpsF,'String','FCF/A=LCL/A');
    set(handles.CV,'Visible','On');
    set(handles.CV,'String','CV=CT');
    set(handles.UpsF,'Visible','On');
    set(handles.UpsV,'Visible','On');
    set(handles.UpsL,'Visible','Off');
    set(handles.CT,'Visible','Off');
    set(handles.Upsmax,'Visible','Off');
elseif (type==4)
    setpixelposition(handles.CL,[512,411,83,23]);
    set(handles.CF,'Visible','On');
    setpixelposition(handles.Cmax,[512,430,83,23]);
    set(handles.CF,'String','CF=CFcrit');
    set(handles.criticalCF,'Visible','Off');
    set(handles.Cmax,'String','Cmax=CB');
    set(handles.CL,'Visible','On');
    set(handles.CB,'Visible','On');
    set(handles.Cmax,'Visible','On');
    set(handles.F_A,'Visible','On');
    set(handles.L_A,'Visible','On');
    set(handles.V_A,'Visible','On');
    set(handles.Batch,'Visible','On');
    set(handles.BatchBottom,'Visible','On');
    set(handles.CV,'Visible','On');
    set(handles.CV,'String','CV=CT');
    set(handles.CT,'Visible','Off');
    set(handles.UpsF,'String','FCF/A=LCL/A=Upsmax');
    set(handles.UpsF,'Visible','On');
    set(handles.UpsV,'Visible','On');
    set(handles.UpsL,'Visible','Off');
    set(handles.Upsmax,'Visible','Off');
elseif (type==5)
    setpixelposition(handles.CL,[512,411,83,23]);
    set(handles.CF,'Visible','On');
    set(handles.CF,'String','CF');
    set(handles.CL,'Visible','On');
    set(handles.CB,'Visible','On');
    set(handles.Cmax,'Visible','On');
    setpixelposition(handles.Cmax,[512,373,83,23]);
    set(handles.Cmax,'String','Cmax=CB');
    set(handles.criticalCF,'Visible','On');
    set(handles.F_A,'Visible','On');
    set(handles.L_A,'Visible','On');
    set(handles.V_A,'Visible','On');
    set(handles.Batch,'Visible','On');
    set(handles.BatchBottom,'Visible','On');
    set(handles.CV,'Visible','On');
    set(handles.CV,'String','CV');
    set(handles.CT,'Visible','On');
    set(handles.UpsF,'Visible','On');
    set(handles.UpsF,'String','FCF/A');
    set(handles.UpsV,'Visible','On');
    set(handles.UpsL,'Visible','On');
    set(handles.UpsL,'String','LCL/A=Upsmax');
    set(handles.Upsmax,'Visible','Off');
elseif (type==6)
    setpixelposition(handles.Cmax,[512,373,83,23]);
    setpixelposition(handles.CL,[512,411,83,23]);
    set(handles.CF,'Visible','On');
    set(handles.Cmax,'String','Cmax');
    set(handles.CF,'String','CF');
    set(handles.CL,'Visible','On');
    set(handles.CB,'Visible','On');
    set(handles.Cmax,'Visible','On');
    set(handles.criticalCF,'Visible','On');
    set(handles.F_A,'Visible','On');
    set(handles.L_A,'Visible','On');
    set(handles.V_A,'Visible','On');
    set(handles.Batch,'Visible','On');
    set(handles.BatchBottom,'Visible','On');
    set(handles.CV,'Visible','On');
    set(handles.CV,'String','CV=CT');
    set(handles.CT,'Visible','Off');
    set(handles.UpsF,'Visible','On');
    set(handles.UpsF,'String','FCF/A=LCL/A');
    set(handles.UpsV,'Visible','On');
    set(handles.UpsL,'Visible','Off');
    set(handles.Upsmax,'Visible','On');
end
set(handles.CF,'Value',0);
set(handles.CL,'Value',0);
set(handles.CB,'Value',0);
set(handles.Cmax,'Value',0);
set(handles.criticalCF,'Value',0);
set(handles.F_A,'Value',0);
set(handles.L_A,'Value',0);
set(handles.V_A,'Value',0);
set(handles.Batch,'Value',0);
set(handles.BatchBottom,'Value',0);
set(handles.CV,'Value',0);
set(handles.CT,'Value',0);
set(handles.UpsF,'Value',0);
set(handles.UpsV,'Value',0);
set(handles.UpsL,'Value',0);
set(handles.Upsmax,'Value',0);
handles.output = hObject;
guidata(hObject, handles);



function varargout = chapter3_thickener_graph_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function CF_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointX_top(2),'Visible','On');
else
   set(handles.h_pointX_top(2),'Visible','Off');
end


function CB_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointX_top(1),'Visible','On');
else
   set(handles.h_pointX_top(1),'Visible','Off');
end


function CT_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointX_bottom(2),'Visible','On');
else
   set(handles.h_pointX_bottom(2),'Visible','Off');
end


function CL_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointX_top(3),'Visible','On');
else
   set(handles.h_pointX_top(3),'Visible','Off');
end


function CV_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointX_bottom(1),'Visible','On');
else
   set(handles.h_pointX_bottom(1),'Visible','Off');
end


function F_A_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_line_top(1),'Visible','On');
else
   set(handles.h_line_top(1),'Visible','Off');
end

function L_A_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_line_top(2),'Visible','On');
else
   set(handles.h_line_top(2),'Visible','Off');
end


function Batch_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_main_top(2),'Visible','On');
else
   set(handles.h_main_top(2),'Visible','Off');
end


function criticalCF_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointX_top(4),'Visible','On');
else
   set(handles.h_pointX_top(4),'Visible','Off');
end



function Cmax_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointX_top(5),'Visible','On');
else
   set(handles.h_pointX_top(5),'Visible','Off');
end



function UpsF_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointY_top(1),'Visible','On');
else
   set(handles.h_pointY_top(1),'Visible','Off');
end


function UpsL_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointY_top(2),'Visible','On');
else
   set(handles.h_pointY_top(2),'Visible','Off');
end

function V_A_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_line_bottom(1),'Visible','On');
else
   set(handles.h_line_bottom(1),'Visible','Off');
end


function UpsV_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointY_bottom(1),'Visible','On');
else
   set(handles.h_pointY_bottom(1),'Visible','Off');
end

function BatchBottom_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_main_bottom(2),'Visible','On');
else
   set(handles.h_main_bottom(2),'Visible','Off');
end


% --- Executes on button press in showWorking.
function showWorking_Callback(hObject, eventdata, handles)
setappdata(0,'fluxgrad',handles.fluxgrad);
setappdata(0,'C',handles.C);
setappdata(0,'Ups',handles.Ups);
setappdata(0,'hasMinPoint',handles.hasMinPoint);
setappdata(0,'isOverload',handles.isOverload);
setappdata(0,'n',handles.n);
setappdata(0,'Ut',handles.Ut);
setappdata(0,'F',handles.F);
setappdata(0,'L',handles.L);
setappdata(0,'V',handles.V);
setappdata(0,'A',handles.A);
setappdata(0,'type',handles.type);
chapter3_thickener_calculation


function Upsmax_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
   set(handles.h_pointY_top(3),'Visible','On');
else
   set(handles.h_pointY_top(3),'Visible','Off');
end
