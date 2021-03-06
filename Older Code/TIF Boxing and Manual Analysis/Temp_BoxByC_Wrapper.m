%file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';
file='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_old\orig_movies\cell009_C1_100ms_3s.mat';
load(file)
A=distinguishable_colors(7,[0 0 0]);
MaxC=7;
Cs=[];
events=[];
[~,~,N]=size(Threshfxyc);
L=0;
for i=1:N
    used=find(Threshfxyc(:,1,i));
    C=Threshfxyc(1,4,i);
    if C<=MaxC && C>0
        L=L+length(used);
    end
end
events=zeros(L,3);
Cs=zeros(L,3);
ind=1;
for i=1:N
    used=find(Threshfxyc(:,1,i));
    C=Threshfxyc(1,4,i);
    if C<=MaxC && C>0
        Col=A(C,:);
        for i2=1:length(used)
            events(ind,:)=[Threshfxyc(i2,1,i) Threshfxyc(i2,2,i) Threshfxyc(i2,3,i)];
            Cs(ind,:)=Col;
            ind=ind+1;
        end
    end
end
% folder='E:\CME Superfolder\CME Data\180320_Analysis\orig_movies';
% files=FindFiles(folder,'*009*.tif');

movie='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_old\orig_movies\cell009_C1_100ms_3s.tif';
newfile=strcat(movie(1:end-4),'CBoxes_6.tif');
BoxEventsColors(movie,newfile,events,Cs);

%%
%file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';
file='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_old\orig_movies\cell009_C1_100ms_3s.mat';
load(file)
A=distinguishable_colors(5000,[0 0 0]);
MaxC=7;
Cs=[];
events=[];
[~,~,N]=size(Threshfxyc);
L=0;
for i=1:N
    used=find(Threshfxyc(:,1,i));
    C=Threshfxyc(1,4,i);
    if C~=4
        L=L+length(used);
    end
end
events=zeros(L,3);
Cs=zeros(L,3);
ind=1;
for i=1:N
    used=find(Threshfxyc(:,1,i));
    C=Threshfxyc(1,4,i);
    if C~=4
        Col=A(ceil(rand*5000),:);
        for i2=1:length(used)
            events(ind,:)=[Threshfxyc(i2,1,i) Threshfxyc(i2,2,i) Threshfxyc(i2,3,i)];
            Cs(ind,:)=Col;
            ind=ind+1;
        end
    end
end
% folder='E:\CME Superfolder\CME Data\180320_Analysis\orig_movies';
% files=FindFiles(folder,'*009*.tif');

movie='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_old\orig_movies\cell009_C1_100ms_3s.tif';
newfile=strcat(movie(1:end-4),'CBoxes_Ind.tif');
BoxEventsColors(movie,newfile,events,Cs);

%%

file='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell009_C1_100ms_3s.mat';
movie='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell009_C1_100ms_3s.tif';
load(file)
A=distinguishable_colors(7,[0 0 0]);
MaxC=7;
Cs=[];
events=[];
N=length(fxyc_struct);
L=0;
for i=1:N
    C=fxyc_struct(i).class;
    if C<=MaxC && C>0
        L=L+length(fxyc_struct(i).frame);
    end
end
events=zeros(L,3);
Cs=zeros(L,3);
ind=1;
for i=1:N
    C=fxyc_struct(i).class;
    if C<=MaxC && C>0
        Col=A(C,:);
        for i2=1:length(fxyc_struct(i).frame)
            events(ind,:)=[fxyc_struct(i).frame(i2) fxyc_struct(i).xpos(i2) fxyc_struct(i).ypos(i2)];
            Cs(ind,:)=Col;
            ind=ind+1;
        end
    end
end
% folder='E:\CME Superfolder\CME Data\180320_Analysis\orig_movies';
% files=FindFiles(folder,'*009*.tif');


newfile=strcat(movie(1:end-4),'CBoxes_6.tif');
BoxEventsColors(movie,newfile,events,Cs);

%%

file='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell009_C1_100ms_3s.mat';
movie='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell009_C1_100ms_3s.tif';
load(file)
fxyc_struct=SplitFXYC_Struct(fxyc_struct);
A=distinguishable_colors(7,[0 0 0]);
MaxC=7;
Cs=[];
events=[];
N=length(fxyc_struct);
L=0;
for i=1:N
    C=fxyc_struct(i).class;
    if C<=MaxC && C>0
        L=L+length(fxyc_struct(i).frame);
    end
end
events=zeros(L,3);
Cs=zeros(L,3);
ind=1;
for i=1:N
    C=fxyc_struct(i).class;
    if C<=MaxC && C>0
        Col=A(C,:);
        for i2=1:length(fxyc_struct(i).frame)
            events(ind,:)=[fxyc_struct(i).frame(i2) fxyc_struct(i).xpos(i2) fxyc_struct(i).ypos(i2)];
            Cs(ind,:)=Col;
            ind=ind+1;
        end
    end
end
% folder='E:\CME Superfolder\CME Data\180320_Analysis\orig_movies';
% files=FindFiles(folder,'*009*.tif');


newfile=strcat(movie(1:end-4),'CBoxes_6_splits.tif');
BoxEventsColors(movie,newfile,events,Cs);
%%

%file='E:\CME Superfolder\CME Data\190111_Analysis\50ms\squarecrop\orig_movies\cell015_C1.mat';
%file='E:\CME Superfolder\CME Data\190111_Analysis\50ms\Test4\orig_movies\cell015_C1.mat';
% file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';
% movie='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.tif';
%movie='E:\CME Superfolder\CME Data\190111_Analysis\50ms\Test4\orig_movies\cell015_C1.tif';
%movie='E:\CME Superfolder\CME Data\190111_Analysis\50ms\squarecrop\orig_movies\cell015_C1.tif';
file='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell009_C1_100ms_3s.mat';
movie='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell009_C1_100ms_3s.tif';
load(file)
fxyc_struct=SplitFXYC_Struct(fxyc_struct);
A=distinguishable_colors(5000,[0 0 0]);
MaxC=7;
Cs=[];
events=[];
N=length(fxyc_struct);
L=0;
for i=1:N
    C=fxyc_struct(i).class;
    if C~=4
        L=L+length(fxyc_struct(i).frame);
    end
end
events=zeros(L,3);
Cs=zeros(L,3);
ind=1;
for i=1:N
    C=fxyc_struct(i).class;
    if C~=4
        Col=A(ceil(rand*5000),:);
        for i2=1:length(fxyc_struct(i).frame)
            events(ind,:)=[fxyc_struct(i).frame(i2) fxyc_struct(i).xpos(i2) fxyc_struct(i).ypos(i2)];
            Cs(ind,:)=Col;
            ind=ind+1;
        end
    end
end
% folder='E:\CME Superfolder\CME Data\180320_Analysis\orig_movies';
% files=FindFiles(folder,'*009*.tif');


newfile=strcat(movie(1:end-4),'CBoxes_Ind_splits.tif');
BoxEventsColors(movie,newfile,events,Cs);

%%
file='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell009_C1_100ms_6s.mat';
movie='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell009_C1_100ms_6s.tif';
newfile=strcat(movie(1:end-4),'CBoxes_class_splits.tif');
style=1;
split=1;
BoxByC_Wrapper_fxycstruct(file,movie,newfile,style,split)
%%
file='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell002_C1_200ms_3s.mat';
movie='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell002_C1_200ms_3s.tif';
newfile=strcat(movie(1:end-4),'CBoxes_class_splits.tif');
style=1;
split=1;
BoxByC_Wrapper_fxycstruct(file,movie,newfile,style,split)
%%
file='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell015_C2_50ms_3s.mat';
movie='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_2019\orig_movies\cell015_C2_50ms_3s.tif';
newfile=strcat(movie(1:end-4),'CBoxes_class_splits.tif');
style=1;
split=1;
BoxByC_Wrapper_fxycstruct(file,movie,newfile,style,split)