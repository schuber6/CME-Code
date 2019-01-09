function [sxs,sys]=CalculateFramePSFsds(movie,events,frame,r)

    IM=imread(movie,'Index',frame);
    for i0=1:length(events(:,1))
        x=round(events(i0,2));
        y=round(events(i0,3));
        % x=93;  %Noise location
        % y=277;
        crop=CropEvent(x,y,IM,r);
        c = twoDgaussianFittingUnConstrained(crop);
        sxs(i0)=c(5);
        sys(i0)=c(6);
    end
