function varargout = chapter3_sedimentation_calculation(varargin)
% CHAPTER3_SEDIMENTATION_CALCULATION MATLAB code for chapter3_sedimentation_calculation.fig
%      CHAPTER3_SEDIMENTATION_CALCULATION, by itself, creates a new CHAPTER3_SEDIMENTATION_CALCULATION or raises the existing
%      singleton*.
%
%      H = CHAPTER3_SEDIMENTATION_CALCULATION returns the handle to a new CHAPTER3_SEDIMENTATION_CALCULATION or the handle to
%      the existing singleton*.
%
%      CHAPTER3_SEDIMENTATION_CALCULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER3_SEDIMENTATION_CALCULATION.M with the given input arguments.
%
%      CHAPTER3_SEDIMENTATION_CALCULATION('Property','Value',...) creates a new CHAPTER3_SEDIMENTATION_CALCULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter3_sedimentation_calculation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter3_sedimentation_calculation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter3_sedimentation_calculation

% Last Modified by GUIDE v2.5 27-Dec-2013 20:11:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter3_sedimentation_calculation_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter3_sedimentation_calculation_OutputFcn, ...
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


% --- Executes just before chapter3_sedimentation_calculation is made visible.
function chapter3_sedimentation_calculation_OpeningFcn(hObject, eventdata, handles, varargin)
addpath(genpath('chapter3'));

handles.Uint=getappdata(0,'Uint');
handles.Ut=getappdata(0,'Ut');
handles.n=getappdata(0,'n');
handles.C=getappdata(0,'C');
handles.Ups=getappdata(0,'Ups');
handles.type=getappdata(0,'type');
axes(handles.plot);
cla;
if ((handles.type==1)&&isnan(handles.C(1)))
   showSedimentation1(handles.n,handles.Ut,handles.C,handles.Uint,handles.Ups);
elseif (handles.type==1)
    showSedimentation2(handles.n,handles.Ut,handles.C,handles.Uint,handles.Ups);
else
     showSedimentation3(handles.n,handles.Ut,handles.C,handles.Uint,handles.Ups);
end
handles.output = hObject;
guidata(hObject, handles);



function varargout = chapter3_sedimentation_calculation_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate plot
