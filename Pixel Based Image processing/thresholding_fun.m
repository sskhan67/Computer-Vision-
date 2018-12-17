% Ridle-Calvard Thresholding

function Image2_grey = thresholding_fun(height,width,Image2_grey)
%% Histrogram
hist(256)=zeros; % 1-d array
for i=1:height  % access all pixel value and perform histrogram
    for j=1:width
        hist(Image2_grey(i,j)+1)=hist(Image2_grey(i,j)+1)+1;
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
t=30;% Initial guess thresholing value
while a<2
miu_back=bin2(t)/bin1(t);% less than t
miu_fore=(bin2(length(bin2))-bin2(t))/(bin1(length(bin1))-bin1(t));% greater than t 
t_n=(miu_back+miu_fore)/2;% new threshold value
del_t=abs(t-t_n)/t;% 
t=round(t_n);% new threshold value
if del_t<0.01
    a=2;
end

end


%% output value binary value
for i=1:height
    for j=1:width
        if Image2_grey(i,j)>t % greater than threshold value
            Image2_grey(i,j)=255; % set all pixel to 255
        
        else
            Image2_grey(i,j)=0;% set all pixel to zero
        end
    end
end
end

