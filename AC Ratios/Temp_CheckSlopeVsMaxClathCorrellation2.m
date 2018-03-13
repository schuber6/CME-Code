
exp_name='E:\CME Superfolder\CME Data\SinlgeGFP\AP2CALM_FXYCMS';

%Good=[15 16 17 18]; %Best DNM cells

[paths,files]=FindFiles_Full(exp_name,'*.mat');

NA=0;
NC=0;

for i=1:length(paths) %4:7 %1:length(tmpd)
    if strcmp(files{i}(1:3),'ap2')
        protein='AP2';
        NA=NA+1;
        figure(1)
        N=NA;
    end
    if strcmp(files{i}(1:3),'sum')
        protein='CALM';
        NC=NC+1;
        figure(2)
        N=NC;
    end
    subplot(1,3,N)

    load(paths{i});

    Traces=[];
    MaxClath=[];
    MaxAdapt=[];
    LTs=[];
    for i2=1:length(FXYCMS)
        fxyc=FXYCMS{i2};
        if fxyc(1,4)==3 && length(fxyc(:,1))>=10 %&& max(fxyc(:,1))<60
            Traces=[Traces i2];
            MaxClath=[MaxClath max(fxyc(:,7))];
            MaxAdapt=[MaxAdapt max(fxyc(:,6))];
            LTs=[LTs length(fxyc(:,1))];
        end
    end
    scatter(LTs*3,MaxAdapt/(18400/80))
    hold on
    xlabel('Lifetime (s)')
    ylabel(strcat('Max Number of ',protein,'s'))
end