function PlotRandTraces_RecruitmentAC(fxycMS)

ML=10;
MInt=500;
MaxL=30;
MN=9;
MC=.6;

MSDifs=cell(1,100);
InterM=cell(1,100);
InterS=cell(1,100);
Ts=length(fxycMS(1,1,:));
num=0;

figure('units','normalized','outerposition',[0 0 1 1])
while num<MN
    i=ceil(rand*Ts);
    used=find(fxycMS(:,1,i));
    usedPrev=find(fxycMS(used,5,i)==0);
    usedPost=find(fxycMS(used,5,i));
    LPrev=length(usedPrev);
    LPost=length(usedPost);
    
    if LPrev>=ML && LPost>=ML && max(fxycMS(:,9,i))>MInt && max(fxycMS(:,9,i))>=0 && fxycMS(1,4,i)==3
        Mast=fxycMS(used,9,i);
        Slave=fxycMS(used,6,i);
        C=corr([Mast  Slave]);
        if C(1,2)>=MC
            num=num+1;
            subplot(3,3,num)
            
            
            
%             Mast2=fxycMS(used,5,i);
%             t2=1:length(Mast2);
%             t2=t2*3;
%             Frames=fxycMS(used,1,i);
%             Xp=(Frames-Frames(1))/(max(Frames)-Frames(1))*100;
%             SI=interp1(Xp,Slave,0:100);
%             MI=interp1(Xp,Mast,0:100);
%             for i2=1:min(length(Mast),100)
%                 InterM{i2}=[InterM{i2} Mast(i2)];
%                 InterS{i2}=[InterS{i2} Slave(i2)];
%                 MSDifs{i2}=[MSDifs{i2} Mast(i2)-Slave(i2)];
%             end
%             t=1:length(Mast);
%             t=(t-11)*3;
%             ScatterWithArrows(Mast,Slave);
%             AddLinearRegLine(Mast,Slave);
            ACs{i}=PlotRecruitmentACRatio(Mast,Slave);
            
            %xlim([-30 60])
            %title(num2str(C(1,2)));
        end
    end
end
% for i=1:length(InterM)
%     MM(i)=sum(InterM{i})/length(InterM{i});
%     MS(i)=sum(InterS{i})/length(InterS{i});
%     MD(i)=mean(MSDifs{i});
% end
% t=1:100;
% t=(t-11)*3;
% figure
% plot(t,(MM-min(MM))/(max(MM)-min(MM)),'g')
% hold on
% plot(t,(MS-min(MS))/(max(MS)-min(MS)),'r')
% %plot(t,MD,'b')
% xlim([-30 30])

