function [MIs,SIs,LTs]=ListAll3sByFrame(FXYCMS,MinL)
    %Returns all Master intensities, slave intensities, and lifetimes of
    %traces classified as 3s (only including parts of a trace where both
    %master and slave intensity >0) In cells where each slot of the cell
    %array corresponds to that frame of the movie. (LTs are in units of
    %frames)
    
    MF=MaxFrameFXYCMS(FXYCMS);
    MIs=cell(1,MF);
    SIs=cell(1,MF);
    LTs=cell(1,MF);
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        if fxyc(1,4)==3 && length(fxyc(:,1))>=MinL
            used=find(fxyc(:,6)>0 & fxyc(:,7)>0);
            LT=length(used);
            for i2=1:length(used)
                F=fxyc(used(i2),1);
                MI=fxyc(used(i2),6);
                SI=fxyc(used(i2),7);
                MIs{F}=[MIs{F} MI];
                SIs{F}=[SIs{F} SI];
                LTs{F}=[LTs{F} LT];
            end
        end
    end