function MsqE=CalculatePSFmeansquarederror(movie,FXYCMS,sd,r,Isolated)

IM=imread(movie,'Index',1);
events=FirstFrameEvents_FXYCMS(FXYCMS,Isolated);
for i0=1:length(events(:,1))
x=round(events(i0,2));
y=round(events(i0,3));
% x=93;  %Noise location
% y=277;
crop=CropEvent(x,y,IM,r);
c = twoDgaussianFitting_sdconstrained(crop,sd);



F = @(back, amp, x0, y0, th, x, y)back + amp*exp( ...
    -(cos(th)^2/(2*sd^2)+sin(th)^2/(2*sd^2))*(x-x0).^2 ...
    +2*(-sin(2*th)/(4*sd^2) + sin(2*th)/(4*sd^2))*(x-x0).*(y-y0) ...
    -(sin(th)^2/(2*sd^2)+cos(th)^2/(2*sd^2))*(y-y0).^2);

for i=1:2*r+1
    for i2=1:2*r+1
        Fi(i,i2)=F(c(1),c(2),c(3),c(4),c(5),i,i2);
    end
end


imV=reshape(crop,[1 (2*r+1)^2]);
fiV=reshape(Fi,[1 (2*r+1)^2]);
% SuperSubplot(i0);
% plot(imV,'g')
% hold on
% plot(fiV,'r')
MsqE(i0)=sum((imV/max(imV)-fiV/max(fiV)).^2);
end
