%movie='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies\2dtosmo_d2_014_BS_CLCa_InsideCrop.tif';
movie='E:\CME Superfolder\CME Data\180301_Simulation\sim_1.tif';
AddMovie='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies\2dtosmo_d2_014_BS_CLCa.tif';
AddBack=strcat(AddMovie(1:end-4),'_ArtificialBackground.tif');
% figure
xbins=0:10:2000;

i=55;
IM=imread(movie,'Index',i);
[A,B]=size(IM);
VIM=double(reshape(IM,[1 A*B]));
BottomB=prctile(VIM,75);
used=find(VIM<=BottomB);
BackB=VIM(used);
xbinsB=0:10:BottomB;
Bef=hist(BackB,xbinsB);

clear MeS VarS
for i=1:1000
    IM=imread(movie,'Index',i);
    [A,B]=size(IM);
    VIM=double(reshape(IM,[1 A*B]));
    BottomA=prctile(VIM,75);
    used=find(VIM<=BottomA);
    BackA=VIM(used);
    xbinsA=0:10:BottomA;
    Aft=hist(BackA,xbinsA);
    MeS(i)=mean(BackB)-mean(BackA);
    VarS(i)=var(BackB)-var(BackA);
end
figure
plot(MeS)
figure
plot(VarS)

% for i=1:length(imfinfo(movie))
%     IM=imread(AddMovie,'Index',i);
%     [A,B]=size(IM);
%     for ix=1:A
%         for iy=1:B
%             R = normrnd(MeS(i),sqrt(VarS(i)));
%             IM(ix,iy)=IM(ix,iy)+R;
%         end
%     end
%     imwrite(IM,AddBack,'Writemode','append','Compression','none')
% end

