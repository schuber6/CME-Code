clear all
exp_name='E:\CME Superfolder\CME Data\171004_Beads_LinearExposure';

tmpd = dir(fullfile(exp_name,'*.mat'));
XY=cell(1,length(tmpd));
A=cell(1,length(tmpd));
for i0=1:length(tmpd)    
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0})
    FXYCs{i0}=Threshfxyc;
    for i=1:length(Threshfxyc(1,1,:))
        XY{i0}=[XY{i0} ; [Threshfxyc(1,2,i) Threshfxyc(1,3,i)]];
        A{i0}=[A{i0} ; Threshfxyc(1,5,i)];
    end
    trial(i0)=str2num(tmpd(i0).name(2))+1;
    exposure(i0)=str2num(tmpd(i0).name(1:end-4))-str2num(tmpd(i0).name(2:end-4));
end
for i0=3:max(trial)
    first=find(exposure==100 & trial==i0);
    used=find(trial==i0);
    for i=1:length(used)
        Pairs=FindPairs(XY{first},XY{used(i)});
        
        I{i0}(i,:)=A{used(i)}(Pairs(:,2)).';
        exposureC{i0}(i)=exposure(used(i));
    end
    PlotIntensityVSExposure(I{i0},exposureC{i0})
end
