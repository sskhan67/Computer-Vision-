function [label,num_components] = watershed_marker(Image,Marker)
% Marker- marker image, Image - quantized magnitude image 
% label- o/p wshed marker image, wshed_marker-- objects 

image=Image(2:127,2:127);% image crop to avoid oversegmenting 
[height,width,~]=size(image);% size 

x_coordinate=cell(1,256);% 256 array in cell
y_coordinate=cell(1,256);% 256 array in cell

%1-> a) level pixel list 
for i=1:height
    for j=1:width
            c=image(i,j);
            x_coordinate{c+1}=[ x_coordinate{c+1} i];
            y_coordinate{c+1}=[ y_coordinate{c+1} j];     
        
    end
end
% 1-> b set label to -1 
label=-1*ones(height,width); % initilize label variable with -1 
% 1-> c global label
 %globallabel=0;
  % create cashment basins using connected component 
 [label,num_components] = ConnectedCompnentRepeatedFloodFill(height,width,Marker,label);
%% step 2 : 
for i=1:256 % 256- grey scale levels 
 
    temp_label=label; % temporary level 
    % a)
    x=x_coordinate{i};% get gray level coorfdinate: gray level 0 -> i=1, i -> gray level
    y=y_coordinate{i};
    
    % frontier 
    x_forntier1=[];
    y_forntier1=[];
    
    
    % check negibour label 
    for j=1:length(x)
        gray_level=i-1;
        
        [label,flag]= anynearest8_wshed(temp_label,x(j),y(j),height,width,gray_level,label,image);
        if flag>0 % if negihbour found , add to frontier 
            x_forntier1=[x_forntier1 x(j)];
            y_forntier1=[y_forntier1 y(j)];
        end
        
    end
    %b)
      while ~isempty (x_forntier1 & y_forntier1) % check ->frontier empty
          
          q_x=x_forntier1(length(x_forntier1)); % pop last value
          x_forntier1(length(x_forntier1))=[]; % delete last value
        
          q_y=y_forntier1(length(y_forntier1)); % pop last value
          y_forntier1(length(y_forntier1))=[]; % delete last value
          
                % check neighbor list 
          [x_forntier1, y_forntier1,label] = neighbourlist_wshed_marker(image,q_x,q_y,height,width,label,gray_level,x_forntier1, y_forntier1);
             

      end
    
    
    
end
 

end

