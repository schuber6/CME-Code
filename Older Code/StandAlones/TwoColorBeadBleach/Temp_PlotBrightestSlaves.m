for i=1:length(FXYCMS)
    MR(i)=max(FXYCMS{i}(:,7));
end
SR=sort(MR,'descend');
FSFig
for i=1:25
    subplot(5,5,i)
%     R=ceil(rand*length(FXYCMS));
    R=find(MR==SR(i));
    plot(FXYCMS{R}(:,6)/max(FXYCMS{R}(:,6)),'g')
    hold on
    plot(FXYCMS{R}(:,7)/max(FXYCMS{R}(:,7)),'r')
end