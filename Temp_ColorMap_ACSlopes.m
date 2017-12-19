clear all
exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
%exp_name='E:\CME Superfolder\CME Data\170520_AP2CLCA_SingleStackOsmo\170520_Analysis\movies';
omd=fullfile(exp_name);
    SM=strcat('*medB.mat');
    
    tmpdm = dir(fullfile(omd,SM));
    
    
    for i=1:length(tmpdm)
        %subplot(3,ceil(length(tmpdm)/3),i)
        moviesM{i} = fullfile(omd,tmpdm(i).name);
        load(moviesM{i})
        [GoodData,BadData]=PullTraceData_BestCorr_Locations(fxycMS,.5,0);
        xs=GoodData(:,8);
        ys=GoodData(:,9);
        ZG=1./log(GoodData(:,4));
        used=find(ZG>-3 & ZG<2);
        med=
        ZG2=AvOfNearestN(xs(used),ys(used),ZG(used),1,1);
        figure('units','normalized','outerposition',[0 0 1 1])
        colormap jet
        h=pcolor(ZG2);
        set(h, 'EdgeColor', 'none');
        colorbar
        title(strcat('AP2: ',tmpdm(i).name))
    end
    
    exp_name='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies';
%exp_name='E:\CME Superfolder\CME Data\170520_AP2CLCA_SingleStackOsmo\170520_Analysis\movies';
omd=fullfile(exp_name);
rbins=1:50;
rbins=rbins/50*5;
ZzC=cell(1,5);

    SM=strcat('*medB.mat');
    
    tmpdm = dir(fullfile(omd,SM));
    
    
    for i=1:length(tmpdm)
        %subplot(3,ceil(length(tmpdm)/3),i)
        moviesM{i} = fullfile(omd,tmpdm(i).name);
        load(moviesM{i})
        [GoodData,BadData]=PullTraceData_BestCorr_Locations(fxycMS,.5,0);
        xs=GoodData(:,8);
        ys=GoodData(:,9);
        ZG=1./log(GoodData(:,4));
        used=find(ZG>-3 & ZG<2);
        
        ZG2=AvOfNearestN(xs(used),ys(used),ZG(used),1,1);
        figure('units','normalized','outerposition',[0 0 1 1])
        colormap jet
        h=pcolor(ZG2);
        set(h, 'EdgeColor', 'none');
        colorbar
        title(strcat('CALM: ',tmpdm(i).name))
    end