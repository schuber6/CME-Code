clear all
folder='E:\CME Superfolder\CME Data\TIRF SIM\CALM Plaques';
files=FindFiles(folder,'*488.tif').';
f=5;
file488=files{f};
file560=strcat(files{f}(1:end-7),' 560.tif');
F=length(imfinfo(file488));
for i=1:F
    CA=imread(file488,'Index',i);
    CL=imread(file560,'Index',i);
    I(i,1)=sum(sum(CA));
    I(i,2)=sum(sum(CL));
end

%%

figure
plot(I(:,1)/max(I(:,1)),'g')
hold on
plot(I(:,2)/max(I(:,2)),'r')