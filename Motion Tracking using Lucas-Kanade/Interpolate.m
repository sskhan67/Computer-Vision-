function [Jvalue]=Interpolate(J,inew,jnew)
 

i0=floor(inew);
j0=floor(jnew);
i1=round(inew);
j1=round(jnew);
[height,width,~]=size(J);

if(uint32(i0)>0 && uint32(j0)>0 && uint32(i0)<=height && uint32(j0)<=width)
    f00=J(uint32(i0),uint32(j0));
else
    f00=0;
end
if (uint32(i1)<=height && uint32(i1)>0 && uint32(j0)>0 && uint32(j0)<=width)
    f01=J(uint32(i1),uint32(j0));
else
    f01=0;
end
if (uint32(i0)>0 && uint32(i0)<=height && uint32(j1)<=width&& uint32(j1)>0)
    f10=J(uint32(i0),uint32(j1));
else
    f10=0;
end
if (uint32(i1)<=height && uint32(i1)>0 &&uint32(j1)<=width && uint32(j1)>0)
    f11=J(uint32(i1),uint32(j1));
else
    f11=0;
end

alpha=jnew-j0;
beta=inew-i0;

Jvalue=(1-beta)*(1-alpha)*f00+(1-beta)*alpha*f10+beta*(1-alpha)*f01+beta*alpha*f11;
end

