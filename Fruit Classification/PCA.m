function [lambda_1,lambda_2,theta,major_axis,minor_axis,Eccentricity,X_c,Y_c,miu_00,miu_02,miu_20,miu_11] = PCA(m_00,m_10,m_01,m_11,m_20,m_02)
% Eigenvalues.

%b. Direction of the region (theta).

%c. Length of the major and minor axes.

%c. Eccentricity.
%level=[20 60 130 170 210 240];

level=[10 40 70 100 130 160];
X_c=[];
Y_c=[];
miu_00=[];
miu_11=[];
miu_20=[];
miu_02=[];
lambda_1=[];
lambda_2=[];
theta=[];
major_axis=[];
minor_axis=[];
Eccentricity=[];
for l=1:length(level)

            X_c(l)=(m_10(l)/m_00(l));
            X_c(end+1)=X_c(l);

            Y_c(l)=(m_01(l)/m_00(l));
            Y_c(end+1)=Y_c(l);

            miu_00(l)=m_00(l);
            miu_00(end+1)=miu_00(l);

            miu_11(l)=m_11(l)-(Y_c(l)*m_10(l));
            miu_11(end+1)=miu_11(l);


            miu_20(l)=m_20(l)-(X_c(l)*m_10(l));
            miu_20(end+1)=miu_20(l);

            miu_02(l)=m_02(l)-(Y_c(l)*m_01(l));
            miu_02(end+1)=miu_02(l);

                % eigen values
            

            lambda_1(l)=(1/(2*miu_00(l)))*(miu_20(l)+miu_02(l)+sqrt((miu_20(l)-miu_02(l))^2+(4*miu_11(l)^2)));
            lambda_1(end+1)=lambda_1(l);
            lambda_2(l)=(1/(2*miu_00(l)))*(miu_20(l)+miu_02(l)-sqrt((miu_20(l)-miu_02(l))^2+(4*miu_11(l)^2)));
            lambda_2(end+1)=lambda_2(l);

            theta(l)=0.5*atan2(2*miu_11(l),miu_20(l)-miu_02(l));
            theta(end+1)=theta(l);
                % axis cal.
            major_axis(l)=2*sqrt(lambda_1(l));
            major_axis(end+1)=major_axis(l);

            minor_axis(l)=2*sqrt(lambda_2(l));
            minor_axis(end+1)=minor_axis(l);

                % eccentricity
            Eccentricity(l)=sqrt((lambda_1(l)-lambda_2(l))/lambda_1(l));
            Eccentricity(end+1)=Eccentricity(l);

end
end

