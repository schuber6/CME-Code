Pre='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_004GFP_BS_fxycMS.mat';
Post='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_post_004GFP_BS_fxycMS.mat';
clear all
exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
CorsAC=cell(1,4);
for i0=1:4
    SM=strcat('170519*00',num2str(i0),'GFP_BS_fxycMS.mat');
    %SS=strcat('*00',num2str(i0),'_RFP_BS_Stack*mat');
tmpdm = dir(fullfile(omd,SM));
Pre = fullfile(omd,tmpdm(2).name);
Post = fullfile(omd,tmpdm(1).name);
%tmpds = dir(fullfile(omd,SS));



load(Pre)
Data1=PullTraceData(fxycMS);
L=length(Data1(:,1));
Os=zeros(L,1);
Data1=[Data1 Os];
load(Post)
Data2=PullTraceData(fxycMS);
L=length(Data2(:,1));
Os=zeros(L,1)+1;
Data2=[Data2 Os];
Data=[Data1 ; Data2];

names{1}='First_Frame';
names{2}='Last_Frame';
names{3}='Lifetime';
names{4}='Max_A_Int';
names{5}='Max_C_Int';
names{6}='Log_Max_A_over_Max_C';
names{7}='Init_A_Int';
names{8}='Init_C_Int';
names{9}='Log_Init_A_over_Init_C';
names{10}='Final_A_Int';
names{11}='Final_C_Int';
names{12}='Log_Final_A_over_Final_C';
names{13}='Init_A_Rate';
names{14}='Init_C_Rate';
names{15}='Final_A_Rate';
names{16}='Final_C_Rate';
names{17}='Osmo';


Cor=corr(Data);
for i=1:length(names)
    for i2=1:length(names)
        CorsA(i2).name=names{i2};
        %Xfstr.(names{i})=Xfull(:,i).';
        CorsA(i2).(names{i})=Cor(i2,i);
        
    end
end
CorsAC{i0}=CorsA;
end


Pre='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies\005_GFP_BS_fxycMS.mat';
Post='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies\005_osmo_GFP_BS_fxycMS.mat';

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
Data1=PullTraceData(fxycMS);
L=length(Data1(:,1));
Os=zeros(L,1);
Data1=[Data1 Os];
load(Post)
Data2=PullTraceData(fxycMS);
L=length(Data2(:,1));
Os=zeros(L,1)+1;
Data2=[Data2 Os];
Data=[Data1 ; Data2];

names{1}='First_Frame';
names{2}='Last_Frame';
names{3}='Lifetime';
names{4}='Max_A_Int';
names{5}='Max_C_Int';
names{6}='Log_Max_A_over_Max_C';
names{7}='Init_A_Int';
names{8}='Init_C_Int';
names{9}='Log_Init_A_over_Init_C';
names{10}='Final_A_Int';
names{11}='Final_C_Int';
names{12}='Log_Final_A_over_Final_C';
names{13}='Init_A_Rate';
names{14}='Init_C_Rate';
names{15}='Final_A_Rate';
names{16}='Final_C_Rate';
names{17}='Osmo';


Cor=corr(Data);
for i=1:length(names)
    for i2=1:length(names)
        CorsC(i2).name=names{i2};
        %Xfstr.(names{i})=Xfull(:,i).';
        CorsC(i2).(names{i})=Cor(i2,i);
        
    end
end
CorsCC{i0}=CorsC;
end
AP2_Av=AvStructs(CorsAC);
CALM_Av=AvStructs(CorsCC);
NSTA=SubStructs(AP2_Av,CALM_Av);