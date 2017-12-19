clear all
NF=30;
IntCutoff=400;
NCoh=10;
TCoh=30;
ICoh=400;
% fg=[0 .6 .4 2.5 2.5 .6 .4 2.5 2.5];
% zg=[0 100 200 200 200 100 200 200 200];
 fg=[3 3 3 3 3 3 3 3];
 zg=[300 300 300 300 300 300 300 300];
 movies{1}='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo004_AP2_BS_MasterSlaveFast_v3.mat';
 movies{2}='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo007_AP2_BS_MasterSlaveFast_v3.mat';
 movies{3}='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo008_AP2_BS_MasterSlaveFast_v3.mat';
 movies{4}='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo009_AP2_BS_MasterSlaveFast_v3.mat';
 AVtraceINTC=cell(1,NF);
AVtraceZC=cell(1,NF);
AVtraceLifeactC=cell(1,NF);
for i0=1:length(movies)
    
    
    load(movies{i0});    
%     if i0==1
%         N=NSTAgood;
%     else
%         N=[N NSTAgood];
%     end
%NSTAgood=IsolateFirst100Frames(NSTAgood);
%NSTAgood=CorrectForPhotobleaching(NSTAgood);
    %NSTACoh=SplitTracesByCohort_Lifetime(NSTAgood,NCoh,TCoh,fg(i0));
    NSTACoh=SplitTracesByCohort_Intensity(NSTAgood,NCoh,ICoh);
    
    for i=1:length(NSTACoh)
        if ~isempty(NSTACoh{i})
        %[M,SE]=LinkedSlopesWrapper_Slave_PB(NSTACoh{i},4);
        [M,SE]=LinkedSlopesWrapper_Slave(NSTACoh{i},4);
        end
    end

end
% [M,SE]=LinkedSlopesWrapper_Slave(N,4);