function varargout = digitalcamera(varargin)
% DIGITALCAMERA MATLAB code for digitalcamera.fig
%      DIGITALCAMERA, by itself, creates a new DIGITALCAMERA or raises the existing
%      singleton*.
%
%      H = DIGITALCAMERA returns the handle to a new DIGITALCAMERA or the handle to
%      the existing singleton*.
%
%      DIGITALCAMERA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGITALCAMERA.M with the given input arguments.
%
%      DIGITALCAMERA('Property','Value',...) creates a new DIGITALCAMERA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before digitalcamera_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to digitalcamera_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help digitalcamera

% Last Modified by GUIDE v2.5 07-Jul-2015 16:13:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @digitalcamera_OpeningFcn, ...
                   'gui_OutputFcn',  @digitalcamera_OutputFcn, ...
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


% --- Executes just before digitalcamera is made visible.
function digitalcamera_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to digitalcamera (see VARARGIN)

% Choose default command line output for digitalcamera
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes digitalcamera wait for user response (see UIRESUME)
% uiwait(handles.figure1);

imaqreset
global e
e ='Demo.jpg'
set(handles.edit1,'string',e)

% --- Outputs from this function are returned to the command line.
function varargout = digitalcamera_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid im x vid1
  x=1;
vid=videoinput('winvideo');
set(vid,'ReturnedColorSpace','rgb');
set(vid,'FramesPerTrigger',1);
set(vid,'TriggerRepeat',inf);
triggerconfig(vid,'Manual'); 
start(vid);
pause(2);
while (x>0)
trigger(vid);
im=getdata(vid);

axes(handles.axes1);
imshow(im);

end

% --- Executes on button press in click.
function click_Callback(hObject, eventdata, handles)
% hObject    handle to click (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  im new_im e

axes(handles.axes2)
imshow(im)

imwrite(new_im,e);



% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x vid
x=0;

cla(handles.axes1);
cla(handles.axes2);

stop(vid);
delete(vid);
clear(vid);
imaqreset;


% --- Executes on button press in demojpg.
function demojpg_Callback(hObject, eventdata, handles)
% hObject    handle to demojpg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global e
e=get(handles.edit1,'string');

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
