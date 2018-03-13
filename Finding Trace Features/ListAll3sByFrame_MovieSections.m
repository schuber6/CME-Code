function [MIs,SIs,LTs,varargout]=ListAll3sByFrame_MovieSections(FXYCMS,MinL,Dividers)
    %Returns all Master intensities, slave intensities, and lifetimes of
    %traces classified as 3s (only including parts of a trace where both
    %master and slave intensity >0) In cells where each slot of the cell
    %array corresponds to that frame of the movie. (LTs are in units of
    %frames)
    %Will only include traces entirely between max(Dividers) and
    %min(Dividers) that don't exist across any Dividers frames
    
    MF=MaxFrameFXYCMS(FXYCMS);
    MIs=cell(1,MF);
    SIs=cell(1,MF);
    LTs=cell(1,MF);
    LTvect=cell(1,2);
    IndVect=cell(1,2);
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        frames=fxyc(:,1);
        if fxyc(1,4)==3 && length(fxyc(:,1))>=MinL
            Bot=find(Dividers<min(frames),1,'last');
            Top=find(Dividers>max(frames),1,'first');
            if ~isempty(Bot) && ~isempty(Top) && Top==Bot+1
                used=find(fxyc(:,6)>0 & fxyc(:,7)>0);
                LT=length(used);
                LTvect{Bot}=[LTvect{Bot} LT];
                IndVect{Bot}=[IndVect{Bot} i];
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
    end
    varargout{1}=LTvect;
    varargout{2}=IndVect;