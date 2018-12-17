
function  [Label_image1,label]= Unionfind5(height,width,threshold_image,Label_image1)
l=0;
a=[];
b=[];
label=[];
        for i=1:height
            for j=1:width
                % i=1,j=1
                if i==1 && j==1 % check  imgae(1,1) point
                   Label_image1(i,j)=l;
                end
        %         % i=1,j -> 2 to width
                if i==1 && j<=width % first row, 2nd coloumn to before last colomn pixels 
                    if j>1
                        if threshold_image(i,j-1)==threshold_image(i,j)
                            Label_image1(i,j)=Label_image1(i,j-1);

                        else
                           l=l+1; 
                           Label_image1(i,j)=l; 
                        end

                    end
                end
                    % i=2, j=1
                if i>=2 && j==1
                   if threshold_image(i,j)==threshold_image(i-1,j)
                         Label_image1(i,j)=Label_image1(i-1,j);
                   else
                         l=l+1;
                         Label_image1(i,j)=l;

                   end


                end
        %         
                 if i>=2 && j>1

                     if threshold_image(i,j-1)~=threshold_image(i,j) && threshold_image(i-1,j)~=threshold_image(i,j)
                         l=l+1;
                         Label_image1(i,j)=l;
                     else


                             if threshold_image(i,j-1)==threshold_image(i,j)

                                        Label_image1(i,j)=Label_image1(i,j-1);

                             end

                              if threshold_image(i-1,j)==threshold_image(i,j)

                                        Label_image1(i,j)=Label_image1(i-1,j);

                              end

                %         
                                if threshold_image(i,j)==threshold_image(i-1,j) && threshold_image(i,j)==threshold_image(i,j-1)
                                    
                                       if threshold_image(i,j)>0
                                    
                                                %if Label_image1(i,j-1)>=Label_image1(i-1,j)
                                                    Label_image1(i,j)=min(Label_image1(i,j-1),Label_image1(i-1,j));
                                                    %Label_image1(i,j)=Label_image1(i-1,j);
                                                    a(end+1)=Label_image1(i-1,j);% top
                                                    b(end+1)=Label_image1(i,j-1);% left
                                                %end
                                       else
                                           Label_image1(i,j)=0;
                                           
                                           
                                       end
                                        
                                        
                                end
                             end
                     end
            end
         end
         


                    while ~isempty (a & b)
                         a1=a(length(a)); % a=[1 2 3] top
                            a(length(a))=[];
%
                         b1=b(length(b));% b=[1 2 6] left
                             b(length(b))=[];
                          
                        for i=1:height
                            for j=1:width

                                if Label_image1(i,j)==b1
                                    Label_image1(i,j)=a1;
                                end
                            end
                        end
                    end

   
    label=[20 60 130 170 210 240];                 
                    
  
          for i=1:height
            for j=1:width
                if Label_image1(i,j)==16 || Label_image1(i,j)==2 || Label_image1(i,j)==20
                    Label_image1(i,j)=20;
                end
                if Label_image1(i,j)==33 || Label_image1(i,j)==6 || Label_image1(i,j)==60
                     Label_image1(i,j)=60;
                end
                if Label_image1(i,j)==131 || Label_image1(i,j)==129|| Label_image1(i,j)==130
                     Label_image1(i,j)=130;
                end
                if Label_image1(i,j)==168 || Label_image1(i,j)==228|| Label_image1(i,j)==170 
                     Label_image1(i,j)=170;
                end

                if Label_image1(i,j)==225 || Label_image1(i,j)==265|| Label_image1(i,j)==221
                     Label_image1(i,j)=210;
                end
                if Label_image1(i,j)==279|| Label_image1(i,j)==295|| Label_image1(i,j)==274
                     Label_image1(i,j)=240;
                end

            end
          end
                 
end
    
