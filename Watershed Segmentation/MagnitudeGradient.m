function [Magnitude,Gradient,Horizontal,Vertical,temp_Horizontal,temp_Vertical] = MagnitudeGradient(G_kernel,Gderiv_kernel,image,height,width)

%H1(height,width)=zeros;
T=transpose(G_kernel); % vertical 1-D Gaussian 

%temp_Horizontal=Convolution(image,T);
H1=Convolution(image,T);
% Cat.pgm & cameraman.pgm->grayscale images; waldo & pepsi->RGB. If I use
% rgb2gray function, the program will throw error for grayscale image. This
% conversion is needed only for template matching (lab3 ). I didn't use it
% to avoid error but when I used RGB image the matrix size becomes tripe
% bcoz of RGB -> 3 chanel. Therefore I used the following for loop to count
% 1 chanel
 for i=1:height
     for j=1:width
         temp_Horizontal(i,j)=H1(i,j);
         
     end
 end

Horizontal=Convolution(temp_Horizontal,Gderiv_kernel);% horizontal intensity change
% figure (2),imshow((Horizontal))
% title('Horizontal image')

T1=transpose(Gderiv_kernel);% vertical Gausisn derivative 
H2=Convolution(image,G_kernel);
for i=1:height
     for j=1:width
         temp_Vertical(i,j)=H2(i,j);
         
     end
 end
Vertical=Convolution(temp_Vertical,T1);% vertical  intensity change



% figure (3),imshow((Vertical))
% title('Vertical image')

Magnitude=zeros(height,width);
Gradient=zeros(height,width);
% step 2: magnitude and angle calculation
for i=1:height
    for j=1:width
        Magnitude(i,j)=sqrt(Horizontal(i,j).^2+Vertical(i,j).^2);
        Gradient(i,j)=atan2(Horizontal(i,j),Vertical(i,j));
    end
end


% figure (4),imshow(uint8(Magnitude))
% title('Magnitude image')
% 
% figure (5),imshow((Gradient))
% title('Gradient image')
% make angle positive and convert to degree
% for i=1:height
%     for j=1:width
%         if Gradient(i,j)<0
%             Gradient(i,j)=Gradient(i,j)+pi;
%             Gradient(i,j)=(180/pi)*Gradient(i,j);
%         else 
%              Gradient(i,j)=(180/pi)*Gradient(i,j);
% 
%         end
%     end
% end
end

