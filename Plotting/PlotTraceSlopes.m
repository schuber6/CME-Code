Traces=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if fxyc(1,4)==3 && length(fxyc(:,1))>=10
        Traces=[Traces i];
    end
end
[slopes,rsqs,LTs]=FindACSlopeOfTraces(FXYCMS,Traces);
% figure
% scatter(slopes,LTs)
MF=MaxFrameFXYCMS(FXYCMS);
FrameSlopes=cell(1,MF);
ind=1;
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if fxyc(1,4)==3 && length(fxyc(:,1))>=10
        S=slopes(ind);
        R=rsqs(ind);
        used=find(fxyc(:,6)>0 & fxyc(:,7)>0);
        frames=fxyc(used,1);
        for i2=1:length(frames)
            FrameSlopes{frames(i2)}=[FrameSlopes{frames(i2)} S];
        end
        ind=ind+1;
    end
end

MS=StatCell(FrameSlopes,'median');
figure
plot(MS)