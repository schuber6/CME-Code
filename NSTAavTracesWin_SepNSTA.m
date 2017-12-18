exp_name='E:\CME Superfolder\CME Data\Esra Movies 2';
tmpd = dir(fullfile(exp_name,'*.mat'));

WindowSize=100;
INTCellT=cell(100,2);
ZCellT=cell(100,2);
for i0=1:length(tmpd)
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0});
    M=maxframeNSTA(NSTA);
    SPicy=ceil(sqrt(floor(M/WindowSize)));
    for Window=1:2
        if Window==1
            W2=Window;
        else
            W2=3;
        end
        beg=(W2-1)*WindowSize;
        fin=W2*WindowSize;
        %i0=1;
        
        
        N=NSTA;
        AVtraceINTwin{Window}=zeros(1,100);
        AVtraceZwin{Window}=zeros(1,100);
        ZCell{Window}=cell(1,100);
        INTCell{Window}=cell(1,100);
        Counts=zeros(1,100);
        CountsT=0;
        for i=1:length(N)
            if N(i).class==0
                used=find(N(i).frame,100,'last');
                if N(i).frame(used(end))>=beg && N(i).frame(used(end))<fin
                    medZ=median(N(i).st(used));
                    for i2=1:length(used)
                        AVtraceINTwin{Window}(1+length(used)-i2)=AVtraceINTwin{Window}(1+length(used)-i2)+N(i).int(used(i2))/max(N(i).int);
                        AVtraceZwin{Window}(1+length(used)-i2)=AVtraceZwin{Window}(1+length(used)-i2)+N(i).st(used(i2))-medZ;
                        INTCell{Window}{1+length(used)-i2}=[INTCell{Window}{1+length(used)-i2} N(i).int(used(i2))/max(N(i).int)];
                        ZCell{Window}{1+length(used)-i2}=[ZCell{Window}{1+length(used)-i2} N(i).st(used(i2))-medZ];
                        Counts(1+length(used)-i2)=Counts(1+length(used)-i2)+1;
                    end
                    CountsT=CountsT+1;
                end
            end
        end
        % AVtraceINTwinT{Window}=AVtraceINTwin{Window}/CountsT;
        % AVtraceZwinT{Window}=AVtraceZwin{Window}/CountsT;
        M=0;
        for i=1:length(INTCell{Window})
            if length(INTCell{Window}{i})>M
                M=length(INTCell{Window}{i});
            end
        end
        for i=1:length(INTCell{Window})
            for i2= length(INTCell{Window}{i})+1:M
                INTCell{Window}{i}=[INTCell{Window}{i} 0];
                ZCell{Window}{i}=[ZCell{Window}{i} 0];
            end
        end
        for i=1:length(INTCell{Window})
            % AVtraceINTwinT{Window}(i)=sum(INTCell{Window}{i})/M;
            % AVtraceZwinT{Window}(i)=sum(ZCell{Window}{i})/M;
            AVtraceINTwinT{Window}(i)=mean(INTCell{Window}{i});
            AVtraceZwinT{Window}(i)=mean(ZCell{Window}{i});
            AVtraceINTwinTSD{Window}(i)=sqrt(var(INTCell{Window}{i}));
            AVtraceZwinTSD{Window}(i)=sqrt(var(ZCell{Window}{i}));
            AVtraceINTwinTSE{Window}(i)=sqrt(var(INTCell{Window}{i}))/sqrt(M);
            AVtraceZwinTSE{Window}(i)=sqrt(var(ZCell{Window}{i}))/sqrt(M);
        end
        AVtraceINTwin{Window}=AVtraceINTwin{Window}./Counts;
        AVtraceZwin{Window}=AVtraceZwin{Window}./Counts;
        
        %subplot(double(SPicy),double(SPicy),double(Window))
        %subplot(2,4,i0)
        %figure
        plat=find(AVtraceINTwin{Window}>=.9*max(AVtraceINTwin{Window}));
        peak=ceil(mean(plat));
        clear x y
        for i=1:peak
            x(i)=i;
            y(i)=AVtraceZwin{Window}(i);
        end
        [slope(i0,Window), rsq]=LinearSlopeandR2(x,y);
        F(i0,Window)=max(y(1:4));
        for i=1:100
            xs(i)=101-i;
        end
        if Window==1
            subplot(1,2,1)
            
            PlotShadedErrorBars(xs,AVtraceINTwinT{Window},AVtraceINTwinTSE{Window},[0 128/255 1])
            title('Intensity')
            %errorbar(AVtraceINTwinT{Window},AVtraceINTwinTSE{Window},'Color','b')
            hold on
            subplot(1,2,2)
            
            PlotShadedErrorBars(xs,AVtraceZwinT{Window},AVtraceZwinTSE{Window},[0 128/255 1])
            title('Z-Position')
            %errorbar(AVtraceZwinT{Window},AVtraceZwinTSE{Window},'Color','b')
            hold on
        else
            subplot(1,2,1)
            PlotShadedErrorBars(xs,AVtraceINTwinT{Window},AVtraceINTwinTSE{Window},[202/255 0 0])
            ylabel('Average Trace')
            xlabel('Frames')
            %errorbar(AVtraceINTwinT{Window},AVtraceINTwinTSE{Window},'Color','r')
            hold on
            subplot(1,2,2)
            PlotShadedErrorBars(xs,AVtraceZwinT{Window},AVtraceZwinTSE{Window},[202/255 0 0])
            %errorbar(AVtraceZwinT{Window},AVtraceZwinTSE{Window},'Color','r')
            hold on
        end
        
        
        %legend('Before Osmoshock','After Osmoshock')
        %title('Z position (red), Intensity (blue)')
        %title(strcat(num2str(beg),'-',num2str(fin)))
        %ylim([-.2 .8])
        
        %plot([mean(plat) mean(plat)],[-.2 .8],'g')
    end
    figure
    for i0=1:2
        for i=1:length(INTCell{i0})
            INTCellT{i,i0}=[INTCellT{i,i0} INTCell{i0}{i}];
            ZCellT{i,i0}=[ZCellT{i,i0} ZCell{i0}{i}];
        end
    end
end


for i0=1:2
    for i=1:100 %length(INTCellT{:,i0})  Might need to generalize in the future
        AvINTT(i)=mean(INTCellT{i,i0});
        AvZT(i)=mean(ZCellT{i,i0});
        AvINTTSE(i)=sqrt(var(INTCellT{i,i0}))/sqrt(length(INTCellT{i,i0}));
        AvZTSE(i)=sqrt(var(ZCellT{i,i0}))/sqrt(length(ZCellT{i,i0}));
    end
    
    if i0==1
        subplot(1,2,1)
        
        PlotShadedErrorBars(xs,AvINTT,AvINTTSE,[0 128/255 1])
        title('Intensity')
        %errorbar(AVtraceINTwinT{Window},AVtraceINTwinTSE{Window},'Color','b')
        hold on
        subplot(1,2,2)
        
         PlotShadedErrorBars(xs,AvZT,AvZTSE,[0 128/255 1])
        title('Z-Position')
        %errorbar(AVtraceZwinT{Window},AVtraceZwinTSE{Window},'Color','b')
        hold on
    else
        subplot(1,2,1)
        PlotShadedErrorBars(xs,AvINTT,AvINTTSE,[202/255 0 0])
        ylabel('Average Trace')
        xlabel('Frames')
        %errorbar(AVtraceINTwinT{Window},AVtraceINTwinTSE{Window},'Color','r')
        hold on
        subplot(1,2,2)
        PlotShadedErrorBars(xs,AvZT,AvZTSE,[202/255 0 0])
        %errorbar(AVtraceZwinT{Window},AVtraceZwinTSE{Window},'Color','r')
        hold on
    end
end