function [stem_c_x,stem_c_y,target_level,Area2] = banana_stem(threshold_output,height,width)
   u=[];
   v=[];
   u1=[];
   v1=[];
   se=254;
   % {1. to do erosion so that banana stem may sperate from banana 2.
   % perform connected component using floodfill-> level 3. calculate area of each level-> banana stem area should be less than other fruits 4. get the associates level with calulated area 5. get corordinate for that level image 6. apply different color for that coordinates}
   
       
                    % step 1: erosion so that banana stem may sperate from banana
                output5(height,width)=zeros();
                A4=threshold_output;
                threshold_output20=erosion_function(A4,height,width,se,output5);
                
                output6(height,width)=zeros();
                A5=threshold_output20;
                threshold_output21=dilation_function(A5,height,width,se);
                
                output6(height,width)=zeros();
                A6=threshold_output21;
                threshold_output22=erosion_function(A6,height,width,se,output5);
                
                output7(height,width)=zeros();
                A5=threshold_output22;
                threshold_output23=dilation_function(A5,height,width,se);
                
                output8(height,width)=zeros();
                A7=threshold_output23;
                threshold_output24=erosion_function(A7,height,width,se,8);
                
                [output_connect10,num_components1,label1]=ConnectedCompnentRepeatedFloodFill2(height,width,threshold_output24);
                output_connect3=output_connect10;
                
                %figure(13),imshow(uint8(output_connect3))
                
                % step 2: perform connected component using floodfill-> level
               Area2=[];

               for l=1:length(label1) 
                   area1=0;
                   for i=1:height
                        for j=1:width
                            if output_connect3(i,j)==label1(l)
                                area1=area1+1;

                            end
                        end
                   end
                   Area2(end+1)=area1;
               end
    
            % step 3: calculate area of each level-> banana stem area should be less than other fruits

            target_level=[];
           for i=1:length(label1)
                if Area2(i)<200  
                    if Area2(i)>10
                        target_level(end+1)=label1(i);

                    end
                end
           end
 
        % storing target stem coordinates 
             stem_c_x=[];
             stem_c_y=[];
            for l=1: length(target_level) 
              for i=1:height
                  for j=1:width
                      if output_connect3(i,j)==target_level(l)
                          stem_c_x(end+1)=i;
                          stem_c_y(end+1)=j;

                      end

                  end
              end
            end
        

end

