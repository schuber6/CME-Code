function [Frames,Slope,rsq,Leng]=IdentifyLifteringPortion(Trace)

for i=1:length(Trace)-1
    Jumps(i)=Trace(i+1)-Trace(i);
end
J=find(Jumps==max(Jumps));

found=0;
Jd=J-1;
while ~found
    
    if Jd==0 || Jumps(Jd)<=0
        found=true;
        Jd=Jd+1;
        break
    end
    Jd=Jd-1;
end

found=0;
Ju=J+1;
while ~found
    
    if Ju>length(Jumps) || Jumps(Ju)<=0
        found=true;
        Ju=Ju-1;
        break
    end
    Ju=Ju+1;
end
Frames=Jd:Ju+1;
ST=Trace(Frames);
[Slope, intercept, rsq]=LinearSlopeInterceptandR2(Frames,Trace(Frames).');
Leng=length(Frames);
% plot(Trace)
% hold on
% YL=ylim;
% line([Jd Jd],YL)
% line([Ju+1 Ju+1],YL)