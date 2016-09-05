function varargout = imagedemo6(varargin)
% IMAGEDEMO6 MATLAB code for imagedemo6.fig
%      IMAGEDEMO6, by itself, creates a new IMAGEDEMO6 or raises the existing
%      singleton*.
%
%      H = IMAGEDEMO6 returns the handle to a new IMAGEDEMO6 or the handle to
%      the existing singleton*.
%
%      IMAGEDEMO6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEDEMO6.M with the given input arguments.
%
%      IMAGEDEMO6('Property','Value',...) creates a new IMAGEDEMO6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imagedemo6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imagedemo6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imagedemo6

% Last Modified by GUIDE v2.5 04-Jul-2015 01:08:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imagedemo6_OpeningFcn, ...
                   'gui_OutputFcn',  @imagedemo6_OutputFcn, ...
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


% --- Executes just before imagedemo6 is made visible.
function imagedemo6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imagedemo6 (see VARARGIN)

% Choose default command line output for imagedemo6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imagedemo6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.slider2,'value',3);
global v1 v2
v1=0;
v2=3;
% --- Outputs from this function are returned to the command line.
function varargout = imagedemo6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global v1
v1= get(handles.slider1,'value');


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global v2
v2= get(handles.slider2,'value');


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in loadimage.
function loadimage_Callback(hObject, eventdata, handles)
% hObject    handle to loadimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im
im=imread('im5.png');
axes(handles.axes1);
imshow(im);
% --- Executes on button press in process.
function process_Callback(hObject, eventdata, handles)
% hObject    handle to process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global v1 v2 im5 im1 im2 im3 im4  im p

im_r=im(:,:,1);
im_g=im(:,:,2);
im_b=im(:,:,3);
s=size(im);
 im1=zeros(s(1),s(2));
for i=1:s(1)
    for j=1:s(2)
        if(im_r(i,j)==34&&im_g(i,j)==177&&im_b(i,j)==76)
            im1(i,j)=1;
        end
    end
end   
%2
im2=zeros(s(1),s(2));
for i=1:s(1)
    for j=1:s(2)
        if(im_r(i,j)==0&&im_g(i,j)==162&&im_b(i,j)==232)
            im2(i,j)=1;
        end
    end
end 
 
%3
im3=zeros(s(1),s(2));
for i=1:s(1)
    for j=1:s(2)
        if(im_r(i,j)==163&&im_g(i,j)==73&&im_b(i,j)==164)
            im3(i,j)=1;
        end
    end
end 

%4
im4=zeros(s(1),s(2));
for i=1:s(1)
    for j=1:s(2)
        if(im_r(i,j)==255&&im_g(i,j)==174&&im_b(i,j)==201)
            im4(i,j)=1;
        end
    end
end   
%5
im5=zeros(s(1),s(2));
for i=1:s(1)
    for j=1:s(2)
        if(im_r(i,j)==237&&im_g(i,j)==28&&im_b(i,j)==36)
            im5(i,j)=1;
        end
    end
end 
%slider
if((0<=v1)&&(v1<1)&&(v2==3))
   axes(handles.axes2);
   imshow(im1);
elseif((1<v1)&&(v1<2)&&(v2==3))
   axes(handles.axes2);
   imshow(im2);
   elseif((2<v1)&&(v1<3)&&(v2==3))
   axes(handles.axes2);
   imshow(im3);
   
   
   
elseif((1<v2)&&(v1<2)&&(v1==0))
   axes(handles.axes2);
   imshow(im4);
   elseif((0<v2)&&(v2<1)&&(v1==0))
   axes(handles.axes2);
   imshow(im5);

elseif((1<v1)&&(v1<2)&&(1<v2)&&(v2<2))
   p=imadd(im4,im2);
   axes(handles.axes2);
   imshow(p);
   
elseif((2<v1)&&(v1<3)&&(0<v2)&&(v2<1))
   p=imadd(im5,im3);
   axes(handles.axes2);
   imshow(p);
   
   elseif((1<v1)&&(v1<2)&&(0<v2)&&(v2<1))
   p=imadd(im2,im5);
   axes(handles.axes2);
   imshow(p);
   
   elseif((2<v1)&&(v1<3)&&(1<v2)&&(v2<2))
   p=imadd(im4,im3);
   axes(handles.axes2);
   imshow(p);
   
end
    
        
    

    
