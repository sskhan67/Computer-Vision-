function image1 = Floodfill(seed_point,image1,new_color,height,width)
    % set old color 
old_color=image1(seed_point(1),seed_point(2));

if old_color==new_color   % if equal no need to check 
    return
else
    
    % push function: 
    frontier1_x=[]; % initialization 
    frontier1_y=[];% initialization 
    
    frontier1_x=[frontier1_x seed_point(1)];  % set value
    frontier1_y=[frontier1_y seed_point(2)]; % set value 
    
    % set new pixel to image
    image1(seed_point(1),seed_point(2))=new_color;

    while ~isempty (frontier1_x & frontier1_y) % check ->frontier empty
      
        %pop operations
        
        q_x=frontier1_x(length(frontier1_x));  % pop last value
        frontier1_x(length(frontier1_x))=[];   % delete last value 
        
        q_y=frontier1_y(length(frontier1_y));  % pop last value
        frontier1_y(length(frontier1_y))=[];    % delete last value
        
        % visiting four neightbors and consider boundry
        
        for i=1:4
         if i==1 && q_y<width
             if image1(q_x,q_y+1)==old_color % visit right neighbor
               image1(q_x,q_y+1)=new_color; % set new color to right neigh.
               frontier1_x=[frontier1_x q_x ];%add right neigh. value to frontier
               frontier1_y=[frontier1_y q_y+1]; %add right neigh. value to frontier
             end  
         end
         
        if i==2 && q_x<height
            if image1(q_x+1,q_y)==old_color % visit bottom neighbor
                image1(q_x+1,q_y)=new_color;% set new_color to bottom neigh.
                frontier1_x=[frontier1_x q_x+1 ];%add bottom neigh. value to frontier
                frontier1_y=[frontier1_y q_y];
            end
         end  
         if i==3 && q_x>=2
             if image1(q_x-1,q_y)==old_color % visit top neighbor
                image1(q_x-1,q_y)=new_color;% set new_color to top neigh.
                frontier1_x=[frontier1_x q_x-1 ];%add top neigh. value to frontier
                frontier1_y=[frontier1_y q_y];
             end
         end  
        if i==4 && q_y>=2
            if image1(q_x,q_y-1)==old_color % visit left neighbor
                image1(q_x,q_y-1)=new_color; % set new_color to left neigh.
                frontier1_x=[frontier1_x q_x ]; %add left neigh. value to frontier
                frontier1_y=[frontier1_y q_y-1];
            end
         end  

        end
   end
end      
end

