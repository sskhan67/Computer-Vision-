% Histrogram eq. function

function Image2_grey = histrogram_equ(height,width,Image2_grey)

hist(256)=zeros; % initialize hist to zeros: 1d array
for i=1:width
    for j=1:height
        hist(Image2_grey(j,i)+1)=hist(Image2_grey(j,i)+1)+1; %Image2_grey(j,i)=0, hist(0)?? matlab index starts with 1, so Image2_grey(j,i)+1  
    end
    
end
for i=1:256 % weighted value
    hist(i)=hist(i)/(height*width);
end
cdf(256)=zeros; % intialize cdf 
for i=1:255
    cdf(i+1)=cdf(i)+hist(i+1);  % cdf value calculation
end
% histrogram equalization
for i=1:width
 for j=1:height
    Image2_grey(j,i)= 255*cdf(Image2_grey(j,i)+1); % S=(L-1)*CDF_in, L=256
end
end
end

