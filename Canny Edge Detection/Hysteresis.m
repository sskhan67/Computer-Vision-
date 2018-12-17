function [Hystersis,Edges] = Hysteresis(supress,height,width,per)


supress_array=[];% create 1D array to store all values and later sorted the value
 for i=1:height
     for j=1:width
         supress_array=[supress_array supress(i,j)];
     end
 end
 supress_sort=sort(supress_array);
 
     % t_hi: higher boundary 
t_hi_index=round((per/100)*length(supress_sort)); % index 
t_hi=supress_sort(t_hi_index); % value 

%t_low   lower  boundary 
t_low=0.2*t_hi;

Hystersis=supress;
 for i=1:height
     for j=1:width
         if Hystersis(i,j)>t_hi
              Hystersis(i,j)=255;
         elseif Hystersis(i,j)>t_low
              Hystersis(i,j)=125;
         else
               Hystersis(i,j)=0;
         end

     end
 end
 
% figure (8),imshow((Hystersis))
% title('Hystersis image')


Edges=Hystersis;
for i=1:height
     for j=1:width
         
         if Hystersis(i,j)==125
             ON=anynearest8(Hystersis,i,j,height,width);
             if ON==255
                 Edges(i,j)=255;
             else 
                 Edges(i,j)=0;

             end
         end
     end
end
% figure (7),imshow((Edges))
% title('Edges image')

end

