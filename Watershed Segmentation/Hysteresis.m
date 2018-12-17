function [hysteresis] = Hysteresis(suppressed_image)

hysteresis = suppressed_image;
[height, width] = size(hysteresis);
list = [];

for i = 1: height
    for j =1:width
       list = [list suppressed_image(i,j)];
    end
end

list = sort(list);
long = length(list);
loc = floor(.92*long);
t_hi = list(loc);
t_lo = floor(.3*t_hi);

for i =1:height
    for j=1:width
        if hysteresis(i,j) > t_hi 
            hysteresis(i,j) = 255;
        elseif hysteresis(i,j) >t_lo
            hysteresis(i,j) = 125;
        else
            hysteresis(i,j) = 0;
        end
    end
end






end

