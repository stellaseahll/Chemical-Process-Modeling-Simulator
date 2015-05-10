function varargout = chapter2_particleSize_graph(varargin)
% CHAPTER2_PARTICLESIZE_GRAPH MATLAB code for chapter2_particleSize_graph.fig
%      CHAPTER2_PARTICLESIZE_GRAPH, by itself, creates a new CHAPTER2_PARTICLESIZE_GRAPH or raises the existing
%      singleton*.
%
%      H = CHAPTER2_PARTICLESIZE_GRAPH returns the handle to a new CHAPTER2_PARTICLESIZE_GRAPH or the handle to
%      the existing singleton*.
%
%      CHAPTER2_PARTICLESIZE_GRAPH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER2_PARTICLESIZE_GRAPH.M with the given input arguments.
%
%      CHAPTER2_PARTICLESIZE_GRAPH('Property','Value',...) creates a new CHAPTER2_PARTICLESIZE_GRAPH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter2_particleSize_graph_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter2_particleSize_graph_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter2_particleSize_graph

% Last Modified by GUIDE v2.5 10-Dec-2013 22:32:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter2_particleSize_graph_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter2_particleSize_graph_OutputFcn, ...
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


% --- Executes just before chapter2_particleSize_graph is made visible.
function chapter2_particleSize_graph_OpeningFcn(hObject, eventdata, handles, varargin)
addpath(genpath('chapter2'));

re=getappdata(0,'re');
cd=getappdata(0,'cd');

plotDragForce;
hold on
plotSize(re,cd);
hold off
set(handles.plot,'visible','on');
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chapter2_particleSize_graph wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chapter2_particleSize_graph_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
