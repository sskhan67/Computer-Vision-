function [FA RA space]=verticalSegmentation(imagen)
imagen=clip(imagen);
m=size(imagen,2);

for s=1:m
    if sum(imagen(:,s))==0 %Check the line break between the alphabets
    fa=imagen(:,1:s-1);      %Matrix of first alphabet
    ra=imagen(:,s:end);    %Matrix of remaing alphabets
    FA=clip(fa);           %First Characters Image
    RA=clip(ra);           %Remaing Characters Image
    space=size(ra,2)-size(RA,2); %Finding space between first and last alphabet
    break;
    else 
        FA=imagen;
        RA=[];
        space=0;
    end

end