%Calibrated for sum intensities right now--change % lines to fix

AP2=1:20;
AP2=AP2/20*30000; %
Bins=AP2(2)-AP2(1);

for i=1:20
    
    CLTA=1:40;
    CLTA=CLTA/40*50000; %
    used=find(MS<=AP2(i) & MS>AP2(i)-Bins); %
    subplot(4,5,i)
    hist(SS(used),CLTA) %
    if ~isempty(used)
    H=hist(SS(used),CLTA); %
    M(i)=CLTA(find(H==max(H),1,'first'));
    end
end