SI=[];
for i=1:length(FXYCMS)
    S=FXYCMS{i}(:,7);
    used=find(S>10^4);
    S=S(used);
    for i2=1:length(S)-1
        SI=[SI ; [S(i2) S(i2+1)-S(i2)]];
    end
end
figure
scatter(SI(:,1),SI(:,2))
MI=[];
for i=1:length(FXYCMS)
    M=FXYCMS{i}(:,6);
    used=find(M>10^4);
    M=M(used);
    for i2=1:length(M)-1
        MI=[MI ; [M(i2) M(i2+1)-M(i2)]];
    end
end
figure
scatter(MI(:,1),MI(:,2))