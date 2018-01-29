exp_name='E:\CME Superfolder\CME Data\Ylis Movies\InidividualNSTAs';
tmpd = dir(fullfile(exp_name,'*.mat'));

WindowSize=100;
for i0=1:length(tmpd)
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0});
    figure
    for Window=1:2
        
        
        if Window==1
            W2=Window;
            C=[0 0 1];
        else
            W2=2.5;
            C=[1 0 0];
        end
        beg=(W2-1)*WindowSize;
        fin=W2*WindowSize;
        
        [LsZL,xbins]=LinkedSlopesWrapper_Range_NoPlot(NSTA,beg,fin);
        PlotLiftingGroups(LsZL,xbins,C)
        
    end
end

filename='E:\CME Superfolder\CME Data\170321_EzraSUMOsmoshockStacks\EzraOsmoshockNSTA_2.mat';
load(filename)
for i=1:4
    figure
    for Window=1:2
        
    if Window==1
    W2=Window;
    C=[0 0 1];
    else
        W2=2.5;
        C=[1 0 0];
    end
    beg=(W2-1)*WindowSize;
    fin=W2*WindowSize;
    

[LsZL,xbins]=LinkedSlopesWrapper_Range_NoPlot(nsta{i},beg,fin);
        PlotLiftingGroups(LsZL,xbins,C)
    end
end