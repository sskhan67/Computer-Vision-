function [supress] = NonMaxSuppression(Magnitude,Gradient,height,width)

supress=Magnitude;% declare new variable

for i=1:height
    for j=1:width
        theta= Gradient(i,j);
        
        if i==1 && j>=1 % check top row 
        
                        if theta<=22.5 || theta>157.5
                            if Magnitude(i,j)<Magnitude(i+1,j)
                                supress(i,j)=0;
                            end

                        
                        elseif theta>22.5 && theta<=67.5
                            if Magnitude(i,j)<Magnitude(i+1,j+1)
                                supress(i,j)=0;
                            end
                         elseif theta>67.5 && theta<=112.5
                            if Magnitude(i,j)<Magnitude(i,j-1) && Magnitude(i,j)<Magnitude(i,j+1)
                                supress(i,j)=0;
                            end

                        elseif theta>112.5 && theta<=157.5
                            if Magnitude(i,j)<Magnitude(i+1,j-1)
                                supress(i,j)=0;
                            end 

                        end
        end
         if i>=2 && j==1 % check left coloumn
        
                        if theta<=22.5 || theta>157.5
                            if Magnitude(i,j)<Magnitude(i-1,j) && Magnitude(i,j)<Magnitude(i+1,j)
                                supress(i,j)=0;
                            end

                        elseif theta>22.5 && theta<=67.5
                            if Magnitude(i,j)<Magnitude(i+1,j+1)
                                supress(i,j)=0;
                            end
                         elseif theta>67.5 && theta<=112.5
                            if Magnitude(i,j)<Magnitude(i,j+1)
                                supress(i,j)=0;
                            end

                        elseif theta>112.5 && theta<=157.5
                            if Magnitude(i,j)<Magnitude(i-1,j+1) 
                                supress(i,j)=0;
                            end 

                        end
         end
           
        if i>1 && j>1 % check all pixels except first and last wors and columns 
            if i<height-1 && j<width-1
                        if theta<=22.5 || theta>157.5
                            if Magnitude(i,j)<Magnitude(i-1,j) && Magnitude(i,j)<Magnitude(i+1,j)
                                supress(i,j)=0;
                            end

                        
                        elseif theta>22.5 && theta<=67.5
                            if Magnitude(i,j)<Magnitude(i-1,j-1) && Magnitude(i,j)<Magnitude(i+1,j+1)
                                supress(i,j)=0;
                            end
                         elseif theta>67.5 && theta<=112.5
                            if Magnitude(i,j)<Magnitude(i,j-1) && Magnitude(i,j)<Magnitude(i,j+1)
                                supress(i,j)=0;
                            end

                        elseif theta>112.5 && theta<=157.5
                            if Magnitude(i,j)<Magnitude(i-1,j+1) && Magnitude(i,j)<Magnitude(i+1,j-1)
                                supress(i,j)=0;
                            end 

                        end
            end
        end
        
           
           
           
           if i==height && j>1 % check bottom row 
               if j<width-1
        
                        if theta<=22.5 || theta>157.5
                            if Magnitude(i,j)<Magnitude(i-1,j) 
                                supress(i,j)=0;
                            end

                        %end
                        elseif theta>22.5 && theta<=67.5
                            if Magnitude(i,j)<Magnitude(i-1,j-1) 
                                supress(i,j)=0;
                            end
                         elseif theta>67.5 && theta<=112.5
                            if Magnitude(i,j)<Magnitude(i,j-1) && Magnitude(i,j)<Magnitude(i,j+1)
                                supress(i,j)=0;
                            end

                        elseif theta>112.5 && theta<=157.5
                            if Magnitude(i,j)<Magnitude(i-1,j+1) 
                                supress(i,j)=0;
                            end 

                        end
               end
           end
          
          
           
           if i>=2 && j==width % check right coloumn
               if i<height-1
        
                        if theta<=22.5 || theta>157.5
                            if Magnitude(i,j)<Magnitude(i-1,j) && Magnitude(i,j)<Magnitude(i+1,j)
                                supress(i,j)=0;
                            end

                        %end
                        elseif theta>22.5 && theta<=67.5
                            if Magnitude(i,j)<Magnitude(i-1,j-1) 
                                supress(i,j)=0;
                            end
                        elseif theta>67.5 && theta<=112.5
                            if Magnitude(i,j)<Magnitude(i,j-1) 
                                supress(i,j)=0;
                            end

                        elseif theta>112.5 && theta<=157.5
                                    if Magnitude(i,j)<Magnitude(i+1,j-1)
                                        supress(i,j)=0;
                                    end 

                        end
               end
          end
           
           
           
        end
end

% figure (6),imshow(uint8(supress))
% title('supress image')

end

