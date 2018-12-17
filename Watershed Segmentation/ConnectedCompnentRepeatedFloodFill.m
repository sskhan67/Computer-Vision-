% 
function [Label_image,num_components] = ConnectedCompnentRepeatedFloodFill(height,width,Marker,Label_image)
new_color=0;
num_components1=0;
num_components=[];
for i=1:height
    for j=1:width
        if (Label_image(i,j)==-1 && Marker(i,j)==255)
            seed_point=[i j];
            Label_image=floodfill_so_fun(seed_point,Marker,new_color,height,width,Label_image);

            %label=[label new_color];
            num_components1=num_components1+1;
            num_components=[num_components num_components1];% to get objects numbers 
            new_color=new_color+1;

            
        end
    end
end
            

end

