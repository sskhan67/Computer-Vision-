function [FL RL]=horizonatalSegmentation(imagen)
imagen=clip(imagen);
m=size(imagen,1);
for s=1:m
    if sum(imagen(s,:))==0 %Check the Line Break in the Image 
        fl=imagen(1:s-1,:);   %First line Matrix
        rl=imagen(s:end,:);   %Remaining Line Matrix
        FL=clip(fl);          %Clip out the First Line from the Image
        RL=clip(rl);          %Clip out the Remaining Line from the Image

        break;
       
    else
        FL=imagen;
        RL=[];
    end
end