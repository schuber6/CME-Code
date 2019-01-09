clear
file='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\orig_movies\cell006_Stack1.mat';
savefile='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1_ManualDecisions.mat';
load(file)
load(savefile)
movie='E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006\cell006_Stack1.tif';
for i=1:length(imfinfo(movie))
    IM(:,:,i)=imread(movie,'Index',i);
end

R=2;

%i=1;
%i2=1;
h=waitbar(0,'Gathering Trace Data');
%T=4422;
%used=find(Decisions(:,1)==T);
for i=1:length(Decisions(:,1)) %i=used %ceil(rand*2040) %
    waitbar(i/length(Decisions(:,1)))
    T=Decisions(i,1);
    fxyc=Threshfxyc(:,:,T);
    used=find(fxyc(:,1));
    fxyc=fxyc(used,:);
    A=zeros(1,length(used));
    sx=A;
    sy=A;
    Fs=[fxyc(1,1)-1 ; fxyc(:,1) ; fxyc(end,1)+1];
    xs=[fxyc(1,2) ; fxyc(:,2) ; fxyc(end,2)];
    Xs=round(xs);
    ys=[fxyc(1,3) ; fxyc(:,3) ; fxyc(end,3)];
    Ys=round(ys);
    for i2=1:length(Fs)
        f=Fs(i2);
        x=Xs(i2);
        y=Ys(i2);
        crop=IM(y-R:y+R,x-R:x+R,f);
        c = twoDgaussianFittingUnConstrained(crop);
        A(i2)=c(2);
        sx(i2)=c(5);
        sy(i2)=c(6);
    end
    Data(i).A=A;
    Data(i).sx=sx;
    Data(i).sy=sy;
    Data(i).Decision=Decisions(i,2);
    Data(i).T=Decisions(i,1);
    Data(i).CMED=CME(i,2);
    Data(i).frame=Fs;
    Data(i).X=xs;
    Data(i).Y=ys;
end
close(h)
save('MLData_ExtraFrames_R2.mat','Data')

%%
figure
plot(Fs,A)
hold on
plot(fxyc(:,1),fxyc(:,5))
NBins=40;
STrace=ScottifyTrace(A,NBins);
CategorizeExample([1 length(A) STrace])
Decisions(i,2)
% figure
% plot(sx)
% hold on
% plot(sy)