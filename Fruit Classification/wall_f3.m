% wall following algorithm: final function 

function [A1,z1,z2]=wall_f3(A,A1,height,width,x0,y0,label)
flag=1;
d=0;
x1=x0;
y1=y0;
z1=[];
z2=[];

% 
                    while flag==1

                       if d==0 
                            if A(x1,y1-1)==label
                                d=left(d);
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2);
                                 x1=x2;
                                 y1=y2;

                            elseif A(x1-1,y1)==0 
                                d=right(d);

                            else 
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2);
                                 x1=x2;
                                 y1=y2;

                            end 
                       end
                       if d==1 
                            if A(x1-1,y1)==label
                                d=left(d);
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2);
                                 x1=x2;
                                 y1=y2;

                            elseif A(x1,y1+1)==0 
                                d=right(d);


                            else 
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2);
                                 x1=x2;
                                 y1=y2;

                            end 
                       end 
                       if d==2 
                            if A(x1,y1+1)==label
                                d=left(d);
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2);
                                 x1=x2;
                                 y1=y2;

                            elseif A(x1+1,y1)==0 
                                d=right(d);


                            else 
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2);
                                 x1=x2;
                                 y1=y2;
                            end 
                       end
                       if d==3 
                            if A(x1+1,y1)==label
                                d=left(d);
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2);
                                 x1=x2;
                                 y1=y2;

                            elseif A(x1,y1-1)==0 
                                d=right(d);


                            else 
                                [A1,x2,y2,d,z1,z2]=move_f(A1,d,x1,y1,label,z1,z2);
                                 x1=x2;
                                 y1=y2;

                            end 
                       end

                        if x2==x0 && y2==y0 
                            flag=0;
                        end


                    end

                    



                    
function [A1, x2, y2,d,z1,z2]=move_f(A1,d,x2,y2,label,z1,z2)

                            if d==0
                                if label==10
                                    x2=x2-1;
                                    z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=10;
                                end
                                if label==40
                                    x2=x2-1;
                                    z1(end+1)=x2;
                                    z2(end+1)=y2;

                                    A1(x2,y2)=40;
                                end
                                if label==70
                                    x2=x2-1;
                                    z1(end+1)=x2;
                                    z2(end+1)=y2;

                                    A1(x2,y2)=70;
                                end
                                if label==100
                                    x2=x2-1;
                                    z1(end+1)=x2;
                                    z2(end+1)=y2;

                                    A1(x2,y2)=100;
                                end
                                if label==130
                                    x2=x2-1;
                                    z1(end+1)=x2;
                                    z2(end+1)=y2;

                                    A1(x2,y2)=130;
                                end
                                
                                
                                if label==160
                                    x2=x2-1;
                                    z1(end+1)=x2;
                                    z2(end+1)=y2;

                                    A1(x2,y2)=160;
                                end
                            end
                            if d==1
                               if label==10 
                                y2=y2+1;
                                z1(end+1)=x2;
                                    z2(end+1)=y2;
                                A1(x2,y2)=10;
                               end
                               if label==40 
                                y2=y2+1;
                                z1(end+1)=x2;
                                    z2(end+1)=y2;
                                A1(x2,y2)=40;
                               end
                               if label==70 
                                y2=y2+1;
                                z1(end+1)=x2;
                                    z2(end+1)=y2;
                                A1(x2,y2)=70;
                               end
                               if label==100 
                                y2=y2+1;
                                z1(end+1)=x2;
                                    z2(end+1)=y2;
                                A1(x2,y2)=100;
                               end
                               if label==130 
                                y2=y2+1;
                                z1(end+1)=x2;
                                    z2(end+1)=y2;
                                A1(x2,y2)=130;
                               end
                               if label==160 
                                y2=y2+1;
                                z1(end+1)=x2;
                                    z2(end+1)=y2;
                                A1(x2,y2)=160;
                               end
                               
                               
                               
                               
                               
                            end
                            if d==2
                                if label==10
                                    x2=x2+1;
                                    z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=10;
                                end
                                if label==40
                                    x2=x2+1;
                                    z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=40;
                                end
                                if label==70
                                    x2=x2+1;
                                    z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=70;
                                end
                                
                                if label==100
                                    x2=x2+1;
                                    z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=100;
                                end
                                if label==130
                                    x2=x2+1;
                                    z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=130;
                                end
                                if label==160
                                    x2=x2+1;
                                    z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=160;
                                end
                                
                                
                            end
                            
                            if d==3
                                if label==10
                                     y2=y2-1;
                                     z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=10;
                                end
                                if label==40
                                     y2=y2-1;
                                     z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=40;
                                end
                                if label==60
                                     y2=y2-1;
                                     z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=60;
                                end
                                if label==70
                                     y2=y2-1;
                                     z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=70;
                                end
                                if label==100
                                     y2=y2-1;
                                     z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=100;
                                end
                                if label==130
                                     y2=y2-1;
                                     z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=130;
                                end
                                if label==160
                                     y2=y2-1;
                                     z1(end+1)=x2;
                                    z2(end+1)=y2;
                                    A1(x2,y2)=160;
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
