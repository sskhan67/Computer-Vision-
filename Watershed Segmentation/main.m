%% Watershed segmentation & Watershed using Marker 
clc
clear all
%% IMAGE INPUT & uint8 to double conversion 
[FileName,FilePath]=uigetfile('*')
Image=imread(strcat(FilePath,FileName));
figure(1), imshow(uint8(Image))
title('Original Image')
image=double(Image);
[height,width,n_c]=size(image);
%% Gaussian kernel, derivative kernel and Image Magitude calculation using Convolution 
        % Sigma value Gaussian kernel and derivative kernel
Sigma=0.6;
        % Gaussian Kernel function 
G_kernel=GaussianKernel(Sigma);
        % Gaussian derivative Kernel function 
Gderiv_kernel = GaussianDerivateKernel(Sigma);
        % Input Image Magnitude 
[Magnitude,Gradient,Horizontal,Vertical,temp_Horizontal,temp_Vertical]= MagnitudeGradient(G_kernel,Gderiv_kernel,image,height,width);

        % Quantized Magnitude 
Quantized_Magnitude=uint8(Magnitude);
figure(2), imshow(double(Quantized_Magnitude))
title('Normal Watershed: Magnitude')

%% watershed function 
label = watershed(Quantized_Magnitude); 
Lshow=(255*label)/(max(max(label))); % Mapping for display purpose 
figure(3),imshow(uint8(Lshow))
title('Normal Watershed: Labels')

%% To create marker 

[Marker] = Marker(image,Magnitude,G_kernel,Gderiv_kernel);      
figure(9),imshow(uint8(Marker))
title('Marker Watershed: Watershed Marker')

    % Marker based watershed 

[wshed_marker,num_components] = watershed_marker(Quantized_Magnitude,Marker);

figure(10),imshow(uint8(255*wshed_marker/max(max(wshed_marker))))
title('Marker Watershed: Label Image')

    % ridge line identify and label
[image] = ridgeline(num_components,wshed_marker,image);
figure(11),imshow(uint8(image))
title('Ridge line Image')
