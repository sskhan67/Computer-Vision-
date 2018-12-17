clc
clear 
%% m file for Lab 1
% %              Histrogram Equalization
    
    %Image input and select path
[FileName,FilePath]=uigetfile('*')
Image1=imread(strcat(FilePath,FileName));

    % rgb to grey
Image1_grey=rgb2gray(Image1);
Image2_grey=double(Image1_grey);% uint8 to doucble conversion, new copy of image
[height,width,numcolors]=size(Image2_grey);% size 

    % call histrogram equ. function
Image2_grey = histrogram_equ(height,width,Image2_grey);

    %output
out=uint8(Image2_grey); % back conversion to uint8
figure (1),imshow(out)
title('Histrogram Eq  image')


%%      Floodfill using a frontier

    % image read
[FileName,FilePath]=uigetfile('*')
image_flood_fill=imread(strcat(FilePath,FileName)); 
    
    % rgb to gray
image_flood_fill_gray=rgb2gray(image_flood_fill);
figure (2), imshow(image_flood_fill)% input image for floodfill with froontier
title('Input image for floodfill frontier image')

    % unit conversion and get size

image_flood_fill_gray1=double(image_flood_fill_gray);
[height,width,numcolors]=size(image_flood_fill_gray1);

    % get pixel coordinate from user, click on image and press
    % enter (windows)/return(mac)
[x,y] = getpts; % coordinate points,[x,y]=gets -> x=width, y=height
seed_point=[round(y), round(x)]; % round to int, seed point=[ height width] -> seed=[y_height x_width]

    % set new color
 new_color=200; 
 
    % function call 
image1=Floodfill(seed_point,image_flood_fill_gray1, new_color,height,width);

  
    
    %output image
image13=uint8(image1);% back conversion and display gray image,possible to convert it rgb
figure (3),imshow(image13)
title('Output image for floodfill frontier image')

%% Floodfill with seperate output

    
% image read and path selection
[FileName,FilePath]=uigetfile('*')
image11=imread(strcat(FilePath,FileName));

% rgb to gray
image12=rgb2gray(image11);
image1=double(image12);
[height,width,numcolors]=size(image1);


    % get pixel coordinate from user, click on image and press
    % enter (windows)/return(mac)
figure (4),imshow(image11)
title('Floodfil SO Input image')
[x,y] = getpts;% coordinate points,[x,y]=gets -> x=width, y=height
seed_point=[round(y), round(x)];% round to int, seed point=[ height width] -> seed=[y_height x_width]

    % new color selection and create output image fills with zeros
new_color=255;
output(height,width)=zeros();

    %call function
output1=floodfill_so_fun(seed_point,image1,new_color,height,width,output);

    % display image
output=uint8(output1);% double to uint8, possible to display in rgb,  not imp here so ommit
figure(5),imshow(output1)
title('Floodfill image with seperate output')

%% Double thresolding 

   % Image read and path selection
[FileName,FilePath]=uigetfile('*')
Image1=imread(strcat(FilePath,FileName));

    % new copy of image and size 
Image1_grey=Image1;
Image2_grey=double(Image1_grey);
[height,width,numcolors]=size(Image2_grey);

    %call function
output=double_threshold_function(height,width,Image2_grey);

    %outout image 
Image3_grey=uint8(output);
figure(8),imshow(Image3_grey)
title('Double threshold image')



%% Erosion
 
    % Image input
[FileName,FilePath]=uigetfile('*')
Image1=imread(strcat(FilePath,FileName));

    %size
Image1_grey=Image1;
Image2_grey=double(Image1_grey);% new copy of image
[height,width,numcolors]=size(Image2_grey);

    % function call=> double threshold-> t_high, t_low, 
output=double_threshold_function(height,width,Image2_grey);

% double thesrhold image output
figure(9), imshow(output)
title('Double treshold image')

    % Structuring Element(SE)
s=[0 254 0;254 254 254;0 254 0];% SE matrix
se=254;% SE 

    % copy double threshold output
A=output;% output from double threshold and create outout1 image filled with zero
output1(height,width)=zeros();

    %function call-> erosion (don't confused with name)
output1=dilation_function11(A,height,width,se,output1);

    %output image
figure(10),imshow(output1)
title('Erosion image')


%% Dilation

% Image read and path selection 
[FileName,FilePath]=uigetfile('*')
Image1=imread(strcat(FilePath,FileName));
    
    % new copy of image and size 
Image1_grey=Image1;
Image2_grey=double(Image1_grey);
[height,width,numcolors]=size(Image2_grey);

    %funcition call-> double threshold
output=double_threshold_function(height,width,Image2_grey);

    % Structuring element (SE)
s=[0 254 0;254 254 254;0 254 0];
se=254;
    % output from double threshold
A=output;

    %funcition call-> double threshold
output1=dilation_function(A,height,width,se);

    %output image
output_dilation=uint8(output1);   
figure(11),imshow(output_dilation)
title('Dilation image')


%% Ridle-Calvard Thresholding

    % Image read and path selection
[FileName,FilePath]=uigetfile('*')
Image1=imread(strcat(FilePath,FileName));

    % rgb to grey and size
%Image1_grey=rgb2gray(Image1);
Image2_grey=double(Image1);% new copy of image
[height,width,numcolors]=size(Image2_grey);

    % function -> thresholding
Image2_grey=thresholding_fun(height,width,Image2_grey);

    %output image
Image3_grey=uint8(Image2_grey);
figure(12),imshow(Image2_grey)
title('Ridle-Calvard Thresholding image')
title('Ridle-Calvard Thresholding')
%%



