function [x,y] = hariscorner(I)

k = 0.04;
Threshold = 8.5e8;
sigma = 1;
halfwid = sigma * 3;

[xx, yy] = meshgrid(-halfwid:halfwid, -halfwid:halfwid);

Gxy = exp(-(xx .^ 2 + yy .^ 2) / (2 * sigma ^ 2));

Gx = xx .* exp(-(xx .^ 2 + yy .^ 2) / (2 * sigma ^ 2));
Gy = yy .* exp(-(xx .^ 2 + yy .^ 2) / (2 * sigma ^ 2));

numOfRows = size(I, 1);
numOfColumns = size(I, 2);

% 1) Compute x and y derivatives of image
Ix = conv2(Gx, I);
Iy = conv2(Gy, I);

%size(Ix)

% 2) Compute products of derivatives at every pixel
Ix2 = Ix .^ 2;
Iy2 = Iy .^ 2;
Ixy = Ix .* Iy;

% 3)Compute the sums of the products of derivatives at each pixel
Sx2 = conv2(Gxy, Ix2);
Sy2 = conv2(Gxy, Iy2);
Sxy = conv2(Gxy, Ixy);

im = zeros(numOfRows, numOfColumns);
for x=1:numOfRows
   for y=1:numOfColumns
       % 4) Define at each pixel(x, y) the matrix H
       H = [Sx2(x, y) Sxy(x, y); Sxy(x, y) Sy2(x, y)];
       
       % 5) Compute the response of the detector at each pixel
       R = det(H) - k * (trace(H) ^ 2);
       
       % 6) Threshold on value of R
       if (R > Threshold)
          im(x, y) = R; 
       end
   end
end

% 7) Compute nonmax suppression
output = im > imdilate(im, [1 1 1; 1 0 1; 1 1 1]);

x1=[];y1=[];
[height,width,~]=size(output);
for i=1:height
    for j=1:width
        if output(i,j)==1
            x1=[x1 i];
            y1=[y1 j];
        end
    end
end
   

% city block distance d=|x2-x1|+|y2-y1|
  x2=[];
  y2=[];
  
  for i=1:length(x1)-1
      if abs(x1(i+1)-x1(i))+abs(y1(i+1)-y1(i))>2
          x2=[x2 x1(i)];
          y2=[y2 y1(i)];
      end
  end
 x=[];
 y=[];

for i=1:100
        if length(x2)>100 % top 100 features 
            x=[x x2(i)];
            y=[y y2(i)];
    
        else 
            x=x2;
            y=y2;
        end
    
end
% end city block 

end

