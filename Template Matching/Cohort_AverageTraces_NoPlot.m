NumCohorts=6; %Makes equally spaced and sized cohorts with minimum of smallest=30 and max of largest=150
FrameRate=3;
Edges=20:(120/NumCohorts):140;

Cohs=zeros(1,length(ManI3));
for i=1:length(ManI3)
    LT=length(ManI3{i});
    for i2=1:length(Edges)-1
        if LT>=Edges(i2)/FrameRate && LT<Edges(i2+1)/FrameRate
            Cohs(i)=i2;
            break
        end
    end

end

L=cell(1,NumCohorts);
SCell=cell(1,NumCohorts);
Maxs=cell(1,NumCohorts);
for i=1:NumCohorts
    [SCell{i},Maxs{i}]=ScottifyTraces(ManI3,find(Cohs==i),mean([Edges(i) Edges(i+1)]));
    Maxs{i}=Maxs{i}/(18400/80);
    CMeanSH=StatCell(SCell{i},'mean_assumezeros');
end
