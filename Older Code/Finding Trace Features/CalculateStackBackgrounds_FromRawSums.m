function MB2=CalculateStackBackgrounds_FromRawSums(nstaF)

backs=cell(1,8);
for i=1:length(nstaF)
    for i2=1:8
        backs{i2}=[backs{i2} ; nstaF(i).RawSums(:,i2)];
    end
end
xbins=1:100;
xbins=xbins*10000/100;
for i=1:8
    %subplot(2,4,i)
    %hist(backs{i},xbins);
    H{i}=hist(backs{i},xbins);
    MB(i)=median(backs{i});
    m=find(H{i}==max(H{i}(1:end-1)));
    MB2(i)=xbins(m);
end