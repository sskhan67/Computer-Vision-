function threshold_output=thresh_image(height,width,input_double)
  %call function: double threshold 
        threshold_image=double_threshold_function(height,width,input_double);
        %dilation
        
        s=[0 254 0;254 254 254;0 254 0];
        se=254;
                % output from double threshold
        A=threshold_image;

                %funcition call-> dilation
        output1=dilation_function(A,height,width,se);
        A1=output1;
        output2(height,width)=zeros();

                %function call-> erosion (don't confused with name)
        output2=erosion_function(A1,height,width,se,output2);
        A2=output2;
        output3(height,width)=zeros();
         % again dilation
        output3=erosion_function(A2,height,width,se,output3);
        A3=output3;
        output4(height,width)=zeros();
         % again erosion
        threshold_output1=erosion_function(A3,height,width,se,output4);
        A4=threshold_output1;
        
        output5(height,width)=zeros();
        threshold_output=erosion_function(A4,height,width,se,output5);
        
%         A5=threshold_output2;
%         output6(height,width)=zeros();
%         threshold_output=dilation_function11(A5,height,width,se,output6);
        


end

