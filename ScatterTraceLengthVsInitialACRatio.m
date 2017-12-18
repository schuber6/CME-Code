function ACc=ScatterTraceLengthVsInitialACRatio(fxycMS)

Beg=3;

[fxycMSCohorts,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMS);
Ts=length(fxycMS(1,1,:));
ML=length(fxycMS(:,1,1));
LF=max(max(fxycMS(:,1,:)));
Ls=[];
AC=[];
ACc=cell(1,ML);
Cc=cell(1,ML);
Ac=cell(1,ML);
for i=1:Ts
    used=find(fxycMS(:,1,i));
    L=length(used);
    if fxycMS(used(1),1,i)~=1 && fxycMS(used(end),1,i)~=LF && L>=Beg
        
        A=fxycMS(used,9,i)/MMM;
        C=fxycMS(used,6,i)/MMS;
        Ls=[Ls L];
        AC=[AC mean(A(1:Beg))/mean(C(1:Beg))];
        ACc{L}=[ACc{L} mean(A(1:Beg))/mean(C(1:Beg))];
        Cc{L}=[Cc{L} mean(C(1:Beg))];
        Ac{L}=[Ac{L} mean(A(1:Beg))];
    end
end
for i=1:length(ACc)
    if ~isempty(ACc{i})
        MAC(i)=mean(ACc{i});
        MdAC(i)=median(ACc{i});
        N(i)=length(find(ACc{i}<.8))/length(ACc{i});
        C(i)=mean(Cc{i});
        A(i)=mean(Ac{i});
    else
        MAC(i)=0;
        MdAC(i)=0;
        N(i)=0;
        C(i)=0;
        A(i)=0;
    end
end
figure
scatter(Ls,AC)
figure
plot(MAC,'r')
hold on
plot(MdAC,'b')
xlim([0 40])
ylim([0 2])
figure
plot(N)
xlim([0 40])
figure
plot(C,'r')
hold on
plot(A,'g')
xlim([0 40])