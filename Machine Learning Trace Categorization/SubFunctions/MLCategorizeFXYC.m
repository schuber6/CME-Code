function [ML,F1]=MLCategorizeFXYC(file,movie,framegap)

load(file)
ML=Threshfxyc(1,4,:);
F1=zeros(1,length(ML));
[C,B,E,F,Data]=ClassifyTraces(file,movie);
for i=1:length(Data)
    t=Data(i).T;
    ML(t)=C(i);
    F1(t)=F(i);
end
