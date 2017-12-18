N=length(TraceX(:,1));
M=zeros(1,length(TraceX(:,1)));
for i=1:length(TraceX(:,1))
    M(i)=max(TraceINT(i,:));
end
Bri=sort(M,'descend');
for i=1:25
    subplot(5,5,i)
    T=find(M==Bri(i));
    used=find(TraceINT(T(1),:)>0);
    plot(TraceINT(T(1),used)/max(TraceINT(T(1),:)),'r')
    hold on
    plot(TraceZ(T(1),used),'b')
end