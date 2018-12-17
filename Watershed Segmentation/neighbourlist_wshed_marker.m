function [x_forntier1, y_forntier1,label] = neighbourlist_wshed_marker(image,i,j,height,width,label,gray_level,x_forntier1, y_forntier1)



   if i==1 && j==1 % check 1st point
       
%        a=image(i+1,j);
%        b=image(i+1,j+1);
%        c=image(i,j+1);
       
       if image(i+1,j)<=gray_level     && label(i+1,j)==-1
           
           label(i+1,j)=label(i,j);
           x_forntier1=[x_forntier1 i+1];
           y_forntier1=[y_forntier1 j];
       end
       if image(i+1,j+1)<=gray_level     && label(i+1,j+1)==-1
           
           label(i+1,j)=label(i,j);
           x_forntier1=[x_forntier1 i+1];
           y_forntier1=[y_forntier1 j+1];
       end
       if image(i,j+1)<=gray_level     && label(i,j+1)==-1
           
           label(i,j+1)=label(i,j);
           x_forntier1=[x_forntier1 i];
           y_forntier1=[y_forntier1 j+1];
       end
       
       
       
   end

  

    if i==1 && j>=2 % check top row
        if j<=width-1
            
%             a=image(i,j-1);
%             b=image(i+1,j-1);
%             c=image(i+1,j);
%             d=image(i+1,j+1);
%             e=image(i,j+1);
        if image(i,j-1)<=gray_level     && label(i,j-1)==-1
           
           label(i,j-1)=label(i,j);
           x_forntier1=[x_forntier1 i];
           y_forntier1=[y_forntier1 j-1];
        end
        if image(i+1,j-1)<=gray_level     && label(i+1,j-1)==-1
           
           label(i+1,j-1)=label(i,j);
           x_forntier1=[x_forntier1 i+1];
           y_forntier1=[y_forntier1 j-1];
        end
        
          if image(i+1,j)<=gray_level     && label(i+1,j)==-1
           
           label(i+1,j)=label(i,j);
           x_forntier1=[x_forntier1 i+1];
           y_forntier1=[y_forntier1 j];
          end   
          
          if image(i+1,j+1)<=gray_level     && label(i+1,j+1)==-1
           
           label(i+1,j+1)=label(i,j);
           x_forntier1=[x_forntier1 i+1];
           y_forntier1=[y_forntier1 j+1];
          end
          if image(i,j+1)<=gray_level     && label(i,j+1)==-1
           
           label(i,j+1)=label(i,j);
           x_forntier1=[x_forntier1 i];
           y_forntier1=[y_forntier1 j+1];
          end
          
        
        end
    end
    
            
        
    
   if i>=2 && j==1 % check left coloumn
       if i<height-1
%            a=image(i-1,j);
%            b=image(i+1,j);
%            c=image(i+1,j+1);
%            d=image(i,j+1);
%            e=image(i-1,j+1);
           
           if image(i-1,j)<=gray_level     && label(i-1,j)==-1
           label(i-1,j)=label(i,j);
           x_forntier1=[x_forntier1 i-1];
           y_forntier1=[y_forntier1 j];
           end
           
           if image(i+1,j)<=gray_level     && label(i+1,j)==-1
           label(i+1,j)=label(i,j);
           x_forntier1=[x_forntier1 i+1];
           y_forntier1=[y_forntier1 j];
           end
           if image(i+1,j+1)<=gray_level     && label(i+1,j+1)==-1
           label(i+1,j+1)=label(i,j);
           x_forntier1=[x_forntier1 i+1];
           y_forntier1=[y_forntier1 j+1];
           end
           if image(i,j+1)<=gray_level     && label(i,j+1)==-1
           label(i,j+1)=label(i,j);
           x_forntier1=[x_forntier1 i];
           y_forntier1=[y_forntier1 j+1];
           end
           if image(i-1,j+1)<=gray_level     && label(i-1,j+1)==-1
           label(i-1,j+1)=label(i,j);
           x_forntier1=[x_forntier1 i-1];
           y_forntier1=[y_forntier1 j];
           end
           
           
           
           
                     
       end
   end
   
            
            
            
       
       

   
   if i>1 && j>1
       if i<=height-1 && j<=width-1
          
%             a=image(i-1,j);
%             b=image(i-1,j-1);
%             c=image(i,j-1);
%             d=image(i+1,j-1);
%             e=image(i+1,j);
%             f=image(i+1,j+1);
%             g=image(i,j+1);
%             h=image(i-1,j+1);

           if image(i-1,j)<=gray_level     && label(i-1,j)==-1
            label(i-1,j)=label(i,j);
            x_forntier1=[x_forntier1 i-1];
            y_forntier1=[y_forntier1 j];
           end
           if image(i-1,j-1)<=gray_level     && label(i-1,j-1)==-1
            label(i-1,j-1)=label(i,j);
            x_forntier1=[x_forntier1 i-1];
            y_forntier1=[y_forntier1 j-1];
           end

           if image(i,j-1)<=gray_level     && label(i,j-1)==-1
            label(i,j-1)=label(i,j);
            x_forntier1=[x_forntier1 i];
            y_forntier1=[y_forntier1 j-1];
           end
           if image(i+1,j-1)<=gray_level     && label(i+1,j-1)==-1
            label(i+1,j-1)=label(i,j);
            x_forntier1=[x_forntier1 i+1];
            y_forntier1=[y_forntier1 j-1];
           end
           if image(i+1,j)<=gray_level     && label(i+1,j)==-1
            label(i+1,j)=label(i,j);
            x_forntier1=[x_forntier1 i+1];
            y_forntier1=[y_forntier1 j];
           end
           if image(i+1,j+1)<=gray_level     && label(i+1,j+1)==-1
            label(i+1,j+1)=label(i,j);
            x_forntier1=[x_forntier1 i+1];
            y_forntier1=[y_forntier1 j+1];
           end
           
          if image(i,j+1)<=gray_level     && label(i,j+1)==-1
                label(i,j+1)=label(i,j);
                x_forntier1=[x_forntier1 i];
                y_forntier1=[y_forntier1 j+1];
           end
           
           
           if image(i-1,j+1)<=gray_level     && label(i-1,j+1)==-1
                label(i-1,j+1)=label(i,j);
                x_forntier1=[x_forntier1 i-1];
                y_forntier1=[y_forntier1 j+1];
           end
           
            
       end
   end
   
   if i==height && j==1 % check bottom row point 
%                a=image(i-1,j);
%                b=image(i,j+1);
%                c=image(i-1,j+1);
               
              
          if image(i-1,j)<=gray_level     && label(i-1,j)==-1
            label(i-1,j)=label(i,j);
            x_forntier1=[x_forntier1 i-1];
            y_forntier1=[y_forntier1 j];
          end
           
          if image(i,j+1)<=gray_level     && label(i,j+1)==-1
            label(i,j+1)=label(i,j);
            x_forntier1=[x_forntier1 i];
            y_forntier1=[y_forntier1 j+1];
          end
          
           if image(i-1,j+1)<=gray_level     && label(i-1,j+1)==-1
            label(i-1,j+1)=label(i,j);
            x_forntier1=[x_forntier1 i-1];
            y_forntier1=[y_forntier1 j+1];
           end


   end
   
               
    
    if i==height && j>1 % check bottom row 
               if j<=width-1
%                    a=image(i-1,j);
%                    b=image(i-1,j-1);
%                    c=image(i,j-1);
%                    d=image(i,j+1);
%                    e=image(i-1,j+1);
                   
                  if image(i-1,j)<=gray_level     && label(i-1,j)==-1
                    label(i-1,j)=label(i,j);
                    x_forntier1=[x_forntier1 i-1];
                    y_forntier1=[y_forntier1 j];
                  end
                  if image(i-1,j-1)<=gray_level     && label(i-1,j-1)==-1
                    label(i-1,j-1)=label(i,j);
                    x_forntier1=[x_forntier1 i-1];
                    y_forntier1=[y_forntier1 j-1];
                  end
                  if image(i,j-1)<=gray_level     && label(i,j-1)==-1
                    label(i,j-1)=label(i,j);
                    x_forntier1=[x_forntier1 i];
                    y_forntier1=[y_forntier1 j-1];
                  end
                  
                  if image(i,j+1)<=gray_level     && label(i,j+1)==-1
                    label(i,j+1)=label(i,j);
                    x_forntier1=[x_forntier1 i];
                    y_forntier1=[y_forntier1 j+1];
                  end
                  if image(i-1,j+1)<=gray_level     && label(i-1,j+1)==-1
                    label(i-1,j+1)=label(i,j);
                    x_forntier1=[x_forntier1 i-1];
                    y_forntier1=[y_forntier1 j+1];
                  end
                  
                  
                  
                    
               end
            
    end
    if i>=2 && j==width  % check right coloumn
               %if i<height-1 
               if i<height
%                    a=image(i-1,j);
%                    b=image(i-1,j-1);
%                    c=image(i,j-1);
%                    d=image(i+1,j-1);
%                    e=image(i+1,j);
                   
                   if image(i-1,j)<=gray_level     && label(i-1,j)==-1
                    label(i-1,j)=label(i,j);
                    x_forntier1=[x_forntier1 i-1];
                    y_forntier1=[y_forntier1 j];
                  end
                  if image(i-1,j-1)<=gray_level     && label(i-1,j-1)==-1
                    label(i-1,j-1)=label(i,j);
                    x_forntier1=[x_forntier1 i-1];
                    y_forntier1=[y_forntier1 j-1];
                  end
                  if image(i,j-1)<=gray_level     && label(i,j-1)==-1
                    label(i,j-1)=label(i,j);
                    x_forntier1=[x_forntier1 i];
                    y_forntier1=[y_forntier1 j-1];
                  end
                  
                  if image(i+1,j-1)<=gray_level     && label(i+1,j-1)==-1
                    label(i+1,j-1)=label(i,j);
                    x_forntier1=[x_forntier1 i+1];
                    y_forntier1=[y_forntier1 j-1];
                  end
                  if image(i+1,j)<=gray_level     && label(i+1,j)==-1
                    label(i+1,j)=label(i,j);
                    x_forntier1=[x_forntier1 i+1];
                    y_forntier1=[y_forntier1 j];
                  end
                  

                     
               end
    end
    
    if i==height && j==width % check right bottom point
%         a=image(i-1,j);
%         b=image(i-1,j-1);
%         c=image(i,j-1);
        
                  if image(i-1,j)<=gray_level     && label(i-1,j)==-1
                    label(i-1,j)=label(i,j);
                    x_forntier1=[x_forntier1 i-1];
                    y_forntier1=[y_forntier1 j];
                  end
                  if image(i-1,j-1)<=gray_level     && label(i-1,j-1)==-1
                    label(i-1,j-1)=label(i,j);
                    x_forntier1=[x_forntier1 i-1];
                    y_forntier1=[y_forntier1 j-1];
                  end
                  if image(i,j-1)<=gray_level     && label(i,j-1)==-1
                    label(i,j-1)=label(i,j);
                    x_forntier1=[x_forntier1 i];
                    y_forntier1=[y_forntier1 j-1];
                  end
        
       
        
        
                    
    end
    
    % top right point
    if i==1 && j==width % check right point
%         a=image(i,j-1);
%         b=image(i+1,j-1);
%         c=image(i+1,j);
        
                  if image(i,j-1)<=gray_level     && label(i,j-1)==-1
                    label(i,j-1)=label(i,j);
                    x_forntier1=[x_forntier1 i];
                    y_forntier1=[y_forntier1 j-1];
                  end
                  if image(i+1,j-1)<=gray_level     && label(i+1,j-1)==-1
                    label(i+1,j-1)=label(i,j);
                    x_forntier1=[x_forntier1 i+1];
                    y_forntier1=[y_forntier1 j-1];
                  end
                  if image(i+1,j)<=gray_level     && label(i+1,j)==-1
                    label(i+1,j)=label(i,j);
                    x_forntier1=[x_forntier1 i+1];
                    y_forntier1=[y_forntier1 j];
                  end
        
   
                    
    end
      
    
end
                   

                   
   
  



