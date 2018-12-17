% double threshold function

% Threholding function

function output = double_threshold_function(height,width,Image2_grey)
%% Histrogram
hist(256)=zeros;
for i=1:height
    for j=1:width
        hist(Image2_grey(i,j)+1)=hist(Image2_grey(i,j)+1)+1;% for Image2(i,j)-> 
    end
end
%% m_0 Running sum of Hist
bin1=hist;
for i=1:length(bin1)-1
    bin1(i+1)=bin1(i)+bin1(i+1);
end
% % m_1 Running sum of weighted Hist
bin2=hist;
for i=1:256
    bin2(i)=bin2(i)*i;
end
for i=1:length(bin2)-1
    bin2(i+1)=bin2(i)+bin2(i+1);
end
%% Pixel intensity calculation when less than and greater than t
a=1;

t=48;% guess thresholing value
while a<2
miu_back=bin2(t)/bin1(t);% less than t
miu_fore=(bin2(length(bin2))-bin2(t))/(bin1(length(bin1))-bin1(t));% greater than t 
t_n=(miu_back+miu_fore)/2;% new threshold value
del_t=abs(t-t_n)/t;% 
t=round(t_n);% new thresh hold value
if del_t<1
    a=2;
end

end

% thresh hold value, Ridle-Calvard Thresholding value does not gives better
% quality value, so some modifications for value of t
t_high=(t+255)/2;
t_low=0.5*t_high;
Image3_grey=Image2_grey;
%% high treshold image
for i=1:height
    for j=1:width
        if Image2_grey(i,j)>t_high
            Image2_grey(i,j)=255;% set all pixel to 255
        
        else
            Image2_grey(i,j)=0;% set all pixel to zero
        end
    end
end
%figure (6), imshow(Image2_grey)
%title('High threshold image')



% low threshold image
for i=1:height
    for j=1:width
        if Image3_grey(i,j)>t_low
            Image3_grey(i,j)=255;% set all pixel to 255
        
        else
            Image3_grey(i,j)=0;% set all pixel to zero
        end
    end
    %figure (7), imshow(Image3_grey)
    %title('Low threshold image')

end
% floodfill call for better image quality
output(height,width)=zeros; % initialzie output to zeros
new_color=254; % new color 
for i=1:height
    for j=1:width
        if Image2_grey(i,j)==255 % check for 255 if found store the coordinate to seed_point
            seed_point=[i j];
            output=floodfill_so_fun(seed_point,Image3_grey,new_color,height,width,output);
        end
    end
end
%figure(3), imshow(output)


end


