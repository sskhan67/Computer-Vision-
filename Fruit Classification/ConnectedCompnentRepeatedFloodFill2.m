% 
function [Label_image,num_components, label] = ConnectedCompnentRepeatedFloodFill2(height,width,threshold_image)

Label_image(height,width)=zeros();
new_color=10;
num_components=0;
label=[];
for i=1:height
    for j=1:width
        if (Label_image(i,j)==0 && threshold_image(i,j)==254)
            seed_point=[i j];
            Label_image=floodfill_so_fun(seed_point,threshold_image,new_color,height,width,Label_image);
            label=[label new_color];
            num_components=num_components+1;
            new_color=new_color+30;

            
        end
    end
end
            

end

