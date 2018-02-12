function PlotBALTHistogram(path,Color)

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


    [Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
    Jb=nonzeros(Jb);
    Ja=nonzeros(Ja);
    Mb=mean(Jb);
    Sb=sqrt(var(Jb));
    Ma=mean(Ja);
    Sa=sqrt(var(Ja));
    
    Nbins=40;
    MaxZ=4;
    for i=1:Nbins+1
        xbinsbE(i)=(i-1)*(Sb*MaxZ+Mb)*2/Nbins;
        xbinsaE(i)=(i-1)*(Sa*MaxZ+Ma)*2/Nbins;
    end
    for i=1:Nbins
        xbinsb(i)=mean([xbinsbE(i) xbinsbE(i+1)]);
        xbinsa(i)=mean([xbinsaE(i) xbinsaE(i+1)]);
    end
    Hb=hist(Jb,xbinsb);
    Ha=hist(Ja,xbinsa);
    
    plot([0 xbinsb],[0 Hb/sum(Hb)/(xbinsb(2)-xbinsb(1))],'--','Color',Color)
    hold on
    plot([0 xbinsa],[0 Ha/sum(Ha)/(xbinsa(2)-xbinsa(1))],'Color',Color)
    legend('Before Osmoshock','After Osmoshock')
    xlim([0 300])
    xlabel('Lifetime')
    ylabel('Count')