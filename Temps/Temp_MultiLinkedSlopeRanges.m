%exp_name='E:\CME Superfolder\CME Data\Ylis Movies\InidividualNSTAs';
exp_name='E:\CME Superfolder\CME Data\170512_SUM_JaspOsmo';
tmpd = dir(fullfile(exp_name,'*.mat'));

WindowSize=100;
Group1=[1 2 5 6];
Group2=[3 4 7 8];
for i0=1:length(tmpd)
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0});
    %figure
    for Window=1:2
        
        
        if Window==1
            W2=Window;
            C=[0 1 0];
        else
            W2=2.5;
            C=[1 0 0];
        end
        if ismember(i0,Group2)
            C=C+[0 0 1];
        end
        beg=(W2-1)*WindowSize;
        fin=W2*WindowSize;
%         beg=1;
%         fin=maxframeNSTA(NSTA);
        
        [LsZL,xbins]=LinkedSlopesWrapper_Range_NoPlot(NSTA,beg,fin);
        subplot(2,4,i0)
        PlotLiftingGroups(LsZL,xbins,C)
        hold on
        
    end
end

