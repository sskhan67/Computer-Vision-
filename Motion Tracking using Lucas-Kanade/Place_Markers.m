% Marker display function 

function [rgb_image] = Place_Markers(rgb_image, pixels)

[height, ~,~] = size(pixels); % pixel array size calculation  

for i = 1: height % loop to access all selection points 

    hold on
    x = pixels(i,1);
    y = pixels(i,2);
    plot(y,x, 'r*') % matlab coorindate is different from regular one
end

end

