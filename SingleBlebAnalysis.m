function [Area,Pits,Frame]=SingleBlebAnalysis(NBlebMask,Threshfxyc)

Area=[];
Pits=[];
Frame=[];
h=waitbar(0,'Analyzing Single Blebs');
for i=1:length(NBlebMask(1,1,:))
    waitbar(i/length(NBlebMask(1,1,:)))
    XY=FindPresent356s(Threshfxyc,i+1);
    NB=max(max(NBlebMask(:,:,i)));
    AreaF=[];
    PitsF=zeros(1,NB);
    FrameF=zeros(1,NB)+i+1;
    for i2=1:NB
        
        AreaF=[AreaF length(find(NBlebMask(:,:,i)==i2))];
        
    end
    for i2=1:length(XY(:,1))
        Bleb=NBlebMask(XY(i2,2),XY(i2,1),i);
        if Bleb>0
            PitsF(Bleb)=PitsF(Bleb)+1;
        end
    end
    Area=[Area AreaF];
    Pits=[Pits PitsF];
    Frame=[Frame FrameF];
end
close(h)