function [FXYCMS_Good,Good]=GatherVerifiedConclusions()

FXYCMS_Good={};
ind=1;
Good=[];

FrameGap=2;
folder1='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies';
folder2='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies';
files=FindFiles(folder1,'*tst_Small*');
files2=FindFiles(folder2,'*tst_Small*');
files=CombineCells(files,files2);
h=waitbar(0,'Gathering Dataset');
for i=1:length(files)
    waitbar(i/length(files))
    fx=strcat(files{i}(1:end-13),'FXYCMS.mat');
    load(fx)
    
    FXYCMS=AddMSJoshSlopes(FXYCMS,FrameGap); 
    [Nc,Fs,FXYCMS_Sel,slopes,value,D,R2]=CountConclusions_BySlope(FXYCMS,900,5,FrameGap);
    load(files{i})
    for i2=1:length(tracest)
        if tracest(i2).ishot
            FXYCMS_Good{ind}=FXYCMS_Sel{i2};
            Good(ind)=1;
            ind=ind+1;
        end
        if tracest(i2).ispair
            FXYCMS_Good{ind}=FXYCMS_Sel{i2};
            Good(ind)=0;
            ind=ind+1;
        end
    end
end
close(h)