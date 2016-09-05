function varargout = realimgegui2(varargin)
% REALIMGEGUI2 MATLAB code for realimgegui2.fig
%      REALIMGEGUI2, by itself, creates a new REALIMGEGUI2 or raises the existing
%      singleton*.
%
%      H = REALIMGEGUI2 returns the handle to a new REALIMGEGUI2 or the handle to
%      the existing singleton*.
%
%      REALIMGEGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REALIMGEGUI2.M with the given input arguments.
%
%      REALIMGEGUI2('Property','Value',...) creates a new REALIMGEGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before realimgegui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to realimgegui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help realimgegui2

% Last Modified by GUIDE v2.5 06-Jul-2015 19:09:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @realimgegui2_OpeningFcn, ...
                   'gui_OutputFcn',  @realimgegui2_OutputFcn, ...
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


% --- Executes just before realimgegui2 is made visible.
function realimgegui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to realimgegui2 (see VARARGIN)

% Choose default command line output for realimgegui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
clear all

global v1 v2 v3 s1
v1=0;
v2=0;
v3=0;
s1=0;


% UIWAIT makes realimgegui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = realimgegui2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadbutton.
function loadbutton_Callback(hObject, eventdata, handles)
% hObject    handle to loadbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  im    k 
 im=imread('my1.jpg');
 im=imresize(im,0.5);
 axes(handles.axes1);
 k=impixel(im);
 
set(handles.edit1,'string',k(1));
set(handles.edit2,'string',k(2));
set(handles.edit3,'string',k(3));

 imshow(im)



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global  k s1 im k1  v1 v2 v3
s1=get(handles.slider1,'value');
if(v1==1)
k1=k;
end

if(v2==1)
k1=rgb2hsv(k);
end
if(v3==1)
k1=rgb2ycbcr(k);
end

r_min=k1(1)-k1(1)*s1;
r_max=k1(1)+k1(1)*s1;
g_min=k1(2)-k1(2)*s1;
g_max=k1(2)+k1(2)*s1;
b_min=k1(3)-k1(3)*s1;
b_max=k1(3)+k1(2)*s1;

im_r=im(:,:,1);
im_g=im(:,:,2);
im_b=im(:,:,3);
s=size(im);
new_im=zeros(s(1),s(2));
  ind=find ((im_r>r_min&im_r<=r_max)&(im_g>g_min&im_g<=g_max)&(im_b>b_min&im_b<=b_max));
            new_im(ind)=1;
            
            
            
new_im1=bwareaopen(new_im,25000);
new_im2=imfill(new_im1,'Holes');
dd=bwconncomp(new_im2);
axes(handles.axes2);
imshow(new_im);







% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% --- Executes on button press in rgb.
function rgb_Callback(hObject, eventdata, handles)
% hObject    handle to rgb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rgb

global v1 v2 v3 
v1=get(handles.rgb,'value');
if(v1==1)
    v2=0;
    v3=0;
   
    set(handles.hsv,'value',0);
    
    set(handles.ycbcr,'value',0);
end



% --- Executes on button press in hsv.
function hsv_Callback(hObject, eventdata, handles)
% hObject    handle to hsv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of hsv


global v1 v2 v3 
v2=get(handles.hsv,'value');
if(v2==1)
    v1=0;
    v3=0;
   
    set(handles.rgb,'value',0);
    
    set(handles.ycbcr,'value',0);

set(handles.slider1,'max',500)
end


% --- Executes on button press in ycbcr.
function ycbcr_Callback(hObject, eventdata, handles)
% hObject    handle to ycbcr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ycbcr

global v1 v2 v3 
v3=get(handles.ycbcr,'value');
if(v3==1)
    v2=0;
    v1=0;
   
    set(handles.hsv,'value',0);
    
    set(handles.rgb,'value',0);
    set(handles.slider1,'max',10)
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
