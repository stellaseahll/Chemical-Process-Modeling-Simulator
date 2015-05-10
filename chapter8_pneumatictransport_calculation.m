function varargout = chapter8_pneumatictransport_calculation(varargin)
% CHAPTER8_PNEUMATICTRANSPORT_CALCULATION MATLAB code for chapter8_pneumatictransport_calculation.fig
%      CHAPTER8_PNEUMATICTRANSPORT_CALCULATION, by itself, creates a new CHAPTER8_PNEUMATICTRANSPORT_CALCULATION or raises the existing
%      singleton*.
%
%      H = CHAPTER8_PNEUMATICTRANSPORT_CALCULATION returns the handle to a new CHAPTER8_PNEUMATICTRANSPORT_CALCULATION or the handle to
%      the existing singleton*.
%
%      CHAPTER8_PNEUMATICTRANSPORT_CALCULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER8_PNEUMATICTRANSPORT_CALCULATION.M with the given input arguments.
%
%      CHAPTER8_PNEUMATICTRANSPORT_CALCULATION('Property','Value',...) creates a new CHAPTER8_PNEUMATICTRANSPORT_CALCULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter8_pneumatictransport_calculation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter8_pneumatictransport_calculation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter8_pneumatictransport_calculation

% Last Modified by GUIDE v2.5 01-Jan-2014 10:49:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter8_pneumatictransport_calculation_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter8_pneumatictransport_calculation_OutputFcn, ...
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


% --- Executes just before chapter8_pneumatictransport_calculation is made visible.
function chapter8_pneumatictransport_calculation_OpeningFcn(hObject, eventdata, handles, varargin)


addpath(genpath('chapter3'));
addpath(genpath('chapter2'));
addpath(genpath('chapter7'));
set(handles.pressureHorizontal,'Value',0);
set(handles.parametersHorizontal,'Value',0);
set(handles.pressureVertical,'Value',0);
set(handles.parametersVertical,'Value',0);
set(handles.pressureBend,'Value',0);
set(handles.parametersBend,'Value',0);
set(handles.pressureTotal,'Value',0);
set(handles.termV,'Value',0);
set(handles.chokeV,'Value',0);
set(handles.graph,'Value',0);
set(handles.saltV,'Value',0);
handles.Ufs=getappdata(0,'Ufs');
handles.denF=getappdata(0,'denF');
handles.denP=getappdata(0,'denP');
handles.vis=getappdata(0,'vis');
handles.massP=getappdata(0,'massP');
handles.size=getappdata(0,'size');
handles.dia=getappdata(0,'dia');
handles.horizontalLength=getappdata(0,'horizontalLength');
handles.verticalLengthUp=getappdata(0,'verticalLengthUp');
handles.verticalLengthDown=getappdata(0,'verticalLengthDown');
handles.numBends=getappdata(0,'numBends');
handles.type=getappdata(0,'type');
handles.pHorizontal=getappdata(0,'pHorizontal');
handles.pVertical=getappdata(0,'pVertical');
handles.pBend=getappdata(0,'pBend');
handles.pTotal=getappdata(0,'pTotal');
[handles.Ut, handles.Re, handles.Cd]=calcTermV(handles.denF,handles.denP,handles.size,handles.vis);
if (handles.type==3)
    handles.isAcceleratedHorizontal=1;
    handles.isAcceleratedVertical=1;
elseif (handles.type==2)
    handles.isAcceleratedHorizontal=1;
    handles.isAcceleratedVertical=0;
elseif (handles.type==1)
    handles.isAcceleratedHorizontal=0;
    handles.isAcceleratedVertical=1;
end
position=[514 414 314 214 114];
set(handles.panelTotal,'Visible','On');
setpixelposition(handles.panelTotal,[922,574,212,90]);
set(handles.panelHorizontal,'Visible','Off');
set(handles.panelVertical,'Visible','Off');
set(handles.panelBends,'Visible','Off');

set(handles.panelValidate,'Visible','Off');
set(handles.panelTerminalV,'Visible','Off');
if (handles.horizontalLength~=0)
    set(handles.panelHorizontal,'Visible','On');
    setpixelposition(handles.panelHorizontal,[922,position(1),212,90]);
    position(1)=[];
end
if (handles.verticalLengthDown~=0||handles.verticalLengthUp~=0)
    set(handles.panelVertical,'Visible','On');
    setpixelposition(handles.panelVertical,[922,position(1),212,90]);
    position(1)=[];
end
if (handles.numBends~=0)
    set(handles.panelBends,'Visible','On');
    setpixelposition(handles.panelBends,[922,position(1),212,90]);
    position(1)=[];
end
set(handles.panelValidate,'Visible','On');
setpixelposition(handles.panelValidate,[922,position(1),212,90]);
position(1)=[];
if (handles.verticalLengthUp~=0||handles.verticalLengthDown~=0||handles.numBends~=0)
    set(handles.panelTerminalV,'Visible','On');
    setpixelposition(handles.panelTerminalV,[922,position(1),212,90]);
end
axes(handles.plot);
cla;
handles.output = hObject;
guidata(hObject, handles);



function varargout = chapter8_pneumatictransport_calculation_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function plot_CreateFcn(hObject, eventdata, handles)


function panelHorizontal_SelectionChangeFcn(hObject, eventdata, handles)
set(handles.panelVertical,'SelectedObject',[]);
set(handles.panelBends,'SelectedObject',[]);
set(handles.panelTotal,'SelectedObject',[]);
set(handles.panelValidate,'SelectedObject',[]);
set(handles.panelTerminalV,'SelectedObject',[]);
if (hObject == handles.parametersHorizontal)
    axes(handles.plot);
    cla;
    showHorizontal(handles.size,handles.denF,handles.denP,handles.vis,handles.massP,handles.dia,handles.Ufs,handles.horizontalLength,handles.isAcceleratedHorizontal,1);
else
    axes(handles.plot);
    cla;
    showHorizontal(handles.size,handles.denF,handles.denP,handles.vis,handles.massP,handles.dia,handles.Ufs,handles.horizontalLength,handles.isAcceleratedHorizontal,2);
end


function panelVertical_SelectionChangeFcn(hObject, eventdata, handles)
set(handles.panelHorizontal,'SelectedObject',[]);
set(handles.panelBends,'SelectedObject',[]);
set(handles.panelTotal,'SelectedObject',[]);
set(handles.panelValidate,'SelectedObject',[]);
set(handles.panelTerminalV,'SelectedObject',[]);
if (hObject == handles.parametersVertical)
    axes(handles.plot);
    cla;
    showVertical(handles.size,handles.denF,handles.denP,handles.vis,handles.massP,handles.dia,handles.Ufs,handles.verticalLengthUp,handles.verticalLengthDown,handles.isAcceleratedVertical,1);
else
    axes(handles.plot);
    cla;
    showVertical(handles.size,handles.denF,handles.denP,handles.vis,handles.massP,handles.dia,handles.Ufs,handles.verticalLengthUp,handles.verticalLengthDown,handles.isAcceleratedVertical,2);
end

function panelBends_SelectionChangeFcn(hObject, eventdata, handles)
set(handles.panelHorizontal,'SelectedObject',[]);
set(handles.panelVertical,'SelectedObject',[]);
set(handles.panelTotal,'SelectedObject',[]);
set(handles.panelValidate,'SelectedObject',[]);
set(handles.panelTerminalV,'SelectedObject',[]);
if (hObject == handles.parametersBend)
    axes(handles.plot);
    cla;
    showBend(handles.size,handles.denF,handles.denP,handles.vis,handles.massP,handles.dia,handles.Ufs,handles.numBends,1);
else
    axes(handles.plot);
    cla;
    showBend(handles.size,handles.denF,handles.denP,handles.vis,handles.massP,handles.dia,handles.Ufs,handles.numBends,2);
end

function panelTotal_SelectionChangeFcn(hObject, eventdata, handles)
set(handles.panelHorizontal,'SelectedObject',[]);
set(handles.panelVertical,'SelectedObject',[]);
set(handles.panelBends,'SelectedObject',[]);
set(handles.panelValidate,'SelectedObject',[]);
set(handles.panelTerminalV,'SelectedObject',[]);
if (hObject == handles.pressureTotal)
    axes(handles.plot);
    cla;
    showTotal(handles.pBend,handles.pVertical,handles.pHorizontal,handles.pTotal);
else
end

function panelValidate_SelectionChangeFcn(hObject, eventdata, handles)
set(handles.panelHorizontal,'SelectedObject',[]);
set(handles.panelVertical,'SelectedObject',[]);
set(handles.panelBends,'SelectedObject',[]);
set(handles.panelTotal,'SelectedObject',[]);
set(handles.panelTerminalV,'SelectedObject',[]);
if (hObject == handles.chokeV)
    axes(handles.plot);
    cla;
    showChoking(handles.size,handles.denF,handles.denP,handles.vis,handles.massP,handles.dia,handles.Ufs);
else
    axes(handles.plot);
    cla;
    showSaltation(handles.size,handles.denF,handles.denP,handles.vis,handles.massP,handles.dia,handles.Ufs);
end

function panelTerminalV_SelectionChangeFcn(hObject, eventdata, handles)
set(handles.panelHorizontal,'SelectedObject',[]);
set(handles.panelVertical,'SelectedObject',[]);
set(handles.panelBends,'SelectedObject',[]);
set(handles.panelTotal,'SelectedObject',[]);
set(handles.panelValidate,'SelectedObject',[]);
if (hObject == handles.termV)
    axes(handles.plot);
    cla;
    showEquationGraph(handles.size,handles.denF,handles.denP,handles.vis,1,handles.Re,handles.Cd,handles.Ut);
else
    setappdata(0,'re',handles.Re);
    setappdata(0,'cd',handles.Cd);
    chapter2_terminalV_graph
end

% 
% function resetButton_Callback(hObject, eventdata, handles)
% initialize_gui(gcbf, handles);
% 
% function initialize_gui(fig_handle, handles)
% set(handles.panelHorizontal, 'SelectedObject', handles.parametersHorizontal);
% set(handles.panelVertical, 'SelectedObject', handles.parametersVertical);
% set(handles.panelBends, 'SelectedObject', handles.parametersBend);
% set(handles.panelTotal, 'SelectedObject', handles.pressureTotal);
% set(handles.panelTerminalV, 'SelectedObject', handles.termV);
% set(handles.text10,'String','First');
% set(handles.text11,'String','First');
% set(handles.text12,'String','First');
% set(handles.text13,'String','First');
% set(handles.text14,'String','First');
% set(handles.text15,'String','First');
% guidata(handles.figure1, handles);
% 

%MY ADDED CODE ENDS,
%DELETE THE COMMENTS AFTER YOU HAVE UNDERSTTTOOODEDD THE CODE.
%HEHEH
