%  Fruits classification 

clc
clear all

% threshold image
        [FileName,FilePath]=uigetfile('*')
        input_image=imread(strcat(FilePath,FileName));

            % uint8 -> double image and size 
        input_double=double(input_image);
        %input_double1=input_double(:,:,1);
        input_double1=cat(3, input_double, input_double, input_double);

        [height,width,numcolors]=size(input_image);

        threshold_output=thresh_image(height,width,input_double);
         figure(1), imshow(uint8(threshold_output))
         title('Clean Threshold Image')

n = input(' 1. Connected component using Flood-fill \n 2. Connected component using Union find \n');
%clean threshold image 


switch n
    case 1
%         
        [output_connect,num_components,label]=ConnectedCompnentRepeatedFloodFill2(height,width,threshold_output);
        output_connect2=output_connect;
        output_connect3=output_connect;
        output_connect4=output_connect;

        
                     for i=1:height
                        for j=1:width
                            if output_connect(i,j)==10
                                    output_connect(i,j,3)=250;
                            end
                            if output_connect(i,j)==40
                                    output_connect(i,j,2)=50;
                            end
                            if output_connect(i,j)==70
                                    output_connect(i,j,3)=230;
                            end
                            if output_connect(i,j)==100
                                    output_connect(i,j,1)=200;
                            end

                            if output_connect(i,j)==130
                                     output_connect(i,j,2)=90;
                            end
                            if output_connect(i,j)==160
                                output_connect(i,j,3)=240;
                            end


                        end
                     end
        
          
        
        
        
            %outout image 
        output_connect1=uint8(output_connect);
        figure(2),imshow(output_connect1)
        title('Connected comp. using floodfil')
    
    case 2
%         
 
        Label_image1(height,width)=zeros();
        [output_unionfind,label]=Unionfind5(height,width,threshold_output,Label_image1);
        %output_connect2=output_unionfind;
        for i=1:height
            for j=1:width
                if output_unionfind(i,j)==20
                    output_unionfind(i,j,1)=255;
                end
                if output_unionfind(i,j)==60
                    output_unionfind(i,j,2)=90;
                end
                if output_unionfind(i,j)==130
                    output_unionfind(i,j,3)=130;
                end
                if output_unionfind(i,j)==170
                    output_unionfind(i,j,1)=170;
                end
        
                if output_unionfind(i,j)==210
                    output_unionfind(i,j,2)=210;
                end
                if output_unionfind(i,j)==240
                    output_unionfind(i,j,3)=250;
                end
        
        
        
            end
        end
        
        figure(3),imshow(uint8(output_unionfind))
        title(' Connected component using Union filed')
        
    otherwise
        disp('other value')
end
%% PCA and Region properties 


        %Region properties function call 
[m_00,m_10,m_01,m_11,m_20,m_02,Area] = region_properties(height,width,output_connect2);
                %PCA function call 
[lambda_1,lambda_2,theta,major_axis,minor_axis,Eccentricity,X_c,Y_c,miu_00,miu_02,miu_20,miu_11] = PCA(m_00,m_10,m_01,m_11,m_20,m_02);
X_s=[];
X_s1=[];
Y_s=[];
Y_s1=[];
X_p=[];
X_p1=[];
Y_p=[];
Y_p1=[];
for l=1:6
            X1(l)=round(X_c(l)-1*cos(theta(l))*sqrt(lambda_1(l)));% shesh theke suro
            X2(l)=round(X_c(l)+1*cos(theta(l))*sqrt(lambda_1(l)));
            Y1(l)=round(Y_c(l)-1*sin(theta(l))*sqrt(lambda_1(l)));
            Y2(l)=round(Y_c(l)+1*sin(theta(l))*sqrt(lambda_1(l)));
                %store different level value -> cordinate
            X_s(end+1)=X1(l);
            X_s1(end+1)=X2(l);
            Y_s(end+1)=Y1(l);
            Y_s1(end+1)=Y2(l);
             % perpendicular line
             
            X11(l)=round(X_c(l)+1*cos(theta(l)-pi/2)*sqrt(lambda_2(l)));% shesh theke suro
            X22(l)=round(X_c(l)-1*cos(theta(l)-pi/2)*sqrt(lambda_2(l)));
            Y11(l)=round(Y_c(l)+1*sin(theta(l)-pi/2)*sqrt(lambda_2(l)));
            Y22(l)=round(Y_c(l)-1*sin(theta(l)-pi/2)*sqrt(lambda_2(l)));
            
            X_p(end+1)=X11(l);
            X_p1(end+1)=X22(l);
            Y_p(end+1)=Y11(l);
            Y_p1(end+1)=Y22(l);
end




             %% wall following 
 % steps: 1. get first pixel coordinate, 2. decision bases on eccentricity and area 3. wall following function call 4. flood with new colour      
A=output_connect2;
x=[];
y=[];
labels=label;
% 1. get first pixel coordinate->storing the value when it hits first pixel of each level 
for i=1:height
    for j=1:width
        if A(i,j)==10
            if length(x)<1 % only first ,no need others 
                x(end+1)=i;
                y(end+1)=j;
            end
            
        end
        if A(i,j)==40
            if length(x)<2 % only second ,no need others 
                x(end+1)=i;
                y(end+1)=j;
                
            end
           
        end
        if A(i,j)==70
            if length(x)<3
                x(end+1)=i;
                y(end+1)=j;
                
            end
            
        end
        if A(i,j)==100
            if length(x)<4
                x(end+1)=i;
                y(end+1)=j;
               
            end
            
        end
        if A(i,j)==130
            if length(x)<5
                x(end+1)=i;
                y(end+1)=j;
                
            end
            
        end
        if A(i,j)==160
            if length(x)<6
                x(end+1)=i;
                y(end+1)=j;
                
            end
            break
        end
        
          
    end
    
end


figure (12),imshow(uint8(input_double1))
title('input image')

% declaring new variable
A1(height,width)=zeros;
z=size(A);
labels=labels(1:6);
L=length(labels);

for i=1:L
    if Eccentricity(i)>0.90 % banana Eccentricity is close to 1 
        x0=x(i);% get first pixel coordinate 
        y0=y(i);
            % wall following function
        [A1,z1,z2]=wall_f3(A,A1,height,width,x0,y0, labels(i));
        k1=z1;
        while ~isempty (z1 & z2)
            q_x=z1(length(z1)); % pop last value
            z1(length(z1))=[]; % delete last value
        
            q_y=z2(length(z2)); % pop last value
            z2(length(z2))=[]; % delete last value
          
            for h=1:height
                for j=1:width
                    if h==q_x && j==q_y
                        input_double1(h,j,1)=255;% red colour for banana
                        input_double1(h,j,2)=255;
                        input_double1(h,j,3)=0;


                    end
                end
            end
        
        end
        
%         
        
    end
    if Eccentricity(i)>0.20 % Eccentricity is not only sufficient to identify it as apple
        if Area(i)<3000 % apple area < banana, tangerane
                x0=x(i); % get first pixel coordinate 
                y0=y(i);
                m00=labels(i);
                    % Wall following function call 
                [A1,z1,z2]=wall_f3(A,A1,height,width,x0,y0,labels(i));
                 m1=z1;
        
            while ~isempty (z1 & z2)
                q_x=z1(length(z1)); % pop last value
                z1(length(z1))=[]; % delete last value
        
                q_y=z2(length(z2)); % pop last value
                z2(length(z2))=[]; % delete last value
          
                for h=1:height
                    for j=1:width
                        if h==q_x && j==q_y
                            input_double1(h,j,1)=255;% red colour for apple
                            input_double1(h,j,2)=0;
                            input_double1(h,j,3)=0;

                        end
                    end
                end
            end
%         
        end
        
   end
    if Eccentricity(i)<0.45 && Area(i)>3000 % tangarine-> area > apple and eccentricity< banana 
        x0=x(i); % get first pixel coordinate 
        y0=y(i);
                % wall following function call 
        [A1,z1,z2]=wall_f3(A,A1,height,width,x0,y0, labels(i));
        
        while ~isempty (z1 & z2)
            q_x1=z1(length(z1)); % pop last value
            z1(length(z1))=[]; % delete last value
        
            q_y1=z2(length(z2)); % pop last value
            z2(length(z2))=[]; % delete last value
          
            for h=1:height
                for j=1:width
                    if h==q_x1 && j==q_y1
                        input_double1(h,j,1)=255; % orange colour for tangarine
                        input_double1(h,j,2)=165;
                        input_double1(h,j,3)=0;

                    end
                end
            end
        
        end
    end
end

   %% Banana stem
   
 [stem_c_x,stem_c_y,target_level,Area2] = banana_stem(threshold_output,height,width);
        % set new color for banana stem 
%
b1=stem_c_x;
b2=stem_c_y;
 for i=1:length(target_level)
      while ~isempty (stem_c_x & stem_c_y)
          
                q_x=stem_c_x(length(stem_c_x)); % pop last value
                stem_c_x(length(stem_c_x))=[]; % delete last value
        
                q_y=stem_c_y(length(stem_c_y)); % pop last value
                stem_c_y(length(stem_c_y))=[]; % delete last value
          
                for h=1:height
                    for j=1:width
                        if h==q_x && j==q_y
                            input_double1(h,j,1)=255; % white color 
                            input_double1(h,j,2)=0;
                            input_double1(h,j,3)=0;
                         
                        end
                    end
                end
     
      end
 end
 
figure(4),imshow(uint8(input_double1))
title('Classified Objects')
hold on
                %axis display 
             for m=1:length(X_s)
                 v=[X_s(m) X_s1(m)];
                 w=[Y_s(m) Y_s1(m)];
                 plot(w,v,'b')
                 hold on
                 v1=[X_p(m) X_p1(m)];
                 w1=[Y_p(m) Y_p1(m)];
                 plot(w1,v1,'b')
                 
             end 
  
