R=ceil(rand*length(inds));
T1=inds(R);
Mi=find(Matches(:,1)==T1);
T2=Matches(Mi,2);
fxyc1=FXYCMSg{T1};
fxyc2=FXYCMSr{T2};
[p,FPp]=PercentMatch(fxyc1,fxyc2);

% Ex=[];
% Ey=[];
% for i=1:length(fxyc1(:,1))
%     I=find(fxyc2(:,1)==fxyc1(i,1));
%     if ~isempty(I)
%         Ex=[Ex fxyc1(i,2)-fxyc2(I(1),2)];
%         Ey=[Ey fxyc1(i,3)-fxyc2(I(1),3)];
%     end
% end
% 
% figure
% scatter(Ex,Ey,'g')

figure
plot(fxyc1(:,2),fxyc1(:,3),'g')
hold on
plot(fxyc2(:,2),fxyc2(:,3),'r')
title(strcat(num2str(p),', ',num2str(FPp)))