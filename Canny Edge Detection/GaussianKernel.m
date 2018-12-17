function [G,w] = GaussianKernel(Sigma)
a=round((2*Sigma)-0.5);
w=2*a+1;
sum=0;
G=[];
for i=1:w
    G1=exp((-1*(i-1-a)*(i-1-a))/(2*Sigma*Sigma));
    sum=sum+G1;
    G=[G G1];

end

G=G/sum;
   
end

