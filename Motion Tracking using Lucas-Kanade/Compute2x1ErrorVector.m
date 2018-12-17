% errorvecotr function 
function [err]=Compute2x1ErrorVector(I,J,Gx,Gy,i,j,window,u)

[height, width] = size(I);
%[heightJ, widthJ] = size(J);

ixx=0; 
iyy=0;
ixy=0;
w=floor(window/2);
err=[0 0];
for offseti=-w:w 
    for offsetj=-w:w 
        if(i+offseti < height && i+offseti > 0 && j+offsetj < width && j+offsetj > 0) % check the bounds
            Gx_inter=Interpolate(Gx,i+offseti,j+offsetj);
            Gy_inter=Interpolate(Gy,i+offseti,j+offsetj);
            I_inter=Interpolate(I, i+offseti,j+offsetj);
            J_inter=Interpolate(J,i+u(2)+offseti,j+u(1)+offsetj);
            err(1)=err(1)+Gx_inter*(I_inter - J_inter);
            err(2)=err(2)+Gy_inter*(I_inter - J_inter);
        end
    end
end


end

