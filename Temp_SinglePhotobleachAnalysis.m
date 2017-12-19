clear all
exp_name='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies';

omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.mat'));
xbins=1:20;
xbins=xbins/20*10000;
figure
for i=2:5 %length(tmpd)
    subplot(1,4,i-1)
    load(fullfile(omd,tmpd(i).name));
    [L,events]=ListAllSteps(Threshfxyc);
    hist(-L(:,3),xbins)
    I(i)=median(L(:,3));
    Imean(i)=mean(L(:,3));
    BI(i)=median(L(:,5));
end

    