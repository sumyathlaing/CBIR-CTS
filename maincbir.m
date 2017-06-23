function varargout = maincbir(varargin)
% MAINCBIR M-file for maincbir.fig
%      MAINCBIR, by itself, creates a new MAINCBIR or raises the existing
%      singleton*.
%
%      H = MAINCBIR returns the handle to a new MAINCBIR or the handle to
%      the existing singleton*.
%
%      MAINCBIR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINCBIR.M with the given input arguments.
%
%      MAINCBIR('Property','Value',...) creates a new MAINCBIR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before maincbir_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to maincbir_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help maincbir

% Last Modified by GUIDE v2.5 11-Jun-2016 22:05:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @maincbir_OpeningFcn, ...
                   'gui_OutputFcn',  @maincbir_OutputFcn, ...
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


% --- Executes just before maincbir is made visible.
function maincbir_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to maincbir (see VARARGIN)

% Choose default command line output for maincbir
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes maincbir wait for user response (see UIRESUME)
% uiwait(handles.CBIR);


% --- Outputs from this function are returned to the command line.
function varargout = maincbir_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in txttitle.
function txttitle_Callback(hObject, eventdata, handles)
% hObject    handle to txttitle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gui;
% Hint: get(hObject,'Value') returns toggle state of txttitle


% --- Executes during object creation, after setting all properties.
function txttitle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txttitle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over txttitle.
function txttitle_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to txttitle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


