exp_name='E:\CME Superfolder\CME Data\Hydrogel\movies\MaxProj_ForTraCKer_NathanComp';
tmpd = dir(fullfile(exp_name,'*.mat'));
frame_rate=[5 3 5 5 4 4];
bkgrd=400;
for i=1:length(tmpd)
    
    i
    movies{i} = fullfile(exp_name,tmpd(i).name);
    load(movies{i})
    [Ints,Frames]=TraceINTtoInts(TraceINT);
    slopes = slope_finding(Ints,frame_rate(i),bkgrd);
    JOSH=CombineSlopes(slopes);
    Inlyers=find(JOSH>-.1 & JOSH<.1);
    SDs(i)=sqrt(var(JOSH(Inlyers)));
    
end