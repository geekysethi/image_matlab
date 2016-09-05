function varargout = imageguidemo5(varargin)
% IMAGEGUIDEMO5 MATLAB code for imageguidemo5.fig
%      IMAGEGUIDEMO5, by itself, creates a new IMAGEGUIDEMO5 or raises the existing
%      singleton*.
%
%      H = IMAGEGUIDEMO5 returns the handle to a new IMAGEGUIDEMO5 or the handle to
%      the existing singleton*.
%
%      IMAGEGUIDEMO5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEGUIDEMO5.M with the given input arguments.
%
%      IMAGEGUIDEMO5('Property','Value',...) creates a new IMAGEGUIDEMO5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imageguidemo5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imageguidemo5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imageguidemo5

% Last Modified by GUIDE v2.5 03-Jul-2015 23:24:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imageguidemo5_OpeningFcn, ...
                   'gui_OutputFcn',  @imageguidemo5_OutputFcn, ...
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


% --- Executes just before imageguidemo5 is made visible.
function imageguidemo5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imageguidemo5 (see VARARGIN)

% Choose default command line output for imageguidemo5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imageguidemo5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global c1 c2 c3
c1=0;
c2=0;
c3=0;

% --- Outputs from this function are returned to the command line.
function varargout = imageguidemo5_OutputFcn(hObject, eventdata, handles) 
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
global  im   im1 im2 im3 
im=imread('im.png');
axes(handles.axes1);
imshow(im);

im_r=im(:,:,1);
im_g=im(:,:,2);
im_b=im(:,:,3);
s=size(im);
 im1=zeros(s(1),s(2));
for i=1:s(1)
    for j=1:s(2)
        if(im_r(i,j)==163&&im_g(i,j)==73&&im_b(i,j)==164)
            im1(i,j)=1;
        end
    end
end   
%2
im2=zeros(s(1),s(2));
for i=1:s(1)
    for j=1:s(2)
        if(im_r(i,j)==237&&im_g(i,j)==28&&im_b(i,j)==36)
            im2(i,j)=1;
        end
    end
end 
 
%3
im3=zeros(s(1),s(2));
for i=1:s(1)
    for j=1:s(2)
        if(im_r(i,j)==34&&im_g(i,j)==177&&im_b(i,j)==76)
            im3(i,j)=1;
        end
    end
end 



% --- Executes on button press in object1.
function object1_Callback(hObject, eventdata, handles)
% hObject    handle to object1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of object1
global c1 
c1=get(handles.object1,'value');


% --- Executes on button press in object2.
function object2_Callback(hObject, eventdata, handles)
% hObject    handle to object2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of object2
global c2
c2=get(handles.object2,'value');


% --- Executes on button press in object3.
function object3_Callback(hObject, eventdata, handles)
% hObject    handle to object3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of object3

global c3 
c3=get(handles.object3,'value');

% --- Executes on button press in process.
function process_Callback(hObject, eventdata, handles)
% hObject    handle to process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c1 c2 c3   x y z p im1 im2 im3 u



%checkboxses
if((c1==1)&&(c2==0)&&(c3==0))
    axes(handles.axes2)
    imshow(im1)

elseif((c2==1)&&(c1==0)&&(c3==0))
    axes(handles.axes2)
    imshow(im2)



    
elseif((c3==1)&&(c2==0)&&(c1==0))
    axes(handles.axes2)
    imshow(im3)


    
    
    
elseif((c1==1)&&(c2==1)&&(c3==0))
     x=imadd(im1,im2);
     axes(handles.axes2)
     imshow(x)
 
 elseif((c1==1)&&(c3==1)&&(c2==0))
     y=imadd(im1,im3);
     axes(handles.axes2)
     imshow(y)
 
 elseif((c3==1)&&(c2==1)&&(c1==0))
     z=imadd(im3,im2);
     axes(handles.axes2)
     imshow(z)
 
 elseif((c1==1)&&(c2==1)&&(c3==1))
    u=imadd(im1,im2);
    p=imadd(u,im3);
     
     axes(handles.axes2)
     imshow(p)
end
 
 if((c1==0)&&(c2==0)&&(c3==0))
     cla('reset')
 end


    
