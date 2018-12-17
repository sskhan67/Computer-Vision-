function [Edges,supress,Magnitude1] = cannyedge(G_kernel,Gderiv_kernel,image,height,width)

%% Canny Edge Detection 
        % calculate : Horizental and vertical intensity change, Magitude and angle 
[Magnitude,Gradient,Horizontal,Vertical,temp_Horizontaltemp_Vertical] = MagnitudeGradient(G_kernel,Gderiv_kernel,image,height,width);


% rad to deg concersion & make angle positive 
Magnitude1=Magnitude;
for i=1:height
    for j=1:width
        if Gradient(i,j)<0
            Gradient(i,j)=Gradient(i,j)+pi;
            Gradient(i,j)=(180/pi)*Gradient(i,j);
        else 
             Gradient(i,j)=(180/pi)*Gradient(i,j);

        end
    end
end


 
        % Non Maximal Suppression
[supress] = NonMaxSuppression(Magnitude,Gradient,height,width);
% supress 
[hysteresis] = Hysteresis(supress);
% edges 
[Edges] = edge_linking(hysteresis);



end

