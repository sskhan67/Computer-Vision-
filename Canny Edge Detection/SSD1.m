%ssd 
function [O] = SSD1(Champfer,Champfer_temp)
[height,width,n1]=size(Champfer);
[h,w,n2]=size(Champfer_temp);
s=0;
l1=0;
l2=0;
O(height,width)=Inf;
for i=1:height
    for j=1:width
        
        for k=1:h

            for m=1:w
                if k+i<=height && m+j<=width
                    s=s+(Champfer(k+i,m+j)-Champfer_temp(k,m)).^2;

                end
            end
        end
        if k+i<=height && m+j<=width
           O(i,j)=s;
        else
            O(i,j)=Inf;
        end
           s=0;
          % l1=l1+1;

%             if l1>width-1
%                 l1=0;
%                 
            end
                %x=l1;

         
    end
%     l2=l2+1;
%     if l2>height
%         l2=0;
%     end
end

%end

