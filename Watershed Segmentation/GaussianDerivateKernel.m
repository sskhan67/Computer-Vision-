function [Gderiv,w] = GaussianDerivateKernel(Sigma)
% sigma 0.6 
a=round((2*Sigma)-0.5);
w=2*a+1;
sum=0;
Gderiv=[];

% main function 
for i=1:w
    G1=-1*(i-1-a)*exp((-1*(i-1-a)*(i-1-a))/(2*Sigma*Sigma));
    sum=sum-(i*G1);
    Gderiv=[Gderiv G1];

end

Gderiv=Gderiv/sum;
Gderiv=flip(Gderiv);% to make it symmetric 
end

