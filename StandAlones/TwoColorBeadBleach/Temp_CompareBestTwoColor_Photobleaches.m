Cut=.3;
%best=find(rsqs>Cut & rsqm>Cut & Am<4*10^5 & As<4*10^5 & len>=20);
usedL=find(len>=10);
SMG=sort(MaG(usedL),'descend');
best=[];
for i=1:25
best(i)=find(MaG==SMG(i));
end
events=[];
figure
for i=1:length(best)
    I=best(i);

    subplot(5,5,i)

    M=FXYCMS{I}(:,6);
    S=FXYCMS{I}(:,7);
    F=FXYCMS{I}(:,1);
    X1=FXYCMS{I}(1,2);
    Y1=FXYCMS{I}(1,3);
    Last=find(M<5000,1,'first');
    %usedF=find(S>0 & M>5000);
    usedF=find(M>0);
    if length(usedF)>=10
    M=M(usedF);
    S=S(usedF);
    F=F(usedF);
    
    for i2=1:length(M)
        events=[events ; [FXYCMS{I}(usedF(i2),1) FXYCMS{I}(usedF(i2),2) FXYCMS{I}(usedF(i2),3)]];
    end
    Mcme=FXYCMS{I}(:,5);
    plot(F,M,'g')
    hold on
    plot(F,S/mean(S)*mean(M),'r')
%     title('Red and Green Intensities (Scaled to Mean)')
    %plot(F,Mcme/mean(Mcme(1:10))*mean(S(1:10)),'b')
    %figure(2)
%     subplot(1,3,2)
%     plot(M./S)
%     scatter(M,M./S)
    title('Ratio of Intensities')
%     %figure(3)
%     subplot(1,3,3)
%    scatter(M,S)
%     xlabel('Green Intensity')
%     ylabel('Red Intensity')
    end
end