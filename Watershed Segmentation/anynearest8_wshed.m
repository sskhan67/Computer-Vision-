function [label,flag] = anynearest8_wshed(temp_label,i,j,height,width,gray_level,label,image)
flag=0;

   if i==1 && j==1 % check 1st point
       
       a=temp_label(i+1,j);
       b=temp_label(i+1,j+1);
       c=temp_label(i,j+1);
       if image(i,j)==gray_level && (a>=0||b>=0||c>=0)
       
               x=[a b c ];
               for i1=1:length(x)
                    if x(i1)==-1
                        x(i1)=inf;
                    end
                end
                 x1=min(x);
                            if x1~=inf

                                    label(i,j)=min(x1);
                                    flag=1;
                            end

       end 
   end

  

    if i==1 && j>=2 % check top row
        if j<=width-1
            
            a=temp_label(i,j-1);
            b=temp_label(i+1,j-1);
            c=temp_label(i+1,j);
            d=temp_label(i+1,j+1);
            e=temp_label(i,j+1);
            
            if image(i,j)==gray_level && (a>=0||b>=0||c>=0||d>=0||e>=0)

            %if a||b||c||d||e
            
                    x=[a b c d e ];
                    for i1=1:length(x)
                        if x(i1)==-1
                            x(i1)=inf;
                        end
                    end
                    x1=min(x);
                             if x1~=inf

                                    label(i,j)=x1;
                                    flag=1;
                             end
            end
        end
        
    end
    
            
        
    
   if i>=2 && j==1 % check left coloumn
       if i<height-1
           a=temp_label(i-1,j);
           b=temp_label(i+1,j);
           c=temp_label(i+1,j+1);
           d=temp_label(i,j+1);
           e=temp_label(i-1,j+1);
           
           %if a||b||c||d||e
           if image(i,j)==gray_level && (a>=0||b>=0||c>=0||d>=0||e>=0)

           
                       x=[a b c d e];

                       for i1=1:length(x)
                            if x(i1)==-1
                                x(i1)=inf;
                            end
                       end
                        x1=min(x);
                        if x1~=inf

                                label(i,j)=min(x1);
                                flag=1;
                        end
           end
                     
                     
       end
   end
   
            
            
            
       
       

   
   if i>1 && j>1
       if i<=height-1 && j<=width-1
          
            a=temp_label(i-1,j);
            b=temp_label(i-1,j-1);
            c=temp_label(i,j-1);
            d=temp_label(i+1,j-1);
            e=temp_label(i+1,j);
            f=temp_label(i+1,j+1);
            g=temp_label(i,j+1);
            h=temp_label(i-1,j+1);
            
            %if a||b||c||d||e||f||g||h
            if image(i,j)==gray_level && (a>=0||b>=0||c>=0||d>=0||e>=0||f>=0||g>=0||h>=0)

           

                        x=[a b c d e f g h];

                        for l1=1:length(x)
                            if x(l1)==-1
                                x(l1)=inf;
                            end
                        end
                        x1=min(x);
                        if x1~=inf

                                 label(i,j)=x1;
                                 flag=1;

                        end
            end
       end
   end
   
   if i==height && j==1 % check bottom row point 
               a=temp_label(i-1,j);
               b=temp_label(i,j+1);
               c=temp_label(i-1,j+1);
               
               if a||b||c
           
                            x=[a b c]; 
                            for i1=1:length(x)
                                if x(i1)==-1
                                    x(i1)=inf;
                                end
                            end
                            x1=min(x);
                            if x1~=inf

                                        label(i,j)=min(x1);
                                        flag=1;
                            end
               end
   end
   
               
    
    if i==height && j>1 % check bottom row 
               if j<=width-1
                   a=temp_label(i-1,j);
                   b=temp_label(i-1,j-1);
                   c=temp_label(i,j-1);
                   d=temp_label(i,j+1);
                   e=temp_label(i-1,j+1);
                   
                   %if a||b||c||d||e
                   if image(i,j)==gray_level && (a>=0||b>=0||c>=0||d>=0||e>=0)

           
              
                             x=[a b c d e]; 
                             for i1=1:length(x)
                                if x(i1)==-1
                                    x(i1)=inf;
                                end
                             end

                             x1=min(x);
                             if x1~=inf

                                    label(i,j)=min(x1);
                                    flag=1;
                             end
                   end
                    
                end
            
    end
    if i>=2 && j==width  % check right coloumn
               %if i<height-1 
               if i<height
                   a=temp_label(i-1,j);
                   b=temp_label(i-1,j-1);
                   c=temp_label(i,j-1);
                   d=temp_label(i+1,j-1);
                   e=temp_label(i+1,j);
                   
                   %if a||b||c||d||e
                   if image(i,j)==gray_level && (a>=0||b>=0||c>=0||d>=0||e>=0)
           
                   
                             x=[a b c d e] ;
                             for i1=1:length(x)
                                if x(i1)==-1
                                    x(i1)=inf;
                                end
                             end

                             x1=min(x);
                             if x1~=inf

                                    label(i,j)=x1;
                                    flag=1;
                             end
                   end

                     
               end
    end
    
    if i==height && j==width % check bottom right point
        a=temp_label(i-1,j);
        b=temp_label(i-1,j-1);
        c=temp_label(i,j-1);
        
        %if a||b||c
        if image(i,j)==gray_level && (a>=0||b>=0||c>=0)

                    x=[a b c]; 
                    for i1=1:length(x)
                            if x(i1)==-1
                                x(i1)=inf;

                            end
                     end
                     x1=min(x);
                     if x1~=inf

                           label(i,j)=min(x1);
                           flag=1;
                     end
        end
        
                    
    end
    
    % check top right point
    if i==1 && j==width % check right point
        a=temp_label(i,j-1);
         b=temp_label(i+1,j-1);
         c=temp_label(i+1,j);
        if image(i,j)==gray_level && (a>=0||b>=0||c>=0)
        %if a||b||c
           
        
                    x=[a b c]; 
                    for i1=1:length(x)
                            if x(i1)==-1
                                x(i1)=inf;

                            end
                     end
                     x1=min(x);
                     if x1~=inf

                           label(i,j)=min(x1);
                           flag=1;
                     end
        end
        
                    
    end
    
    
end
                   

                   
   
  



