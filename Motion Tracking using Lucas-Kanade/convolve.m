function [convolution] = convolve(input, kernel)

[height, width] = size(input);
[ker_h, ker_w] = size(kernel);

for i = 1:height
    for j = 1:width
        sum = 0;
        for x = 1:ker_h
            for y = 1:ker_w
                offseti = -1*floor(ker_h/2)+x-1;
                offsetj = -1*floor(ker_w/2)+y-1;
                if (i+offseti <= height && i+offseti>0) && (j+offsetj <= width && j+offsetj>0)
                    sum = sum + input(i+offseti, j+offsetj) * kernel(x,y);
                end
            end
        end
        
        convolution(i,j)=sum;
        
    end
end
end

