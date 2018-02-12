function [L,events]=ListAllSteps(fxyc)
%Look for step intensity profiles, where intensity is approximately
%constant for 2 frames, then decreases for 2 frames to a value less than
%half of the constant, and stays there for at least 1 frame
%L(1)=trace index
%L(2)=time index of start
%L(3)=intensity drop
%L(4)=low intensity
%L(5)=high intensity
L=[];
events=[];
n=0;
constErr=.3;
for i=1:length(fxyc(1,1,:))
    used=find(fxyc(:,1,i));
    for i2=1:length(used)-4
        P1=abs(fxyc(i2,5,i)-fxyc(i2+1,5,i));
        P2=abs(fxyc(i2+3,5,i)-fxyc(i2+4,5,i));
        P1m=(fxyc(i2,5,i)+fxyc(i2+1,5,i))/2;
        P2m=(fxyc(i2+3,5,i)+fxyc(i2+4,5,i))/2;
        M=fxyc(i2+2,5,i);
        if P1<=P1m*constErr && P2<=P1m*constErr && M<=P1m && M>=P2m && P2m*2<P1m
            Lt=[i i2 P2m-P1m P2m P1m];
            L=[L ; Lt];
            for i3=0:4
            events=[events ; [fxyc(i2+i3,1,i) fxyc(i2+i3,2,i) fxyc(i2+i3,3,i)]];
            end
            %n=n+1;
        end
        %n=n+1;
    end
end