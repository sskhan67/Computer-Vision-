% convolution of images 
function [H] = Convolution(image,kernel)
% image- orginal image, kernel- gaussian kernel
[h,w]=size(image);
[ker_h,ker_w]=size(kernel); % size 
H=zeros(h,w);
H1=zeros(h,w);

 for i=1:h
    for j=1:w
         sum=0;
                for k=1:ker_h
                    for m=1:ker_w
                
                        offset_i=-1*floor(ker_h/2)+k-1;
                        offset_j=-1*floor(ker_w/2)+m-1;
%                       
                             if i+offset_i>0 && i+offset_i<=h && j+offset_j>0 && j+offset_j<=w 
                                    sum=sum+image(i+offset_i,j+offset_j)*kernel(k,m);

                     
                            end
                    end
                end
             
                             
             H(i,j)=sum;

    end
 end
 for i=1:h
     for j=1:w
         H1(i,j)=H(i,j);
         
     end
 end
 
 
end
