function [edges] = edge_linking(hysteresis)
% hysteresis image 
edges = hysteresis;
[height, width] = size(edges);% size calculation 

for i=1:height
    for j=1:width
        if(hysteresis(i,j) == 125) 
            [true] = anynearest8_hystersis(hysteresis, i, j);
            if(true == 1)
                edges(i,j) = 255;
            else
                edges(i,j) = 0;
            end
        end
    end
end


end

