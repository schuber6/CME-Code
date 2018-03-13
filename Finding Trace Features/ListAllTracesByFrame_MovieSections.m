function [MIs,SIs,LTs]=ListAllTracesByFrame_MovieSections(FXYCMS,MinL,Dividers)
    %Returns all Master intensities, slave intensities, and lifetimes of
    %traces classified as 3s (only including parts of a trace where both
    %master and slave intensity >0) In cells where each slot of the cell
    %array corresponds to that frame of the movie. (LTs are in units of
    %frames)
    %Will only include Parts of traces entirely between max(Dividers) and
    %min(Dividers) that don't exist across any Dividers frames
    %Lifetime is going to underestimate lifetime a lot because I'm not
    %checking for full traces
    
    MF=MaxFrameFXYCMS(FXYCMS);
    MIs=cell(1,MF);
    SIs=cell(1,MF);
    LTs=cell(1,MF);
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        frames=fxyc(:,1);
        Bot=find(Dividers<min(frames),1,'last');
        Top=find(Dividers>max(frames),1,'first');
        for i3=1:length(Bot)
            if Bot(i3)~=length(Dividers)
                usedS=find(frames>Dividers(Bot(i3)) & frames<Dividers(Bot(i3)+1)); 
                if fxyc(1,4)~=4 && length(usedS)>=MinL
                    fxycS=fxyc(usedS,:);
                    used=find(fxycS(:,6)>0 & fxycS(:,7)>0);
                    LT=length(used);
                    for i2=1:length(used)
                        F=fxycS(used(i2),1);
                        MI=fxycS(used(i2),6);
                        SI=fxycS(used(i2),7);
                        MIs{F}=[MIs{F} MI];
                        SIs{F}=[SIs{F} SI];
                        LTs{F}=[LTs{F} LT];
                    end
                end
            end
        end
    end