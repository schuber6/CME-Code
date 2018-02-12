function [events,As]=ListAllTracesThresholded(fxyc,thresh,MinNum)

events=[];
As=[];
Pad=5;
F=MaxFrameFXYC(fxyc);
for i=1:length(fxyc(1,1,:))
    if length(find(fxyc(:,5,i)>=thresh))>=MinNum
        used=find(fxyc(:,1,i));
        LF=fxyc(used(end),1,i);
        for i2=1:max(used)
%             if i2==max(used)+1
%                 if fxyc(i2-1,1,i)~=F
%                     events=[events ; [fxyc(i2-1,1,i)+1 fxyc(i2-1,2,i) fxyc(i2-1,3,i)]];
%                     As=[As 0];
%                 end
%             else
%                 if i2==max(used)+2
%                     if fxyc(i2-2,1,i)<F-1
%                         events=[events ; [fxyc(i2-2,1,i)+2 fxyc(i2-2,2,i) fxyc(i2-2,3,i)]];
%                         As=[As 0];
%                     end
%                 else
                    events=[events ; [fxyc(i2,1,i) fxyc(i2,2,i) fxyc(i2,3,i)]];
                    As=[As fxyc(i2,5,i)];
                
        end
        for i2=1:min(F-LF,Pad)
            events=[events ; [fxyc(used(end),1,i)+i2 fxyc(used(end),2,i) fxyc(used(end),3,i)]];
            As=[As 0];
        end
    end
end