%Plot most populated clusters in each group

FrameGap=3;

Group{1}=find(ML==3 & CME~=3);
Group{2}=find(CME==3 & ML~=3);
Group{3}=find(CME==3 & ML==3);
Group{4}=find(CME~=3 & ML~=3);

LTc{1}=[Data(Group{1}).LT]*FrameGap;
LTc{2}=[Data(Group{2}).LT]*FrameGap;
LTc{3}=[Data(Group{3}).LT]*FrameGap;
LTc{4}=[Data(Group{4}).LT]*FrameGap;

TraceC{1}={Data(Group{1}).A};
TraceC{2}={Data(Group{2}).A};
TraceC{3}={Data(Group{3}).A};
TraceC{4}={Data(Group{4}).A};

for i=1:4
    Ms=StatCell_Fancy(TraceC{i},@max);
    for i2=1:length(TraceC{i})
        TraceC{i}{i2}=TraceC{i}{i2}/Ms(i2);
    end
end

for i0=1:4
    [~,~,~,STrace]=ScottifyAverageTrace(TraceC{i0},100,0,0);
    Clusts=10;
    [clusters] = createTraceLibrary_Temp(STrace,FrameGap,Clusts,10,0,1);
    figure
    for i=1:length(clusters)
        subplot(2,5,i)
        plot(clusters(i).ave_tr)
        hold on
        LTs=LTc{i0}(clusters(i).index);
        %L{i}=strcat('Cluster #',num2str(i),' N=',num2str(clusters(i).num),' LT=',num2str(mean(LTs)));
        title(strcat('Cluster #',num2str(i),' N=',num2str(clusters(i).num),' LT=',num2str(mean(LTs))))
    end
    %legend(L)
    subplot(2,5,1)
    ylabel('Intensity')
    xlabel('Part of trace')
end

