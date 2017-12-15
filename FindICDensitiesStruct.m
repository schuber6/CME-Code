function [I,C]=FindICDensitiesStruct(fxycS,start,finish,framegap,A)

[Init,Conc]=ICvsFrameStruct(fxycS);


In=sum(Init(start:finish)./A(start:finish));
Cn=sum(Conc(start:finish)./A(start:finish));

I=In/((finish-start+1)/framegap); %Answer in #/s*um^2
C=Cn/((finish-start+1)/framegap);
    