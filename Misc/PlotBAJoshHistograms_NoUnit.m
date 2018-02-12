function PlotBAJoshHistograms_NoUnit(path,Color)

FrameGap=3;

FrameBins=5;

load(path);
INT=CreateIntensityCell(Threshfxyc);
F=CreateFrameCell(Threshfxyc);
slopes = slope_finding(INT,FrameGap,400);
first=1;
last=max(max(Threshfxyc(:,1,:)));
JOSH=CombineSlopes(slopes);
JOSHF=CombineSlopes(F);

clear f sd

OsmoT=300;
startB=OsmoT/FrameGap/5;
finishB=startB*4;

startA=startB*6;
finishA=startB*9;


    [Jb,~]=RestrictJOSHSlopesWsd(JOSH,JOSHF,startB,finishB);
    [Ja,~]=RestrictJOSHSlopesWsd(JOSH,JOSHF,startA,finishA);
    Jb=nonzeros(Jb);
    Ja=nonzeros(Ja);
    Mb=mean(Jb);
    Sb=sqrt(var(Jb));
    Ma=mean(Ja);
    Sa=sqrt(var(Ja));
    NbinsD2=20;
    Nbins=NbinsD2*2+1;
    MaxZ=4;
    for i=1:Nbins
        xbinsb(i)=Mb+Sb/(NbinsD2/MaxZ)*(i-(NbinsD2+1));
        xbinsa(i)=Ma+Sa/(NbinsD2/MaxZ)*(i-(NbinsD2+1));
    end
    
    Hb=hist(Jb,xbinsb);
    Ha=hist(Ja,xbinsb);
    
    plot(xbinsb,Hb/sum(Hb)/(xbinsb(2)-xbinsb(1)),'--','Color',Color)
    hold on
    plot(xbinsb,Ha/sum(Ha)/(xbinsb(2)-xbinsb(1)),'Color',Color)
    legend('Before Osmoshock','After Osmoshock')
    xlim([-.1 .1])
    xlabel('Growth Rate')
    ylabel('Count')