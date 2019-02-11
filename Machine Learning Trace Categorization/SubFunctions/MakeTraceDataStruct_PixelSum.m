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
events=[];
for i=1:length(Decisions(:,1))
    T=Decisions(i,1);
    fxyc=Threshfxyc(:,:,T);
    used=find(fxyc(:,1));
    fxyc=fxyc(used,:);
    A=zeros(1,length(used));
    Fs=[fxyc(1,1)-1 ; fxyc(:,1) ; fxyc(end,1)+1];
    xs=[fxyc(1,2) ; fxyc(:,2) ; fxyc(end,2)];
    Xs=round(xs);
    ys=[fxyc(1,3) ; fxyc(:,3) ; fxyc(end,3)];
    Ys=round(ys);
    for i2=1:length(Fs)
        f=Fs(i2);
        x=Xs(i2);
        y=Ys(i2);
        events=[events ; [f x y]];
    end
end
[MIs,Bs]=ManualFitEvents_BackR(events,movie,2,0,'sum');
ind=1;
for i=1:length(Decisions(:,1)) %i=used %ceil(rand*2040) %
    waitbar(i/length(Decisions(:,1)))
    T=Decisions(i,1);
    fxyc=Threshfxyc(:,:,T);
    used=find(fxyc(:,1));
    fxyc=fxyc(used,:);
    A=zeros(1,length(used));
    Fs=[fxyc(1,1)-1 ; fxyc(:,1) ; fxyc(end,1)+1];
    xs=[fxyc(1,2) ; fxyc(:,2) ; fxyc(end,2)];
    Xs=round(xs);
    ys=[fxyc(1,3) ; fxyc(:,3) ; fxyc(end,3)];
    Ys=round(ys);
    for i2=1:length(Fs)
        f=Fs(i2);
        x=Xs(i2);
        y=Ys(i2);
        A(i2)=MIs(ind);
        ind=ind+1;
    end
    Data(i).A=A;
    Data(i).Decision=Decisions(i,2);
    Data(i).T=Decisions(i,1);
    Data(i).CMED=CME(i,2);
    Data(i).frame=Fs;
    Data(i).X=xs;
    Data(i).Y=ys;
end
close(h)
save('MLData_PixelSum_B2.mat','Data')

%%
t=ceil(rand*length(Data));
T=Data(t).T;
fxyc=Threshfxyc(:,:,T);
used=find(fxyc(:,1));
fxyc=fxyc(used,:);
Fs=Data(t).frame;
A=Data(t).A;
figure
plot(Fs,A)
hold on
plot(fxyc(:,1),fxyc(:,5))
figure
scatter(fxyc(:,5),A(2:end-1))