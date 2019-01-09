[F,~,N]=size(Threshfxyc);
Frames=max(max(Threshfxyc(:,1,:)));
Bursts=zeros(1,Frames);
for i=1:F
for j=1:N
if Threshfxyc(i,4,j)==3 || Threshfxyc(i,4,j)==5 || Threshfxyc(i,4,j)==6
Bursts(Threshfxyc(i,1,j))=Bursts(Threshfxyc(i,1,j))+1;
end
end
end

%%

[F,~,N]=size(Threshfxyc);
BurstsLT=[];

for j=1:N
if Threshfxyc(1,4,j)==3 && max(Threshfxyc(:,5,j))>=500
    LT=length(find(Threshfxyc(:,1,j)));
    BurstsLT=[BurstsLT LT];
end
end

%%

[F,~,N]=size(Threshfxyc);
Frames=max(max(Threshfxyc(:,1,:)));
Conclusions=zeros(1,Frames);

for j=1:N
    C=find(Threshfxyc(:,1,j),1,'last');
if Threshfxyc(1,4,j)==3 ||  Threshfxyc(1,4,j)==6 ||  Threshfxyc(1,4,j)==2
Conclusions(Threshfxyc(C,1,j))=Conclusions(Threshfxyc(C,1,j))+1;
end

end

%%

[F,~,N]=size(Threshfxyc);
T=400;
Frames=max(max(Threshfxyc(:,1,:)));
Peaks=zeros(1,Frames);
events=[];
for j=1:N
    if max(Threshfxyc(:,5,j))>0
    C=find(Threshfxyc(:,5,j)==max(Threshfxyc(:,5,j)));
    if (Threshfxyc(1,4,j)==3 ||  Threshfxyc(1,4,j)==6) && max(Threshfxyc(:,5,j))>=T
        Peaks(Threshfxyc(C(length(C)),1,j))=Peaks(Threshfxyc(C(length(C)),1,j))+1;
        events=[events;[Threshfxyc(C(length(C)),1,j) Threshfxyc(C(length(C)),2,j) Threshfxyc(C(length(C)),3,j)]];
    end
    end
end

%%
window=10;
PeaksA=zeros(1,length(Peaks)-window);
for i=1:length(Peaks)-window
    for i2=1:window
        PeaksA(i)=PeaksA(i)+Peaks(i+i2);
    end
end

%%
[F,~,N]=size(Threshfxyc);
T=500;
Frames=max(max(Threshfxyc(:,1,:)));
ExLifetimes=cell(1,Frames);
MeanLifetime=zeros(1,Frames);
for i=1:N
    if Threshfxyc(1,4,i)==3 && max(Threshfxyc(:,5,i))>=500
        used=find(Threshfxyc(:,1,i));
        LT=length(used);
        for i2=1:length(used)
        ExLifetimes{Threshfxyc(used(i2),1,i)}=[ExLifetimes{Threshfxyc(used(i2),1,i)} LT];
        end
    end
end
for i=1:Frames
    if ~isempty(ExLifetimes{i})
    MeanLifetime(i)=mean(ExLifetimes{i});
    end
end

