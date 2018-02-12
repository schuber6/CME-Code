function [DNRi,CLTAi]=PlotCLTAvDNRint(fileDNR,fileCLTA)

F=min(length(imfinfo(fileDNR)),length(imfinfo(fileCLTA)));
[Y,X]=size(imread(fileDNR,'Index',1));

for i=1:22 %Scan through all frames
    DNRi=zeros(1,Y*X);
    CLTAi=zeros(1,Y*X);
    index=1;
    subplot(5,5,i)
    f=i*30;
    IMGd=imread(fileDNR,'Index',f);
    IMGc=imread(fileCLTA,'Index',f);
    for i2=1:Y
        for i3=1:X
            DNRi(index)=IMGd(i2,i3);
            CLTAi(index)=IMGc(i2,i3);
            index=index+1;
        end
    end
    scatter(DNRi,CLTAi,1)
    xlabel('DNR intensity')
    xlim([0 4000])
    ylabel('CLTA intensity')
    ylim([0 8000])
    title(num2str(f))
end
