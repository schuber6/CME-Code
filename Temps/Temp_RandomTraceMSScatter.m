clear all
exp_name='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies';
%SlaveFolder='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo';
%SlaveFolder='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies';
%exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*medB.mat'));
usedc=[2 3 5 6 7 9 10];
CutoffR=.6;
%load('E:\CME Superfolder\CME Data\170906_Analysis\orig_movies\005_GFP_BS_fxycMS_prev_medB.mat')
%load('E:\CME Superfolder\CME Data\170906_Analysis\orig_movies\005_osmo_GFP_BS_fxycMS_prev_medB.mat')
for i0=7:7 %length(usedc)
    clear slopeB slopeE interceptB interceptE rsqB rsqE
    i00=usedc(i0);
    movies{i00} = fullfile(omd,tmpd(i00).name);
    fileFXYC{i00}=strcat(movies{i00}(1:end-4),'.mat');
    
    load(fileFXYC{i00})
    figure
    N=length(fxycMS(1,1,:));
    for i=1:9
        subplot(3,3,i)
        found=0;
        while ~found
            T=ceil(rand*N);
            X=nonzeros(fxycMS(:,9,T));
            Y=nonzeros(fxycMS(:,6,T));
            if max(X)>200 && max(Y)>200 && length(X)>=10
                found=1;
            end
            [X,Y,u,v]=ScatterWithArrows(X,Y);
        end
    end
end