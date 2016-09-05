function varargout = realguiimage(varargin)
% REALGUIIMAGE MATLAB code for realguiimage.fig
%      REALGUIIMAGE, by itself, creates a new REALGUIIMAGE or raises the existing
%      singleton*.
%
%      H = REALGUIIMAGE returns the handle to a new REALGUIIMAGE or the handle to
%      the existing singleton*.
%
%      REALGUIIMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REALGUIIMAGE.M with the given input arguments.
%
%      REALGUIIMAGE('Property','Value',...) creates a new REALGUIIMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before realguiimage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to realguiimage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help realguiimage

% Last Modified by GUIDE v2.5 06-Jul-2015 17:44:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @realguiimage_OpeningFcn, ...
                   'gui_OutputFcn',  @realguiimage_OutputFcn, ...
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


% --- Executes just before realguiimage is made visible.
function realguiimage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to realguiimage (see VARARGIN)

% Choose default command line output for realguiimage
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes realguiimage wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global im k

% --- Outputs from this function are returned to the command line.
function varargout = realguiimage_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadimage.
function loadimage_Callback(hObject, eventdata, handles)
% hObject    handle to loadimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im k 
im=imread('my1.jpg');
 axes(handles.axes1)
 [x y, k]=impixel(im);







% --- Executes on slider movement.
function theshhold_Callback(hObject, eventdata, handles)
% hObject    handle to theshhold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global v1
v1=get(handles.theshhold,'value');

% --- Executes during object creation, after setting all properties.
function theshhold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theshhold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in process.
function process_Callback(hObject, eventdata, handles)
% hObject    handle to process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function red_Callback(hObject, eventdata, handles)
% hObject    handle to red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of red as text
%        str2double(get(hObject,'String')) returns contents of red as a double
global r
set(hanldes.red,'string',k(1));

% --- Executes during object creation, after setting all properties.
function red_CreateFcn(hObject, eventdata, handles)
% hObject    handle to red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function green_Callback(hObject, eventdata, handles)
% hObject    handle to green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of green as text
%        str2double(get(hObject,'String')) returns contents of green as a double


% --- Executes during object creation, after setting all properties.
function green_CreateFcn(hObject, eventdata, handles)
% hObject    handle to green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blue_Callback(hObject, eventdata, handles)
% hObject    handle to blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blue as text
%        str2double(get(hObject,'String')) returns contents of blue as a double


% --- Executes during object creation, after setting all properties.
function blue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function conncetivty_Callback(hObject, eventdata, handles)
% hObject    handle to conncetivty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global v2
v2=get(handles.theshhold,'value');


% --- Executes during object creation, after setting all properties.
function conncetivty_CreateFcn(hObject, eventdata, handles)
% hObject    handle to conncetivty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
