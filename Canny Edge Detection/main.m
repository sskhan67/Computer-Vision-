%% Canny edge detection and Template matching 
clc
clear all

        % Image input, Uint8 to double conversion, image size determination 
[FileName,FilePath]=uigetfile('*')
Image=imread(strcat(FilePath,FileName));

figure(1),imshow(uint8(Image))
title('Original image')

image=double(Image);
[height,width,n_c]=size(image);
        % Sigma value Gaussian kernel and derivative kernel
Sigma=0.6;
        % Gaussian Kernel function 
G_kernel=GaussianKernel(Sigma);
        % aussian derivative Kernel function 
Gderiv_kernel = GaussianDerivateKernel(Sigma);



%% Canny Edge Detection 
        % calculate : Horizental and vertical intensity change, Magitude and angle 
[Magnitude,Gradient,Horizontal,Vertical,temp_Horizontaltemp_Vertical] = MagnitudeGradient(G_kernel,Gderiv_kernel,image,height,width);
figure (2),imshow((Horizontal))
title('Horizontal image')

figure (3),imshow((Vertical))
title('Vertical image')

figure (4),imshow(uint8(Magnitude))
title('Magnitude image')

figure (5),imshow((Gradient))
title('Gradient image')
% make angle positive and convert to degree

for i=1:height
    for j=1:width
        if Gradient(i,j)<0
            Gradient(i,j)=Gradient(i,j)+pi;
            Gradient(i,j)=(180/pi)*Gradient(i,j);
        else 
             Gradient(i,j)=(180/pi)*Gradient(i,j);

        end
    end
end

        % Non Maximal Suppression
[supress] = NonMaxSuppression(Magnitude,Gradient,height,width);
figure (6),imshow(uint8(supress))
title('supress image')
        % hystersis and edge linking 
[Hystersis,Edges] = Hysteresis(supress,height,width,90);% percentage=90
figure (7),imshow((Edges))
title('Edges image')

Champfer=ChamferFunction(Edges);
figure(8),imshow(Champfer)
title('Original image Chamfer')
%% Template Matching 
x = input("Do you want to perform Template macthing? Please select from the below: \n a. Type 1 for template macthing\n b. Press 2 for No\n");

if x==1
    
    
    
    
    
    
        % Template image input 
    d1='Select your template image '
    [FileName,FilePath]=uigetfile('*')
    Image_temp=imread(strcat(FilePath,FileName));
    figure(9),imshow(uint8(Image_temp))
    title('Template image')
    Image_temp1=rgb2gray(Image_temp);
    image_temp=double(Image_temp1);
    [h,w,n_c1]=size(image_temp);
            % calculate : Horizental and vertical intensity change, Magitude and angle 

    [Magnitude1,Gradient1,Horizontal1,Vertical1] = MagnitudeGradient(G_kernel,Gderiv_kernel,image_temp,h,w);
    figure (10),imshow((Horizontal1))
    title('Temp. Horizontal image')
    figure (11),imshow((Vertical1))
    title('Temp. Vertical image')
    figure (12),imshow(uint8(Magnitude1))
    title('Temp. Magnitude image')
    figure (13),imshow((Gradient1))
    title('Temp. Gradient image')
    %  make angle positive and convert to degree

    for i=1:h
        for j=1:w
            if Gradient1(i,j)<0
            Gradient1(i,j)=Gradient1(i,j)+pi;
            Gradient1(i,j)=(180/pi)*Gradient1(i,j);
             else 
             Gradient1(i,j)=(180/pi)*Gradient1(i,j);

            end
        end
    end
            % Non Maximal Suppression
    [supress1] = NonMaxSuppression(Magnitude1,Gradient1,h,w); 
    figure (14),imshow(uint8(supress1))
    title('Temp. supress image')
            % hystersis and edge linking 
     per=input('Enter percentage value for Template image (Let say 90%):\n');       
    [Hystersis1,Edges1] = Hysteresis(supress1,h,w,per);
    figure (15),imshow((Edges1))
    title('Temp. Edges image')
            % Chamfer distance function  
    Champfer_temp=ChamferFunction(Edges1);
    figure(16),imshow(Champfer_temp)
    title('Temp chamfer')
            % SSD Function  
    [O1] = SSD1(Champfer,Champfer_temp);
            % Min value calculation and index of min value 
    [min_val,idx]=min(O1(:));
    [row,col]=ind2sub(size(O1),idx);
            %  Draw rectangle over original image 
    img = Image;
    pos = [col(1), row(1), w, h];    
    figure(17),imshow(img);hold on
    rectangle('Position',pos,'EdgeColor','r')
    else 
        J='Thanks for not chosing template matching '

end