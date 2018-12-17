% Z value calculation 

function [Z]=Compute2x2GradietnMatrix(Gx,Gy,i,j,window)

[heightx, widthx] = size(Gx);
%[heighty, widthy] = size(Gy);

 % Initialize 
ixx=0; 
iyy=0;
ixiy=0;
w = window/2;
w=floor(w);

 % Summation of  Gradient value over window
for offseti=-w: w 
    for offsetj=-w: w 
        if(i+offseti < heightx && i+offseti > 0 &&  j+offsetj < widthx && j+offsetj > 0)% are within bounds
            Gx_inter=Interpolate(Gx,i+offseti,j+offsetj);
            Gy_inter=Interpolate(Gy,i+offseti,j+offsetj);
            ixx=ixx+Gx_inter^2;
            iyy=iyy+Gy_inter^2;
            ixiy=ixiy+Gx_inter*Gy_inter;
        end
    end
end

Z=[ixx ixiy;ixiy iyy];
            
            

end

