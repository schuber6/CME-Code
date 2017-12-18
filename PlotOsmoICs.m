exp_name='E:\CME Superfolder\CME Data\Esra Movies 2';
tmpd = dir(fullfile(exp_name,'*.mat'));

xbins=-50:50;
xbins=xbins*.1/50;
WindowSize=100;
for i0=1:length(tmpd)
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0});
    M=maxframeNSTA(NSTA);
    SPicy=ceil(sqrt(floor(M/WindowSize)));
    
for Window=1:2
    if Window==1
    W2=Window;
    else
        W2=2.5;
    end
    beg=(W2-1)*WindowSize;
    fin=W2*WindowSize;
    A356=ConvexHullAreasNSTA(NSTA);
    [Init,Conc]=ICvsFrameNSTA(NSTA);
    used=nonzeros(beg:min(fin,length(A356)));
    I{i0,Window}=sum(Init(used))/sum(A356(used));
    C{i0,Window}=sum(Conc(used))/sum(A356(used));
    
    
end

end
filename='E:\CME Superfolder\CME Data\170321_EzraSUMOsmoshockStacks\EzraOsmoshockNSTA_2.mat';
load(filename)
for i0=9:12
    NSTA=nsta{i0-8};
    for Window=1:2
    if Window==1
    W2=Window;
    else
        W2=2.5;
    end
    if Window==2 && i0==12
        W2=2;
    end
    beg=(W2-1)*WindowSize;
    fin=W2*WindowSize;
    A356=ConvexHullAreasNSTA(NSTA);
    [Init,Conc]=ICvsFrameNSTA(NSTA);
    used=nonzeros(beg:min(fin,length(A356)));
    I{i0,Window}=sum(Init(used))/sum(A356(used));
    C{i0,Window}=sum(Conc(used))/sum(A356(used));
    
end

end