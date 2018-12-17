% Lucas Kanade Function 

function [topfeatures] = Lucas_Kanade(I, J, topfeatures, window);




sigma = 0.6;

[Gx, Gy] = getGradient(I, sigma);% image horizontal and vertical gradient calculation 


for i=1: size(topfeatures)
    
    featurepointX = topfeatures(i,1);% x coordinate 
    featurepointY = topfeatures(i,2);% y coordinate 
    u = [0 0];% Displacement vector initialized to zero 
    deltau = [0 0];%Incremental displacement vector initialized to zero
    [Z]=Compute2x2GradientMatrix(Gx,Gy,featurepointX,featurepointY, window); 
    iter = 0;
    while(1)%iterations to update deltau
        [err]=Compute2x1ErrorVector(I,J,Gx,Gy, featurepointX, featurepointY, window,u);
        [deltau]=Solve2x1LinearSystem(Z,err);
        
        %Update u
        u(1)=u(1)+deltau(1); % x-axis  
        u(2)=u(2)+deltau(2); % y-axis   
        
         % stop iteration over 10 
        if(iter+1 > 10)
            break;
        end
        if(deltau <=0.2)
            break;
        end
        iter = iter + 1;
    end
   
         %Update featurepoint in topfeatures
         topfeatures(i,1)=topfeatures(i,1) + u(2); % add the correct displacement to correct u
         topfeatures(i,2)=topfeatures(i,2) + u(1);
        
end




end

