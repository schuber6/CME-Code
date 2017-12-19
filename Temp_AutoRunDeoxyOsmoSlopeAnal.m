clear SD Fra
ind=1;
exp_name='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies';
i=3;
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.mat'));
namesOsmo{ind}=fullfile(omd,tmpd(i).name);
ind=ind+1;
exp_name='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies';
i=25;
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.mat'));
namesOsmo{ind}=fullfile(omd,tmpd(i).name);
ind=ind+1;
i=24;
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.mat'));
namesOsmo{ind}=fullfile(omd,tmpd(i).name);
ind=ind+1;

exp_name='E:\CME Superfolder\CME Data\170613_Deoxy\170613_Deoxy_Analysis\orig_movies';
omd=fullfile(exp_name);
tmpdDeoxy = dir(fullfile(omd,'*.mat'));

BeforeSlopesOsmo=[];
AfterSlopesOsmo=[];
for i=1:length(namesOsmo)
    
    load(namesOsmo{i})
    fxyc_struct = fxyc_to_struct(Threshfxyc,false);
    fxyc_struct = slope_finding(fxyc_struct,3,400);
    M=MaxFrameFXYCS(fxyc_struct);
    NW=ceil(M/BinSpacing);
    for i2=1:NW
        starter=(i2-1)*BinSpacing+1;
        finish=starter+WindowF;
        if finish<=M
        SD(i,i2)=FindJSSDinTimeWindow_ClassRestricted(fxyc_struct,starter,finish);
        Fra(i,i2)=finish;

        end
    end
    if i==1
        [SDb,Slopes]=ListJoshSlopesInRange(fxyc_struct,0,54);
        BeforeSlopesOsmo=[BeforeSlopesOsmo ; Slopes];
        [SDa,Slopes]=ListJoshSlopesInRange(fxyc_struct,66,120);
        AfterSlopesOsmo=[AfterSlopesOsmo ; Slopes];
    else
        [SDb,Slopes]=ListJoshSlopesInRange(fxyc_struct,0,90);
        BeforeSlopesOsmo=[BeforeSlopesOsmo ; Slopes];
        [SDa,Slopes]=ListJoshSlopesInRange(fxyc_struct,110,200);
        AfterSlopesOsmo=[AfterSlopesOsmo ; Slopes];
    end
end

BeforeSlopesDeoxy=[];
AfterSlopesDeoxy=[];
for i=[2 4 6]
    tmpd=tmpdDeoxy;
    load(fullfile(omd,tmpd(i).name))
    fxyc_struct = fxyc_to_struct(Threshfxyc,false);
    fxyc_struct = slope_finding(fxyc_struct,3,400);
    M=MaxFrameFXYCS(fxyc_struct);
    NW=ceil(M/BinSpacing);
    for i2=1:NW
        starter=(i2-1)*BinSpacing+1;
        finish=starter+WindowF;
        if finish<=M
        SD(i+3,i2)=FindJSSDinTimeWindow_ClassRestricted(fxyc_struct,starter,finish);
        Fra(i+3,i2)=finish;

        end
    end
    [SDb,Slopes]=ListJoshSlopesInRange(fxyc_struct,0,90);
    BeforeSlopesDeoxy=[BeforeSlopesDeoxy ; Slopes];
    [SDa,Slopes]=ListJoshSlopesInRange(fxyc_struct,110,200);
    AfterSlopesDeoxy=[AfterSlopesDeoxy ; Slopes];
end