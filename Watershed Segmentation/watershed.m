function label = watershed(image)
% image - Quantized_Magnitude image , label- o/p wshed 



[height,width,~]=size(image);
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
label=-1*ones(height,width);  % initilize label variable -1 : unlabled 
% 1-> c global label
 globallabel=0;  % use to create catchment basins 

% step 2 : 

for i=1:256 % 256= grey level 
 
    temp_label=label; % tempporary variable for label 
    % a)
    x=x_coordinate{i};% get gray level coorfdinate: gray level 0 -> i=1, i -> gray level
    y=y_coordinate{i};
    
    % frontier 
    x_forntier1=[];
    y_forntier1=[];
    
    
    % check negibour label 
    for j=1:length(x)
        gray_level=i-1;
        
        %[label,flag]= anynearest8_2(temp_label,x(j),y(j),height,width,gray_level,label);
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
          

             [x_forntier1, y_forntier1,label] = neighbourlist_wshed(image,q_x,q_y,height,width,label,gray_level,x_forntier1, y_forntier1);
             %visit this list, change label, and push them

      end
      %end
    
    
    %c)
            % create new catchment basins 
                for k=1:length(x)
                    seed_point=[x(k) y(k)];
                    new_color=globallabel;
                        if image(x(k),y(k))==gray_level && label(x(k),y(k))==-1 
                             label = floodfill_so_fun(seed_point,image,new_color,height,width,label);
                             globallabel=globallabel+1;
                        end


                end
end
 

end

