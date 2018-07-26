clear all
folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
files=FindFiles(folder,'*Tr.mat').';
for i=1:length(files)
    movieS=strcat(files{i}(1:end-10),'Green.tif');
    movieM=strcat(files{i}(1:end-7),'.tif');
    fileS=strcat(files{i}(1:end-4),'Plaques.mat');
    PlaqueFXYCMS(files{i},movieS,movieM,fileS)
    [Hm{2,i},Hs{2,i},mbins{2,i}]=SlopeAnalysis(fileS);
end

%%
folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';
files=FindFiles(folder,'*Tr.mat').';
for i=1:length(files)
    movieS=strcat(files{i}(1:end-10),'Green.tif');
    movieM=strcat(files{i}(1:end-7),'.tif');
    fileS=strcat(files{i}(1:end-4),'Plaques.mat');
    PlaqueFXYCMS(files{i},movieS,movieM,fileS)
    [Hm{1,i},Hs{1,i},mbins{1,i}]=SlopeAnalysis(fileS);
end

%%
folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies';
files=FindFiles(folder,'*Tr.mat').';
for i=1:length(files)
    movieS=strcat(files{i}(1:end-10),'Green.tif');
    movieM=strcat(files{i}(1:end-7),'.tif');
    fileS=strcat(files{i}(1:end-4),'Plaques.mat');
    PlaqueFXYCMS(files{i},movieS,movieM,fileS)
    [Hm{3,i},Hs{3,i},mbins{3,i}]=SlopeAnalysis(fileS);
end

%%

for i=1:4
    figure(1)
    plot(mbins{2,i},Hm{2,i}/sum(Hm{2,i})/(mbins{2,i}(2)-mbins{2,i}(1)),'r--')
    hold on
    figure(2)
    plot(mbins{2,i},Hs{2,i}/sum(Hs{2,i})/(mbins{2,i}(2)-mbins{2,i}(1)),'g--')
    hold on
end

for i=1:5
    figure(1)
    plot(mbins{1,i},Hm{1,i}/sum(Hm{1,i})/(mbins{1,i}(2)-mbins{1,i}(1)),'r')
    hold on
    figure(2)
    plot(mbins{1,i},Hs{1,i}/sum(Hs{1,i})/(mbins{1,i}(2)-mbins{1,i}(1)),'g')
    hold on
end

for i=1:6
    figure(1)
    plot(mbins{3,i},Hm{3,i}/sum(Hm{3,i})/(mbins{3,i}(2)-mbins{3,i}(1)),'r')
    hold on
    figure(2)
    plot(mbins{3,i},Hs{3,i}/sum(Hs{3,i})/(mbins{3,i}(2)-mbins{3,i}(1)),'g')
    hold on
end

%%

for i=1:3
    for i2=1:6
        S(i,i2)=sum(Hm{i,i2});
    end
end

%%

for i=1:3
    HMA{i}=zeros(1,101);
    HSA{i}=zeros(1,101);
    for i2=1:6
        if ~isempty(Hm{i,i2})
        HMA{i}=HMA{i}+Hm{i,i2};
        HSA{i}=HSA{i}+Hs{i,i2};
        end
    end
end

%%
figure
subplot(1,2,1)
plot(-.1:.002:.1,HMA{1}/sum(HMA{1}),'r')
hold on
plot(-.1:.002:.1,HMA{2}/sum(HMA{2}),'r--')
%plot(-.1:.002:.1,HMA{3}/sum(HMA{3}),'r:')
xlabel('Growth Rate')
ylabel('Frequency')
legend({'WT','SI','DSI'})
title('Clathrin Channel')
subplot(1,2,2)
plot(-.1:.002:.1,HSA{1}/sum(HSA{1}),'g')
hold on
plot(-.1:.002:.1,HSA{2}/sum(HSA{2}),'g--')
%plot(-.1:.002:.1,HSA{3}/sum(HSA{3}),'g:')
xlabel('Growth Rate')
ylabel('Frequency')
title('CALM Channel')
legend({'WT','SI','DSI'})