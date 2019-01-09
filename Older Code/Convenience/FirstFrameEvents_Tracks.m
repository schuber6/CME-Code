function events=FirstFrameEvents_Tracks(tracks)
    
    events=[];
    for i=1:length(tracks)
        x=tracks(i).x(1);
        y=tracks(i).y(1);
        events=[events ; [1 x y]];
    end