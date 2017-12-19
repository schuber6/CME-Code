function Zs=ZScores(ACs,ACsI)

num=0;
me=mean(ACs);
sd=sqrt(var(ACs));
mi=5;
for i=1:length(ACsI)
    D=ACsI{i};
    if length(D)>=mi
        num=num+1;
        Zs(num)=(mean(D)-me)/sd*sqrt(length(D));
    end
end