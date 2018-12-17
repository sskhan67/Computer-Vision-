function [image] = ridgeline(num_components,wshed_marker,image)
% image - orignal inmae , num_components- obejets /level, 
% wshed_marker watershed marker output, 
% image - output filled with green color pixels 




    % to be used for hodling first pixel of each level
x=[];
y=[];
% image crop to avoid unncessary segmentation 
image=image(2:127,2:127);

[height,width,~]=size(wshed_marker); % size of image 
image=cat(3, image, image, image); % grey to RGB image 

    % loop for collecting pixel coordinate
for k=1:length(num_components)-1  %  length -1 -> connected component function 
        for i=1:height-2 % wshed image 126 by 126 pixels 
            for j=1:width-2
                
                            if wshed_marker(i,j)==num_components(k)
                               if length(x)<k  % we need only first pixels 
                                    x=[x i];
                                    y=[y j];
                                    break
                               end

                            end
            end
        end
end
        

                     
A1(height,width)=zeros;  % for storing wall pixels 

for i=1:length(x)
    x0=x(i);% get first pixel coordinate 
    y0=y(i);
            % wall following function , z -> gives wall coordinates,wshed_marker-> input image,num_components-> level  
   [A1,z1,z2]=wall_f(wshed_marker,A1,x0,y0,num_components(i),num_components);
    
    while ~isempty (z1 & z2)
            q_x=z1(length(z1)); % pop last value
            z1(length(z1))=[]; % delete last value
        
            q_y=z2(length(z2)); % pop last value
            z2(length(z2))=[]; % delete last valuex
          
            for h=1:height
                for j=1:width
                    if h==q_x && j==q_y
                        image(h-1,j-1,1)=0;% green color for ridges 
                        image(h-1,j-1,2)=255;
                        image(h-1,j-1,3)=0;
                    end
                end
            end     
    end
end






end

