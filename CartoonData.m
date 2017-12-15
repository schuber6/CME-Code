Window=2;
i0=3;
PlaneSpacing=400;
CompP=.9; %Percent of max intensity needed to start closing phase
DrawP=.05; %Percent required to start drawing--

Mint=max(AVtraceINTwinT{Window,i0});
Mz=min(AVtraceZwinT{Window,i0});
CP=find(AVtraceINTwinT{Window,i0}>Mint*CompP);
ClosingFrac=zeros(1,100);
for i=min(CP):max(CP)
    ClosingFrac(i)=(max(CP)-i+1)/(max(CP)-min(CP)+1);
end
for i=1:min(CP)
    ClosingFrac(i)=1;
end
for i=1:100
    H(i)=(AVtraceZwinT{Window,i0}(end-i+1)-Mz)*PlaneSpacing;
    if ClosingFrac(end-i+1)~=1
        SAfrac(i)=AVtraceINTwinT{Window,i0}(end-i+1)/Mint;
    else
        SAfrac(i)=1;
    end
    
    if SAfrac(i)>DrawP
    DrawPitLifting(SAfrac(i),H(i),ClosingFrac(end-i+1))
    export_fig('TestExportFig13.tif');
A=imread('TestExportFig13.tif');
imwrite(A,'CartoonE3_Post.tif','Writemode','append','Compression','none');
close all
    end
end