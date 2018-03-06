%movie='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies\2dtosmo_d2_014_BS_CLCa_InsideCrop.tif';
movie='E:\CME Superfolder\CME Data\180301_Simulation\sim_1.tif';
AddMovie='E:\CME Superfolder\CME Data\180301_Simulation\sim_1.tif';
AddBack=strcat(AddMovie(1:end-4),'_BackgroundAdd.tif');
% figure
xbins=0:10:2000;

i=55;
IM=imread(movie,'Index',i);
[A,B]=size(IM);
VIM=double(reshape(IM,[1 A*B]));
BottomB=prctile(VIM,50);
used=find(VIM<=BottomB);
BackB=VIM(used);
xbinsB=0:10:BottomB;
Bef=hist(BackB,xbinsB);
Me=mean(BackB);
Stdev=sqrt(var(BackB));
Ratio=Me/Stdev;

for i=1:5000
    MeS(i)=floor((i-1)/100)*100;
    StdevS(i)=MeS(i)/Ratio;
end
% clear MeS VarS
% for i=1:1000
%     IM=imread(movie,'Index',i);
%     [A,B]=size(IM);
%     VIM=double(reshape(IM,[1 A*B]));
%     BottomA=prctile(VIM,50);
%     used=find(VIM<=BottomA);
%     BackA=VIM(used);
%     xbinsA=0:10:BottomA;
%     Aft=hist(BackA,xbinsA);
%     MeS(i)=mean(BackB)-mean(BackA);
%     VarS(i)=var(BackB)-var(BackA);
% end
figure
plot(MeS)
figure
plot(StdevS)
h=waitbar(0,'Background Adding');
for i=1:length(imfinfo(AddMovie))
    waitbar(i/5000)
    IM=imread(AddMovie,'Index',i);
    [A,B]=size(IM);
    for ix=1:A
        for iy=1:B
            R = normrnd(MeS(i),StdevS(i));
            IM(ix,iy)=IM(ix,iy)+R;
        end
    end
    imwrite(IM,AddBack,'Writemode','append','Compression','none')
end
close(h)

