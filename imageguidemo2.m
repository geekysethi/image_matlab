function varargout = imageguidemo2(varargin)
% IMAGEGUIDEMO2 MATLAB code for imageguidemo2.fig
%      IMAGEGUIDEMO2, by itself, creates a new IMAGEGUIDEMO2 or raises the existing
%      singleton*.
%
%      H = IMAGEGUIDEMO2 returns the handle to a new IMAGEGUIDEMO2 or the handle to
%      the existing singleton*.
%
%      IMAGEGUIDEMO2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEGUIDEMO2.M with the given input arguments.
%
%      IMAGEGUIDEMO2('Property','Value',...) creates a new IMAGEGUIDEMO2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imageguidemo2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imageguidemo2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imageguidemo2

% Last Modified by GUIDE v2.5 03-Jul-2015 17:17:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imageguidemo2_OpeningFcn, ...
                   'gui_OutputFcn',  @imageguidemo2_OutputFcn, ...
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


% --- Executes just before imageguidemo2 is made visible.
function imageguidemo2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imageguidemo2 (see VARARGIN)

% Choose default command line output for imageguidemo2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imageguidemo2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global r g b

% --- Outputs from this function are returned to the command line.
function varargout = imageguidemo2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function red_Callback(hObject, eventdata, handles)
% hObject    handle to red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global r g b
r=get(handles.red,'value');
set(handles.edit1,'string',r);
t=ones(100,100);
im_final(:,:,1)=t*r;
im_final(:,:,2)=t*g;
im_final(:,:,3)=t*b;
axes(handles.axes1);
imshow(uint8(im_final));





% --- Executes during object creation, after setting all properties.
function red_CreateFcn(hObject, eventdata, handles)
% hObject    handle to red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function green_Callback(hObject, eventdata, handles)
% hObject    handle to green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global r g b
g=get(handles.green,'value');
set(handles.edit2,'string',g);
t=ones(100,100);
im_final(:,:,1)=t*r;
im_final(:,:,2)=t*g;
im_final(:,:,3)=t*b;
axes(handles.axes1);
imshow(uint8(im_final));


% --- Executes during object creation, after setting all properties.
function green_CreateFcn(hObject, eventdata, handles)
% hObject    handle to green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function blue_Callback(hObject, eventdata, handles)
% hObject    handle to blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global r g b
b=get(handles.blue,'value');
set(handles.edit3,'string',b);
t=ones(100,100);
im_final(:,:,1)=t*r;
im_final(:,:,2)=t*g;
im_final(:,:,3)=t*b;
axes(handles.axes1);
imshow(uint8(im_final));


% --- Executes during object creation, after setting all properties.
function blue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
