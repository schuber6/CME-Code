function [Av,AC,Cv,MA,MAC]=ScatterMIntvsACRatio(fxycMS)

[fxycMSCohorts,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMS);
Ts=length(fxycMS(1,1,:));
ML=length(fxycMS(:,1,1));
LF=max(max(fxycMS(:,1,:)));
Ls=[];
AC=[];
Av=[];
Cv=[];
MA=[];
MC=[];
MAC=[];
ACc=cell(1,ML);
Cc=cell(1,ML);
Ac=cell(1,ML);
for i=1:Ts
    used=find(fxycMS(:,1,i));
    L=length(used);
    A=fxycMS(used,9,i)/MMM;
    C=fxycMS(used,6,i)/MMS;
    ACv=A./C;
    Mt=find(ACv==max(ACv));
    if ~isempty(Mt)
        MA=[MA A(Mt(1))];
        MC=[MC C(Mt(1))];
        MAC=[MAC ACv(Mt(1))];
        for i2=1:length(used)
            
            
            Ls=[Ls L];
            AC=[AC A(i2)/C(i2)];
            Av=[Av A(i2)];
            Cv=[Cv C(i2)];
        end
    end
end
figure
scatter(Av,AC)
figure
scatter(Av,Cv)
figure
scatter(MA,MAC)
