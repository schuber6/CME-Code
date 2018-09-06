function PlotRandomVerifiedTraces(FXYCMS,Good)


%FXYCMS=AddMSJoshSlopes(FXYCMS,1.5); 
for i=1:25
    
    figure(1)
    subplot(5,5,i)
    R=ceil(rand*length(Good));
    fxyc=FXYCMS{R};
    if Good(R)
        Col='g';
    else
        Col='r';
    end
    plot(FXYCMS{R}(:,6),Col)
    Fade=QuantifyConclusionFades(fxyc(:,6));
    title(num2str(Fade))
%     figure(2)
%     subplot(5,5,i)
% %     D=zeros(1,length(fxyc(:,6)));
% %     for i2=1:length(fxyc(:,6))-1
% %         D(i2)=norm([fxyc(i2+1,2)-fxyc(i2,2) fxyc(i2+1,3)-fxyc(i2,3)]);
% %     end
%     plot(fxyc(:,8),Col)
end