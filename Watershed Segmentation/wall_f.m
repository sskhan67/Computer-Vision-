% wall following algorithm: final function 

function [A1,z1,z2]=wall_f(wshed_marker,A1,x0,y0,label,num_components)
flag=1; % to break while loop 
d=0;% direction 
x1=x0+1;% plus 1 bcoz zero padded to avoid bounday cooditions 
y1=y0+1;
% when there is a single level , it will get any neighbour coordinate ->
% loop will infine, to brak loop initilize with 0 
x2=0;
y2=0;
% stores wall coordinates 
z1=[];
z2=[];

% d=0 ,1 ,2,3 -> top, right, bottom, left directions  
% num_components-> objects number or levels from connected component using
% flood fill 

A=padarray(wshed_marker,[1 1],0); % zero padding for avoiding boundary problem

 
                    while flag==1
                        
                       if d==0 
                            if A(x1,y1-1)==label % left check 
                                d=left(d);
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2,num_components);
                                 x1=x2;
                                 y1=y2;

                            elseif A(x1-1,y1)~=label % check top 
                                d=right(d);

                            else  % if no left/top pixel -> moves to 1 pixel using d value 
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2,num_components);
                                 x1=x2;
                                 y1=y2;

                            end 
                       end
                       if d==1 
                            if A(x1-1,y1)==label
                                d=left(d);
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2,num_components);
                                 x1=x2;
                                 y1=y2;

                            elseif A(x1,y1+1)~=label
                                d=right(d);


                            else 
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2,num_components);
                                 x1=x2;
                                 y1=y2;

                            end 
                       end 
                       if d==2 
                            if A(x1,y1+1)==label
                                d=left(d);
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2,num_components);
                                 x1=x2;
                                 y1=y2;

                            elseif A(x1+1,y1)~=label
                                d=right(d);


                            else 
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2,num_components);
                                 x1=x2;
                                 y1=y2;
                            end 
                       end
                       if d==3 
                            if A(x1+1,y1)==label
                                d=left(d);
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2,num_components);
                                 x1=x2;
                                 y1=y2;

                            elseif A(x1,y1-1)~=label 
                                d=right(d);


                            else 
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2,num_components);
                                 x1=x2;
                                 y1=y2;

                            end 
                       end
                         
                        if (x2==x0+1 && y2==y0+1 ) || x2==0 || y2==0
                            flag=0;
                        end
                     

                    end

                    



                    
function [A1, x2, y2,d,z1,z2]=move_f(A1,d,x2,y2,label,z1,z2,num_components)

    
                            if d==0
                                
                               for b=1:length(num_components)
                                   if label==num_components(b)
                                    x2=x2-1;
                                    z1= [z1 x2];
                                    z2=[z2 y2];
                                    A1(x2,y2)=num_components(b);
                                   end
                          
                               end
                           
                            end
                            
                            if d==1
                                for b=1:length(num_components)
                                    if label==num_components(b)
                                        y2=y2+1;
                                        z1= [z1 x2];                                     
                                        z2= [z2 y2];                                     
                                        A1(x2,y2)=num_components(b);
                                    
                                    end
                                end
                            end
              
                          
                            if d==2
                                for b=1:length(num_components)
                                    
                                    if label==num_components(b)
                                            x2=x2+1;
                                            z1= [z1 x2];                                  
                                            z2= [z2 y2];                                     
                                            A1(x2,y2)=num_components(b);
                                    end
                                    
                                end
                            end
                                
                                
                            
                            if d==3
                                for b=1:length(num_components)
                                        if label==num_components(b)
                                             y2=y2-1;
                                             z1= [z1 x2];                                     
                                             z2= [z2 y2];                                     
                                             A1(x2,y2)=num_components(b);
                                        end
                                end
                            end
                            
                                
                               

end

                    % left function
function l=left(d)
                             d=d-1;
                             l=mod(d,4);


end
function r=right(d) % right function 
                             d=d+1;
                             r=mod(d,4);


end


end
