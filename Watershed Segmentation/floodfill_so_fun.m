% Flood fill with seperate output
function output = floodfill_so_fun(seed_point,image1,new_color,height,width,output)
    % set old color 
old_color=image1(seed_point(1),seed_point(2));

if old_color==new_color % if equal no need to check 
    
    return
else
    
    % push function
    frontier1_x=[]; % initialization 
    frontier1_y=[]; % initialization 
    frontier1_x=[frontier1_x seed_point(1)];  % set value
    frontier1_y=[frontier1_y seed_point(2)];  % set value
    
    % set new pixel to image
    
   output(seed_point(1),seed_point(2))=new_color;

    while ~isempty (frontier1_x & frontier1_y) % check ->frontier empty
      
        %pop
        q_x=frontier1_x(length(frontier1_x)); % pop last value
        frontier1_x(length(frontier1_x))=[]; % delete last value
        
        q_y=frontier1_y(length(frontier1_y)); % pop last value
        frontier1_y(length(frontier1_y))=[]; % delete last value
        image1(q_x,q_y)=new_color;

        % visiting four neightbors and consider boundry  
        
        for i=1:4 % four neigh.
         if i==1 && q_y<width
             % visit right neighbor
             if image1(q_x,q_y+1)==old_color && output(q_x,q_y+1)~=new_color
               output(q_x,q_y+1)=new_color; %set new color to right neigh.
               frontier1_x=[frontier1_x q_x ]; %add right neigh. value to frontier
               frontier1_y=[frontier1_y q_y+1]; %add right neigh. value to frontier
             
             end  
         end
         
        if i==2 && q_x<height 
             % visit bottom neighbor
            if image1(q_x+1,q_y)==old_color && output(q_x+1,q_y)~=new_color
                output(q_x+1,q_y)=new_color;% set new_color to bottom neigh.
                frontier1_x=[frontier1_x q_x+1 ];%add bottom neigh. value to frontier
                frontier1_y=[frontier1_y q_y];%add bottom neigh. value to frontier
            end
        end 
         
         if i==3 && q_x>=2
             % visit top neighbor
             if image1(q_x-1,q_y)==old_color && output(q_x-1,q_y)~=new_color
                output(q_x-1,q_y)=new_color;% set new_color to top neigh.
                frontier1_x=[frontier1_x q_x-1 ];%add top neigh. value to frontier
                frontier1_y=[frontier1_y q_y];%add top neigh. value to frontier
             end
         end  
        if i==4 && q_y>=2
             % visit left neighbor
            if image1(q_x,q_y-1)==old_color && output(q_x,q_y-1)~=new_color
                output(q_x,q_y-1)=new_color;% set new_color to left neigh.
                frontier1_x=[frontier1_x q_x ];%add left neigh. value to frontier
                frontier1_y=[frontier1_y q_y-1];%add left neigh. value to frontier
            end
         end  

        end
   end
end      
end


