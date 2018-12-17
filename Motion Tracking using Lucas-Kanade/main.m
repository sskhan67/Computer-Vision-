%% Lab 05: Lucas Kanade Motion tracking 
 
clear all
clc

n = input(' Lucas-Kanade Tracking:\n 1. Lucas-Kanade chery picking \n 2. Lucas kanade usign Harris corner detection \n');
switch n
    case 1
        
    %Input image  
[FileName, FilePath] = uigetfile('*');
input_image = imread(strcat(FilePath,FileName));
    % display image
imshow(input_image);
trueSize = ([500,500]);% zoom to show the pixel sel. 
[height, width, numColors]=size(input_image);
cherrypick = 21;


%% 
    % Cherrypick the points-> tacking points selection 

    pixels = zeros(cherrypick, 2);% create zero nx2 vector
for i=1:cherrypick
    [pixels(i,2), pixels(i,1)] = (ginput(1));% take user input
    pixels(i,1) = uint32(pixels(i,1));% uint8 conversion and store in pixels variable
    pixels(i,2) = uint32(pixels(i,2));% uint8 conversion and store in pixels variable
    
end

%%
        % Image preparation & pass to Lucas Kanade


if( numColors == 1)
    gray_image = input_image;
    rgb_image = repmat(gray_image, [1 1 3]);
    rgb_image = cat(3, gray_image, gray_image, gray_image);
else
    rgb_image = input_image;
end

%% 
    % display the markers 

[rgb_image] = Place_Markers(rgb_image, pixels);
figure;
imshow(rgb_image);
truesize([500 500]);% to enlarge marker 

%% Lucas Kanade-> 
tryimgs = 0;
%imgnum = 0588; % image sequence number 
imgnum = 030; % image sequence number 
I = double(input_image); 
window = 11;% window size could be 11x11, 15x15, or 17x17 
%% Function call -> Lukas Kanade , while to loop through all images

while(1)
    %Jin = imread(sprintf('statue_seq/img0%d.bmp', imgnum));% input second frame 
     Jin = imread(sprintf('flowergarden/img0%d.pgm', imgnum));% input second frame 

    J = Jin;
    %For better accuracy can try to smooth the image with a gaussian blur
     
    J = double(J);
    % display image 
    imshow(rgb_image);
    truesize([500,500]);
    title('I Frame');
    [rgb_image] = Place_Markers(rgb_image, pixels);
    h = msgbox('Next Frame?');
    waitfor(h);
     
         % Lukas kanade function call 
         
         
    [pixels] = Lucas_Kanade(I, J, pixels, window);
    
    gray_image = uint8(Jin);
    rgb_image = repmat(gray_image, [1 1 3]);
    rgb_image = cat(3, gray_image, gray_image, gray_image);
    I= J;
    imgnum = imgnum+1;

end
    case 2
%Input image  
[FileName, FilePath] = uigetfile('*');
input_image = imread(strcat(FilePath,FileName));
    % display image
imshow(input_image);
trueSize = ([500,500]);% zoom to show the pixel sel. 
[height, width, numColors]=size(input_image);

    % Harris Corner detection 
[x,y] = hariscorner(double(input_image));


pixels(length(x),2)=zeros;
 for i=1:length(x)
    pixels(i,1) = uint8(x(i));
    pixels(i,2) = uint8(y(i));
%   
 end
 
 %%
        % Image preparation & pass to Lucas Kanade
        
if( numColors == 1)
    gray_image = input_image;
    rgb_image = repmat(gray_image, [1 1 3]);
    rgb_image = cat(3, gray_image, gray_image, gray_image);
else
    rgb_image = input_image;
end

%% 
    % display the markers 

[rgb_image] = Place_Markers(rgb_image, pixels);
figure;
imshow(rgb_image);
truesize([500 500]);% to enlarge marker 

%% Lucas Kanade-> 
tryimgs = 0;
%imgnum = 0588; % image sequence number 
imgnum = 030; % image sequence number 
I = double(input_image); 
window = 11;% window size could be 11x11, 15x15, or 17x17 
%% Function call -> Lukas Kanade , while to loop through all images

while(1)
    %Jin = imread(sprintf('statue_seq/img0%d.bmp', imgnum));% input second frame 
    Jin = imread(sprintf('flowergarden/img0%d.pgm', imgnum));% input second frame 

    J = Jin;
    %For better accuracy can try to smooth the image with a gaussian blur
     
    J = double(J);
    
    % display image 
    imshow(rgb_image);
    truesize([500,500]);
    title('I Frame');
    [rgb_image] = Place_Markers(rgb_image, pixels);
    h = msgbox('Next Frame?');
    waitfor(h);
     
         % Lukas kanade function call 
             
    [pixels] = Lucas_Kanade(I, J, pixels, window);
    
    
    %pixels = floor(pixels)
    gray_image = uint8(Jin);
    rgb_image = repmat(gray_image, [1 1 3]);
    rgb_image = cat(3, gray_image, gray_image, gray_image);
    I= J;
    imgnum = imgnum+1;

end
 
end
