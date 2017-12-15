function [Xfs,names]=FilterData(X,names)


fs=[2 3 5 13 19 20 23 24 18 22];
Xfs=X(:,fs);


Xfs=Xfs(Xfs(:,9)<10^6,:); %Limit Z Gaussian amplitude
Xfs=Xfs(Xfs(:,10)<10^6,:);

Xfs=Xfs(Xfs(:,6)<=4,:); %Limit Z Gaussian S.D.
Xfs=Xfs(Xfs(:,6)>=1.25,:);
Xfs=Xfs(Xfs(:,8)<=4,:);
Xfs=Xfs(Xfs(:,8)>=1.25,:);

FP=median(Xfs(:,5));

Xfs=Xfs(Xfs(:,5)<=FP+1,:); %Limit spots to within 1 plane of bottom surface
Xfs=Xfs(Xfs(:,5)>=FP-1,:);
Xfs=Xfs(Xfs(:,7)<=FP+1,:);
Xfs=Xfs(Xfs(:,7)>=FP-1,:);

% Xfs=Xfs(Xfs(:,3)>=1000,:); %Raise min intensity
% Xfs=Xfs(Xfs(:,4)>=1000,:);

Xfs(:,11)=log(Xfs(:,3)./Xfs(:,4));
Xfs(:,12)=log(Xfs(:,9)./Xfs(:,10));

names=names(fs);
names{end+1}='Log_AC_Ratio';
names{end+1}='Log_AC_Ratio_Gauss';
%A=corr(Xfs);