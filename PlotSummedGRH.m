xbins=-50:50;
xbins=xbins*.1/50;
SDsB=[];
SDsA=[];
[A,B]=size(Slopes);
for i=1:A
    SDsB=[SDsB ; sqrt(var(Slopes{i,1}))];
    SDsA=[SDsA ; sqrt(var(Slopes{i,2}))];
end
