function [SDx,SDy]=FindTrackSDs(tracks,Good)
    
    for i=1:length(Good)
        SDx(i)=sqrt(var(tracks(Good(i)).x));
        SDy(i)=sqrt(var(tracks(Good(i)).y));
    end
    SDx(isnan(SDx)) = [];
    SDy(isnan(SDy)) = [];