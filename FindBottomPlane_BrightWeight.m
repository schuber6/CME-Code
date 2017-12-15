function [WMbp,wme,Mlist]=FindBottomPlane_BrightWeight(movie,planes)
%Finds bottom plane based on: Intensity change std, Intensity change mean,
%Highest Intensity
FullPlanes=floor(length(imfinfo(movie))/planes);
Sbp=zeros(1,FullPlanes);
Mbp=zeros(1,FullPlanes);
Ibp=zeros(1,FullPlanes);
[~,wme]=HistPlaneMultiplications_BrightWeight(movie);
Mlist=zeros(FullPlanes,planes-1);
for i=1:FullPlanes
    for i2=1:planes-1
        %stdi(i2)=std((i-1)*planes+i2);
        
        
        wmei(i2)=wme((i-1)*planes+i2);
        Mlist(i,i2)=wme((i-1)*planes+i2);
    end
    %Sbp(i)=find(stdi==max(stdi),1,'first');
    
    M=find(wmei==max(wmei),1,'first');
    if M==planes-1
        WMbp(i)=planes-1;
    else
        if M==1
            WMbp(i)=1;
        else
            below=wmei(M-1);
            above=wmei(M+1);
            on=wmei(M);
            offset=min([below above on]);
            below=below-offset;
            above=above-offset;
            on=on-offset;
            WMbp(i)=(below*1+on*2+above*3)/(below+on+above)+M-2; %Use center of mass to extend maximum plane into a continuous function
        end
    end
end
    