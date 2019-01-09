inds=[];
for i=1:length(FXYCMSg)
    if FXYCMSg{i}(1,4)==3
        inds=[inds i];
    end
end

Ms=ismember(inds,Matches(:,1));

h=waitbar(0,'Checking Traces');
for i=1:length(inds)
    waitbar(i/length(inds))
    T1=inds(i);
    Mi=find(Matches(:,1)==T1);
    if ~isempty(Mi)
        T2=Matches(Mi,2);
        fxyc1=FXYCMSg{T1};
        fxyc2=FXYCMSr{T2};
        [p(i),FPp(i)]=PercentMatch(fxyc1,fxyc2);
    else
        p(i)=0;
        FPp(i)=1;
    end
end
close(h)

%%

figure
subplot(1,2,1)
hist(p,50)
subplot(1,2,2)
hist(FPp,50)

%%

figure
scatter(p,FPp)