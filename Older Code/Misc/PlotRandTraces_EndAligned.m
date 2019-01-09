function PlotRandTraces_EndAligned(fxycMS)

ML=10;
MInt=500;
MaxL=30;
MN=9;
MF=max(max(fxycMS(:,1,:)));

MSDifs=cell(1,100);
InterM=cell(1,100);
InterS=cell(1,100);
Ts=length(fxycMS(1,1,:));
num=0;
figure
while num<MN
    i=ceil(rand*Ts);
    used=find(fxycMS(:,1,i));
    usedPrev=find(fxycMS(used,5,i)==0);
    usedPost=find(fxycMS(used,5,i));
    LPrev=length(usedPrev);
    LPost=length(usedPost);
    if LPost>=ML && max(fxycMS(:,9,i))>MInt && max(fxycMS(:,9,i))>=0 && fxycMS(1,4,i)==3 && max(fxycMS(:,1,i))<MF
        num=num+1;
        subplot(3,3,num)
        
        Mast=fxycMS(used,9,i);
        Mast=Mast;
        Slave=fxycMS(used,6,i);
        Slave=Slave;
        Mast2=fxycMS(used,5,i);
        Tm=FindMaxDecrease(Mast);
        Tsl=FindMaxDecrease(Slave);
        Tm2=FindMaxDecrease(Mast2);
        
        t=1:length(Mast);
        t=(t-11)*3;
        plot(t,Mast,'g')
        hold on
        plot(t,Slave,'r')
        YL=ylim;
        line([1 1]*t(Tm),YL,'color','g')
        line([1 1]*t(Tsl),YL,'color','r')
        line([1 1]*t(Tm2),YL,'color','b')
        %plot(t,Mast2/mean(nonzeros(Mast2))*mean(Mast),'b')
        %xlim([-30 60])
        title(num2str(i));
    end
end


