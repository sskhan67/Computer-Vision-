% dilation_bintion function

function output1= dilation_function(A,height,width,se)
output1(height,width)=zeros(); % initialize output as zeros

% boundary conditions and accesing each pixel
for i=1:height
    for j=1:width
        if i==1 && j==1 % check  imgae(1,1) point
           if A(i,j)==se || A(i,j+1)==se || A(i+1,j)==se %check value exists
            output1(i,j)=se;% replace with new value
           end
        end
        
        if i==1 && j==width % row 1, coloumn last
            if A(i,j)==se || A(i,j-1)==se || A(i+1,j)==se %check value exists
             output1(i,j)=se;% replace with new value
            end
        end
        
        if i==height && j==1 % last row, first coloumn pixel
            if A(i,j)==se || A(i,j+1)==se || A(i-1,j)==se
             output1(i,j)=se;% replace with new value
            end
        end
        
        if i==height && j==width % last row, last colomn pixel access
           if A(i,j)==se || A(i,j-1)==se || A(i-1,j)==se %check value exists
             output1(i,j)=se;
           end
        end
        
        
        if i==1 && j<width % first row, 2nd coloumn to before last colomn pixels 
            if j>1
                if A(i,j)==se || A(i,j+1)==se|| A(i,j-1)||A(i+1,j)==se %check value exists
                    output1(i,j)=se; % replace with new value
                end
            end
        end
            
        if i>1 && j==1 % 2nd row to before last row , first coloumn pixel access
            if i<height
                if A(i,j)==se || A(i,j+1)==se || A(i-1,j)||A(i+1,j)==se %check value exists
                    output1(i,j)=se; % replace with new value
                end
            end
        end
        
         if i==height && j<=width-1 % last row, 2nd coloumn til before last column
            if j>1
                if A(i,j)==se || A(i,j+1)==se|| A(i-1,j) ||A(i,j-1) %check value exists
                    output1(i,j)=se; % replace with new value
                end
            end
         end    
        
         if i>1 && j==width % 2nd row till before last row, last coloumn pixels access
            if i<height
                if A(i,j)==se || A(i,j-1)==se|| A(i-1,j)||A(i+1,j) %check value exists
                    output1(i,j)=se; % replace with new value
                end
            end
         end
       
        if i>1 && j>1% 2nd row to before last row, 2nd coloumn to before last coloumn
            if i<=height-1 && j<=width-1
               if A(i,j)==se || A(i,j-1)==se|| A(i-1,j)||A(i+1,j)==se||A(i,j+1)==se %check value exists
                    output1(i,j)=se;  % replace with new value
               end
            end
        end
        
        
         
          
    end
end

