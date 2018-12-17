function [Gx, Gy] = getGradient(input_image, sigma)


[Gaus, ~] = Gaussian(sigma);
[Gder, ~] = Gaussian_Deriv(sigma);
Gder = flipud(Gder);
Gder = flip(Gder);

%Horizontal intensity
temp_horizontal = convolve(input_image, Gaus');% temp horizontal cal.
Gx = convolve(temp_horizontal, Gder);% Horizontal gradient cal.

%Vertical intensity 

temp_vertical = convolve(input_image, Gaus);
Gy = convolve(temp_vertical, Gder');% Vertical gradient cal.





end

