function [Marker] = Marker(image,Magnitude,G_kernel,Gderiv_kernel)
        % Quantized Magnitude 
Quantized_Magnitude=uint8(Magnitude);
figure(4), imshow(double(Quantized_Magnitude))
title('Marker Watershed: Magnitude')
[height,width,~]=size(image);

        % Double threshold on original image 
output = double_threshold_function(height,width,image);% pixel sets to 254 
output=254-output;% to alter the output 

figure(5),imshow(uint8(output));
title('Marker Watershed: Threshold')

Edge(height,width)=zeros; % to set it 255 
for i=1:height
    for j=1:width
        if output(i,j)==254
            Edge(i,j)=255;
        end
    end
end

se=255;% structutring element 
    % to distach the objects from edge 
Edge1= dilation_function(Edge,height,width,se);
Edge2= dilation_function(Edge1,height,width,se);
            
 
    % Chamfer on double threshold 
[Chamfer_Distance] = ChamferFunction(Edge2);
figure(6),imshow(uint8(Chamfer_Distance))
title('Marker Watershed: Chamfer')

    % Watershed on chamfer 
label1 = watershed(Chamfer_Distance);

figure(7),imshow(uint8(255*label1/max(max(label1))))
title('Marker Watershed: Watershed of Chamfer')

        % Canny on watershed 
[CannyEdge,~,~] = cannyedge(G_kernel,Gderiv_kernel,label1,height,width);
            
figure(8),imshow(uint8(CannyEdge))
title('Marker Watershed: Edges separating objects')
        
    % combine double threshold & canny on watershed-> marker  
Marker=uint8(CannyEdge)+uint8(Edge);
Marker=Marker(2:127,2:127); % crop marker 

             
end

