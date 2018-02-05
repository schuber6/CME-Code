omd = fullfile(exp_name,'orig_movies');
tmpd = dir(fullfile(omd,'*.mat'));
SDs=zeros(1,length(tmpd));
Js=cell(1,length(tmpd));
for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    load(movies{i});
    [J,SD]=FindJoshSlopes(Threshfxyc);
    Js{i}=J;
    SDs(i)=SD;
end
