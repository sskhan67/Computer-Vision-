function [M_00,M_10,M_01,M_11,M_20,M_02,Area] = region_properties(height,width,output_connect2)
%a. zeroth-, first- and second-order moments and central moments.

%b. Area of the region (just count the number of pixels in the region).


level=[10 40 70 100 130 160];
%level=[20 60 130 170 210 240];
M_00=[];
M_10=[];
M_01=[];
M_11=[];
M_20=[];
M_02=[];
Area=[];

for l=1:length(level)
    
            m_00=0;
            m_10=0;
            m_01=0;
            m_11=0;
            m_20=0;
            m_02=0;
            L=level(l);

            for i=1:height
                for j=1:width
                    if output_connect2(i,j)==L
                        m_00=m_00+1;
                        m_10=i+m_10;
                        m_01=j+m_01;
                        m_11=(i*j)+m_11;
                        m_20=(i*i)+m_20;
                        m_02=(j*j)+m_02;
                    end
                end
            end
             Area(end+1)=m_00;
             M_00(end+1)=m_00;
             M_10(end+1)=m_10;
             M_01(end+1)=m_01;
             M_11(end+1)=m_11;
             M_20(end+1)=m_20;
             M_02(end+1)=m_02;






end
end

