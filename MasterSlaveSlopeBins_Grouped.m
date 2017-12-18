AfterMSslopeGc=[];
AfterMSslopeGo=[];
AMvLGc=cell(1,5);
AMvLGo=cell(1,5);
AMvLGc1=cell(1,5);
AMvLGo2=cell(1,5);
AMvLGc2=cell(1,5);
AMvLGo3=cell(1,5);
AMvLGc3=cell(1,5);
AMvLGo4=cell(1,5);
AMvLGo1=cell(1,5);

load('E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o1t\orig_movies\M2S1D.mat')
MSDfe=MSD;
MSDtoSlopes;
TabulateMSslopes2section;
BinMSslopesGen2section;
AfterMSslopeGo=[AfterMSslopeGo ; AfterMSslope];
AfterMSslopeo1=AfterMSslope;
Norm=median(AfterMSslope(:,4));
for i=1:5
    AMvLGo{i}=[AMvLGo{i} AMvL{i}/Norm];
    AMvLGo1{i}=[AMvLGo1{i} AMvL{i}];
end

load('E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\M2S1D.mat')
MSDfe=MSD;
MSDtoSlopes;
TabulateMSslopes2section;
BinMSslopesGen2section;
AfterMSslopeGo=[AfterMSslopeGo ; AfterMSslope];
Norm=median(AfterMSslope(:,4));
AfterMSslopeo2=AfterMSslope;
for i=1:5
    AMvLGo{i}=[AMvLGo{i} AMvL{i}/Norm];
    AMvLGo2{i}=[AMvLGo2{i} AMvL{i}];
end

load('E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o3t\orig_movies\M2S1D.mat')
MSDfe=MSD;
MSDtoSlopes;
TabulateMSslopes2section;
BinMSslopesGen2section;
AfterMSslopeGo=[AfterMSslopeGo ; AfterMSslope];
Norm=median(AfterMSslope(:,4));
AfterMSslopeo3=AfterMSslope;
for i=1:5
    AMvLGo{i}=[AMvLGo{i} AMvL{i}/Norm];
    AMvLGo3{i}=[AMvLGo3{i} AMvL{i}];
end

load('E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o4t\orig_movies\M2S1D.mat')
MSDfe=MSD;
MSDtoSlopes;
TabulateMSslopes2section;
BinMSslopesGen2section;
AfterMSslopeGo=[AfterMSslopeGo ; AfterMSslope];
Norm=median(AfterMSslope(:,4));
AfterMSslopeo4=AfterMSslope;
for i=1:5
    AMvLGo{i}=[AMvLGo{i} AMvL{i}/Norm];
    AMvLGo4{i}=[AMvLGo4{i} AMvL{i}];
end

load('E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\M2S1D.mat')
MSDfe=MSD;
MSDtoSlopes;
TabulateMSslopes2section;
BinMSslopesGen2section;
AfterMSslopeGc=[AfterMSslopeGc ; AfterMSslope];
Norm=median(AfterMSslope(:,4));
AfterMSslopec1=AfterMSslope;
for i=1:5
    AMvLGc{i}=[AMvLGc{i} AMvL{i}/Norm];
    AMvLGc1{i}=[AMvLGc1{i} AMvL{i}];
end

load('E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1003\orig_movies\M2S1D.mat')
MSDfe=MSD;
MSDtoSlopes;
TabulateMSslopes2section;
BinMSslopesGen2section;
AfterMSslopeGc=[AfterMSslopeGc ; AfterMSslope];
Norm=median(AfterMSslope(:,4));
AfterMSslopec2=AfterMSslope;
for i=1:5
    AMvLGc{i}=[AMvLGc{i} AMvL{i}/Norm];
    AMvLGc2{i}=[AMvLGc2{i} AMvL{i}];
end

load('E:\CME Superfolder\CME Data\Hydrogel\movies\control_2\orig_movies\M2S1D.mat')
MSDfe=MSD;
MSDtoSlopes;
TabulateMSslopes2section;
BinMSslopesGen2section;
AfterMSslopeGc=[AfterMSslopeGc ; AfterMSslope];
Norm=median(AfterMSslope(:,4));
AfterMSslopec3=AfterMSslope;
for i=1:5
    AMvLGc{i}=[AMvLGc{i} AMvL{i}/Norm];
    AMvLGc3{i}=[AMvLGc3{i} AMvL{i}];
end

[MC,SEC]=PlotJSHwBinValues_1section_F(E,xbins,AfterMSslopeGc,AMvLGc,'Control')
figure
[Mo,SEo]=PlotJSHwBinValues_1section_F(E,xbins,AfterMSslopeGo,AMvLGo,'Osmoshock 80% Water')
PlotMVhists(AMvLGc,AMvLGo)