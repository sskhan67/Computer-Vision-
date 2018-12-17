function [Chamfer_Distance] = ChamferFunction(Edge)
[h,w]=size(Edge);
Chamfer_Distance=zeros(h,w);
% 1st pass; top to bottom , Left to right 
for i=1:h
    for j=1:w
        
        if i==1 && j==1
            if Edge(i,j)==255
                Chamfer_Distance(i,j)=0;
            else
                Chamfer_Distance(i,j)=1e50;% almost infinte number 
            end
        end
        
        if i==1 && j>1
            if Edge(i,j)==255
                Chamfer_Distance(i,j)=0;
            else
                Chamfer_Distance(i,j)=min([1e50 1e50 1+Chamfer_Distance(i,j-1)]);
            end
            
        end
        if i>1 && j==1
            if Edge(i,j)==255
                Chamfer_Distance(i,j)=0;
            else
                Chamfer_Distance(i,j)=min([1e50 1e50 1+Chamfer_Distance(i-1,j)]);
            end
        end
        
        if i>1 && j>1
            
            if Edge(i,j)==255
                Chamfer_Distance(i,j)=0;
            else
                Chamfer_Distance(i,j)=min([1e50 1e50 1+Chamfer_Distance(i-1,j)]);
            end
        end
        
        
        
        
        
    end
end
% 2nd pass , bottom to top , right to left 
for i=h:-1:1
    for j=w:-1:1
        
        if i==h && j==w
            if Edge(i,j)==255
                Chamfer_Distance(i,j)=0;
            else
                Chamfer_Distance(i,j)=Chamfer_Distance(i,j);
            end
        end
        
        if i==h && j<w
            if Edge(i,j)==255
                Chamfer_Distance(i,j)=0;
            else
                Chamfer_Distance(i,j)=min([Chamfer_Distance(i,j) 1+Chamfer_Distance(i,j+1) 1e50]);
            end
            
        end
        if i<h && j==w
            if Edge(i,j)==255
                Chamfer_Distance(i,j)=0;
            else
                Chamfer_Distance(i,j)=min([Chamfer_Distance(i,j) 1+Chamfer_Distance(i+1,j) 1e50]);
            end
        end
        if i==1 && j==w
            
            if Edge(i,j)==255
                Chamfer_Distance(i,j)=0;
            else
                Chamfer_Distance(i,j)=min([Chamfer_Distance(i,j) 1+Chamfer_Distance(i+1,j) 1e50]);
            end
        end
        if i==1 && j<w
            
            if Edge(i,j)==255
                Chamfer_Distance(i,j)=0;
            else
                Chamfer_Distance(i,j)=min([Chamfer_Distance(i,j) 1+Chamfer_Distance(i+1,j) 1+Chamfer_Distance(i,j+1)]);
            end
        end
        
        
        if i<h && j<w
            
            if Edge(i,j)==255
                Chamfer_Distance(i,j)=0;
            else
                Chamfer_Distance(i,j)=min([Chamfer_Distance(i,j) 1+Chamfer_Distance(i+1,j) 1+Chamfer_Distance(i,j+1)]);
            end
        end
        
           
    end
end
end

