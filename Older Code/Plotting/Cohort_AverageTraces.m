NumCohorts=6; %Makes equally spaced and sized cohorts with minimum of smallest=30 and max of largest=150
FrameRate=3;
Edges=20:(120/NumCohorts):140;
% for i=1:4
%     Cohort{i}=cell(1,10+i*10);
% end
Cohs=zeros(1,length(ManI));
for i=1:length(ManI)
    LT=length(ManI{i});
    for i2=1:length(Edges)-1
        if LT>=Edges(i2)/FrameRate && LT<Edges(i2+1)/FrameRate
            Cohs(i)=i2;
            break
        end
    end
%     if Coh>=1 && Coh<=4
%         for i2=1:LT
%             Cohort{Coh}{i2}=[Cohort{Coh}{i2} ManI{i}(i2)/(18400/80)];
%         end
%         
%     end
end

% figure
% for i=1:4
%     CMean=StatCell(Cohort{i},'mean_assumezeros');
%     t=3*(1:length(CMean));
%     plot(t,CMean)
%     hold on
% end
% xlabel('Time (s)')
% ylabel('Average Number of AP2s')
% legend('30-60s Cohort','60-90s Cohort','90-120s Cohort','120-150s Cohort')


%figure
L=cell(1,NumCohorts);
SCell=cell(1,NumCohorts);
Maxs=cell(1,NumCohorts);
for i=1:NumCohorts
    [SCell{i},Maxs{i}]=ScottifyTraces(ManI,find(Cohs==i),mean([Edges(i) Edges(i+1)]));
    Maxs{i}=Maxs{i}/(18400/80);
    CMeanSH=StatCell(SCell{i},'mean_assumezeros');

    plot(CMeanSH/(18400/80))
    hold on
    L{i}=strcat(num2str(Edges(i)),'-',num2str(Edges(i+1)),'s Cohort');
end
xlabel('Time (s)')
ylabel(strcat('Average Number of  ',protein,'s'))
legend(L)
subplot(2,2,3)
[MaxMean,MeanStDev]=StatCell(Maxs,'median_notboxplot');
xlim([.5 NumCohorts+.5])
xticks(1:NumCohorts)
xticklabels(L)
xtickangle(45)
ylabel(strcat('Maximum Number of  ',protein,'s')) 
YL=ylim;
ylim([0 YL(2)])
subplot(2,2,4)
plot(MaxMean/max(MaxMean))
xlim([.5 NumCohorts+.5])
xticks(1:NumCohorts)
xticklabels(L)
xtickangle(45)
ylabel(strcat('Relative Median Number of  ',protein,'s')) 
ylim([0 1.1])
CF=gcf;

figure(10)
plot(MaxMean/max(MaxMean),PCol)
hold on
xlim([.5 NumCohorts+.5])
xticks(1:NumCohorts)
xticklabels(L)
xtickangle(45)
ylabel(strcat('Relative Median Number of  ',protein,'s')) 
ylim([0 1.1])

figure(CF)