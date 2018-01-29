function maxs=HistMaxInts(Threshfxyc,plt)

used=find(Threshfxyc(1,4,:)==3);
maxs=[];
for i=1:length(used)
    used2=find(Threshfxyc(:,1,used(i)));
    
    if length(used)>=10
        maxs=[maxs max(Threshfxyc(:,5,used(i)))];
    end
end
if plt
hist(maxs,50)
xlim([0 6000])
xlabel('Max Intensity')
ylabel('Count')
end
% top=prctile(maxs,50);
% title(strcat('50th percentile=',num2str(top)))