omd = fullfile(exp_name,'orig_movies');
tmpd = dir(fullfile(omd,'*.mat'));
SDs=zeros(1,length(tmpd));
Js=cell(1,length(tmpd));
for i=2:2
    movies{i} = fullfile(omd,tmpd(i).name);
    load(movies{i});
    F=max(max(Threshfxyc(:,1,:)));
    for i2=1:F-8
        ThreshfxycT=Trimfxyc9Frame(Threshfxyc,i2);
        [J,SD]=FindJoshSlopes(ThreshfxycT);
        Js{i2}=J;
        SDs(i2)=SD;
    end
end
