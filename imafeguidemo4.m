function varargout = imafeguidemo4(varargin)
% IMAFEGUIDEMO4 MATLAB code for imafeguidemo4.fig
%      IMAFEGUIDEMO4, by itself, creates a new IMAFEGUIDEMO4 or raises the existing
%      singleton*.
%
%      H = IMAFEGUIDEMO4 returns the handle to a new IMAFEGUIDEMO4 or the handle to
%      the existing singleton*.
%
%      IMAFEGUIDEMO4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAFEGUIDEMO4.M with the given input arguments.
%
%      IMAFEGUIDEMO4('Property','Value',...) creates a new IMAFEGUIDEMO4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imafeguidemo4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imafeguidemo4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imafeguidemo4

% Last Modified by GUIDE v2.5 03-Jul-2015 19:45:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imafeguidemo4_OpeningFcn, ...
                   'gui_OutputFcn',  @imafeguidemo4_OutputFcn, ...
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


% --- Executes just before imafeguidemo4 is made visible.
function imafeguidemo4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imafeguidemo4 (see VARARGIN)

% Choose default command line output for imafeguidemo4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imafeguidemo4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imafeguidemo4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im=imread('im.png');
axes(handles.axes1);
imshow(im);

% --- Executes on button press in process.
function process_Callback(hObject, eventdata, handles)
% hObject    handle to process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global v1 v2 v3 im r g b
if(v1==1)
    r=163;
    g=73;
    b=164;

elseif(v2==1)
r=237;
g=28;
b=36;
elseif(v3==1)
r=34;
g=177;
b=76;
end
im_r=im(:,:,1);
im_g=im(:,:,2);
im_b=im(:,:,3);
s=size(im);
new_im=zeros(s(1),s(2));
for i=1:s(1)
    for j=1:s(2)
        if(im_r(i,j)==r&&im_g(i,j)==g&&im_b(i,j)==b)
            new_im(i,j)=1;
        end
    end
end
axes(handles.axes2)
imshow(new_im)
    


% --- Executes on button press in object1.
function object1_Callback(hObject, eventdata, handles)
% hObject    handle to object1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of object1

global v1 v2 v3 
v1=get(handles.object1,'value');
if(v1==1)
    v2=0;
    v3=0; 
    set(handles.object2,'value',0);
    set(handles.object3,'value',0);    
end

% --- Executes on button press in object2.
function object2_Callback(hObject, eventdata, handles)
% hObject    handle to object2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of object2

global v1 v2 v3 
v2=get(handles.object2,'value');
if(v2==1)
    v1=0;
    v3=0; 
    set(handles.object1,'value',0);
    set(handles.object3,'value',0);    
end

% --- Executes on button press in object3.
function object3_Callback(hObject, eventdata, handles)
% hObject    handle to object3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of object3

global v1 v2 v3 
v3=get(handles.object3,'value');
if(v3==1)
    v1=0;
    v2=0; 
    set(handles.object2,'value',0);
    set(handles.object1,'value',0);    
end
