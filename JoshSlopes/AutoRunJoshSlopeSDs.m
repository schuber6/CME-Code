clear SD F LT Fra I C LTEC
%exp_name='E:\CME Superfolder\CME Data\170613_Deoxy\170613_Deoxy_Analysis\orig_movies';
%exp_name='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies';
%exp_name='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies';
exp_name='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies';
%Ema SUM day 1
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.mat'));
WindowF=5;
BinSpacing=1;
framegap=3;

for i=24:27 %1:length(tmpd)
    load(fullfile(omd,tmpd(i).name))
    fxyc_struct = fxyc_to_struct(Threshfxyc,false);
    fxyc_struct = slope_finding(fxyc_struct,3,400);
    M=MaxFrameFXYCS(fxyc_struct);
    NW=ceil(M/BinSpacing);
%     A=ConvexHullAreas356Struct(fxyc_struct);
%     A=A*.16^2; %Convert to microns^2
    %LTFEC=FindLTEC_Struct(fxyc_struct,framegap);
%     [Cla,L,T]=TranslateFXYCS_EveryN(fxyc_struct,WindowF);
    for i2=1:NW
        starter=(i2-1)*BinSpacing+1;
        finish=starter+WindowF;
        if finish<=M
        SD(i,i2)=FindJSSDinTimeWindow_ClassRestricted(fxyc_struct,starter,finish);
        Fra(i,i2)=finish;
%         LTMA(i,i2)=FindLTinTimeWindow_ClassRestricted_median(fxyc_struct,starter,finish,framegap,1);
%         LTMT(i,i2)=FindLTinTimeWindow_ClassRestricted_median(fxyc_struct,starter,finish,framegap,0);
%         LTA(i,i2)=FindLTinTimeWindow_ClassRestricted(fxyc_struct,starter,finish,framegap,1);
%         LTT(i,i2)=FindLTinTimeWindow_ClassRestricted(fxyc_struct,starter,finish,framegap,0);
%         [I(i,i2),C(i,i2)]=FindICDensitiesStruct(fxyc_struct,starter,finish,framegap,A);
%         %LTEC(i,i2)=mean(LTFEC(starter:finish));
%         LTECMA(i,i2)=FindEndCorrectedLifetime_Range_median(Cla,L,T,starter,finish,framegap,1);
%         LTECMT(i,i2)=FindEndCorrectedLifetime_Range_median(Cla,L,T,starter,finish,framegap,0);
%         LTECA(i,i2)=FindEndCorrectedLifetime_Range(Cla,L,T,starter,finish,framegap,1);
%         LTECT(i,i2)=FindEndCorrectedLifetime_Range(Cla,L,T,starter,finish,framegap,0);
        end
    end
end