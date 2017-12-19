exp_name='E:\CME Superfolder\CME Data\171004_Beads_LinearExposure';

tmpd = dir(fullfile(exp_name,'*.tif'));

for i0=1:length(tmpd)
    trial(i0)=str2num(tmpd(i0).name(2))+1;
    exposure(i0)=str2num(tmpd(i0).name(1:end-4))-str2num(tmpd(i0).name(2:end-4));
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    IM{i0}=double(imread(movies{i0}));
    NIM{i0}=IM{i0}*4000/exposure(i0);
    VIM{i0}=reshape(NIM{i0},[1 512*512]);
    VIMsort{i0}=sort(VIM{i0},'descend');
    Med(i0)=median(VIM{i0});
    Men(i0)=mean(VIM{i0});
    
end
ind=1;
for i0=1:max(trial)
    used=find(trial==i0);
    for i=1:length(used)
        T=used(i);
    Results(ind,:)=[trial(T) exposure(T) Med(T) Men(T)];
    ind=ind+1;
    end
end