clear all
names{1}='Frame';
names{2}='Lifetime';
names{3}='Gauss_A_Int';
names{4}='Pixel_A_Int';
names{5}='Pixel_C_Int';
names{6}='Log_A_Int_over_C_Int';
names{7}='Percent_Of_Phase';
% names{8}='Init_C_Int';
% names{9}='Log_Init_A_over_Init_C';
% names{10}='Final_A_Int';
% names{11}='Final_C_Int';
% names{12}='Log_Final_A_over_Final_C';
% names{13}='Init_A_Rate';
% names{14}='Init_C_Rate';
% names{15}='Final_A_Rate';
% names{16}='Final_C_Rate';
Pre='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies\005_GFP_BS_fxycMS.mat';
load(Pre)
exp_name='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies';
omd=fullfile(exp_name);
%CorsAC=cell(1,4);
for i0=[1 2 5]
    SM=strcat('*00',num2str(i0),'*GFP_BS_fxycMS.mat');
    %SS=strcat('*00',num2str(i0),'_RFP_BS_Stack*mat');
    tmpdm = dir(fullfile(omd,SM));
    Pre = fullfile(omd,tmpdm(1).name);
    Post = fullfile(omd,tmpdm(2).name);
    load(Pre)
    [IData,DData]=PullTraceTPData_First5(fxycMS);
    CorI=corr(IData);
    CorD=corr(DData);
    for i=1:length(names)
        for i2=1:length(names)
            CorsI(i2).name=names{i2};
            %Xfstr.(names{i})=Xfull(:,i).';
            CorsI(i2).(names{i})=CorI(i2,i);
            
        end
    end
    for i=1:length(names)
        for i2=1:length(names)
            CorsD(i2).name=names{i2};
            %Xfstr.(names{i})=Xfull(:,i).';
            CorsD(i2).(names{i})=CorD(i2,i);
            
        end
    end
    CorsCI{i0}=CorsI;
    CorsCD{i0}=CorsD;
end
CALM_AvI=AvStructs(CorsCI);
CALM_AvD=AvStructs(CorsCD);



exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
CorsAC=cell(1,4);
for i0=1:4
    SM=strcat('170519*00',num2str(i0),'GFP_BS_fxycMS.mat');
    %SS=strcat('*00',num2str(i0),'_RFP_BS_Stack*mat');
    tmpdm = dir(fullfile(omd,SM));
    Pre = fullfile(omd,tmpdm(2).name);
    Post = fullfile(omd,tmpdm(1).name);
    load(Pre)
    
    [IData,DData]=PullTraceTPData_First5(fxycMS);
    CorI=corr(IData);
    CorD=corr(DData);
    for i=1:length(names)
        for i2=1:length(names)
            CorsI(i2).name=names{i2};
            %Xfstr.(names{i})=Xfull(:,i).';
            CorsI(i2).(names{i})=CorI(i2,i);
            
        end
    end
    for i=1:length(names)
        for i2=1:length(names)
            CorsD(i2).name=names{i2};
            %Xfstr.(names{i})=Xfull(:,i).';
            CorsD(i2).(names{i})=CorD(i2,i);
            
        end
    end
    CorsAI{i0}=CorsI;
    CorsAD{i0}=CorsD;
end
AP2_AvI=AvStructs(CorsAI);
AP2_AvD=AvStructs(CorsAD);

NSTAi=SubStructs(AP2_AvI,CALM_AvI);
NSTAd=SubStructs(AP2_AvD,CALM_AvD);