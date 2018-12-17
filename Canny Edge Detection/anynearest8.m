function [ON] = anynearest8(Hystersis,i,j,height,width)
a=0;
   if i==1 && j==1 % check 1st point
        if Hystersis(i+1,j)==255||Hystersis(i+1,j+1)==255||Hystersis(i,j+1)==255
                a=255;
        end
   end
    

    if i==1 && j>=2 % check top row
        if j<width-1
            if Hystersis(i,j-1)==255||Hystersis(i+1,j-1)==255||Hystersis(i+1,j)==255||Hystersis(i+1,j+1)==255||Hystersis(i,j+1)==255
                a=255;
            end
        end
    end
    
   if i>=2 && j==1 % check left coloumn
       if i<height-1
        if Hystersis(i-1,j)==255||Hystersis(i+1,j)==255||Hystersis(i+1,j+1)==255||Hystersis(i,j+1)==255||Hystersis(i-1,j+1)==255
                a=255;
        end
       end
       
   end
   
   if i>1 && j>1
       if i<=height-1 && j<=width-1
           
                if Hystersis(i-1,j)==255||Hystersis(i-1,j-1)==255||Hystersis(i,j-1)==255||Hystersis(i+1,j-1)==255||Hystersis(i+1,j)==255||Hystersis(i+1,j+1)==255||Hystersis(i,j+1)==255||Hystersis(i-1,j+1)==255
                    a=255;
                end
       end
   end
   
   if i==height && j==1 % check bottom row point 
               
                    if Hystersis(i-1,j)==255||Hystersis(i,j+1)==255||Hystersis(i-1,j+1)==255
                       a=255;
                    end
               
    end
    if i==height && j>1 % check bottom row 
               if j<width-1
                    if Hystersis(i-1,j)==255||Hystersis(i-1,j-1)==255||Hystersis(i,j-1)==255||Hystersis(i,j+1)==255||Hystersis(i-1,j+1)==255
                       a=255;
                    end
               end
    end
    if i>=2 && j==width  % check right coloumn
               if i<height-1 
                   if Hystersis(i-1,j)==255||Hystersis(i-1,j-1)==255||Hystersis(i,j-1)==255||Hystersis(i+1,j-1)==255||Hystersis(i+1,j)==255
                       a=255;
                   end
               end
    end
    if i==height && j==width % check right point 
         if Hystersis(i-1,j)==255||Hystersis(i-1,j-1)==255||Hystersis(i,j-1)==255
                 a=255;
                    
         end
    end
                   

                   
   
   ON=a;

end

