file='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT Cont\Movies\wt_cont_038_BS_Green.tif';
F=length(imfinfo(file));
for i=1:F
    IM(:,:,i)=imread(file,'Index',i);
end
%%  Bright spot
x=291;
y=297;
I=IM(y,x,:);
I=I(:);
figure
subplot(1,2,1)
plot(I)
subplot(1,2,2)
ACF=autocorr(I,100);
plot(ACF)
[A,B,rsq]=ExponentialFit((1:101).',ACF);

%%  Outside Cell
x=350;
y=100;
I=IM(y,x,:);
I=I(:);
figure
subplot(1,2,1)
plot(I)
subplot(1,2,2)
ACF=autocorr(I,100);
plot(ACF)
[A,B,rsq]=ExponentialFit((1:101).',ACF);
%%  Cytoplasm
x=336;
y=252;
I=IM(y,x,:);
I=I(:);
figure
subplot(1,2,1)
plot(I)
subplot(1,2,2)
ACF=autocorr(I,100);
plot(ACF)
[A,B,rsq]=ExponentialFit((1:101).',ACF);

%%  Whole Cell
[a,b,c]=size(IM);
Rad=10;
h=waitbar(0,'Autocorr');
for iy=1:floor(a/Rad)
    waitbar(iy/a)
    for ix=1:floor(b/Rad)
        I=IM(iy,ix,:);
        I=I(:);
        ACF=autocorr(I,100);
        f = fit((1:101).',ACF,'exp1');
        p=coeffvalues(f);
        B(iy,ix)=p(2);
    end
end
close(h)
%%  Whole Cell (Broken into squares of side lendth Rad)
[a,b,c]=size(IM);
Rad=10;
h=waitbar(0,'Autocorr');
for iy=1:floor(a/Rad)
    waitbar(iy/a)
    for ix=1:floor(b/Rad)
        IY=(iy-1)*Rad+1;
        IX=(ix-1)*Rad+1;
        I=sum(sum(IM(IY:IY+Rad,IX:IX+Rad,:)));
        I=I(:);
        ACF=autocorr(I,100);
        f = fit((1:101).',ACF,'exp1');
        p=coeffvalues(f);
        B(iy,ix)=p(2);
    end
end
close(h)

%%
Bc=B;
[a,b]=size(Bc);
C=zeros(a,b);
for iy=1:a
    for ix=1:b
        if Bc(iy,ix)<0
            C(iy,ix)=-1/Bc(iy,ix);
        end
    end
end
figure
imagesc(C)
colorbar


%%  Corner Portion
clear A B rsq
[a,b,c]=size(IM);
Rad=1;
h=waitbar(0,'Autocorr');
for iy=44:115
    waitbar(iy/115)
    for ix=15:102
        IY=(iy-1)*Rad+1;
        IX=(ix-1)*Rad+1;
        I=sum(sum(IM(IY:IY+Rad,IX:IX+Rad,:)));
        I=I(:);
        ACF=autocorr(I,60);
        [A(iy-43,ix-14),B(iy-43,ix-14),rsq(iy-43,ix-14)] = ExponentialFit((1:61).',ACF);
    end
end
close(h)
save CornerAutoCorr.mat A B rsq

%%  Center Portion
clear A B rsq
[a,b,c]=size(IM);
Rad=1;
h=waitbar(0,'Autocorr');
for iy=286:356
    waitbar(iy/356)
    for ix=255:326
        IY=(iy-1)*Rad+1;
        IX=(ix-1)*Rad+1;
        I=sum(sum(IM(IY:IY+Rad,IX:IX+Rad,:)));
        I=I(:);
        ACF=autocorr(I,60);
        [A(iy-285,ix-254),B(iy-285,ix-254),rsq(iy-285,ix-254)] = ExponentialFit((1:61).',ACF);
    end
end
close(h)
save CenterAutoCorr.mat A B rsq
%%  Osmoshock stalled cell
file='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 10 min\Movies\wt_osmo_10m_048_BS_Green.tif';
F=length(imfinfo(file));
for i=1:F
    IM2(:,:,i)=imread(file,'Index',i);
end

%%  Center Portion
clear A B rsq
[a,b,c]=size(IM2);
Rad=1;
h=waitbar(0,'Autocorr');
for iy=277:367
    waitbar(iy/367)
    for ix=146:242
        IY=(iy-1)*Rad+1;
        IX=(ix-1)*Rad+1;
        I=sum(sum(IM2(IY:IY+Rad,IX:IX+Rad,:)));
        I=I(:);
        ACF=autocorr(I,60);
        [A(iy-276,ix-145),B(iy-276,ix-145),rsq(iy-276,ix-145)] = ExponentialFit((1:61).',ACF);
    end
end
close(h)
save Stalled=AutoCorr.mat A B rsq

%%  Osmoshock Partially stalled cell
file='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\WT 3 min\Movies\wt_osmo_3m_072_BS_Green.tif';
F=length(imfinfo(file));
for i=1:F
    IM3(:,:,i)=imread(file,'Index',i);
end

%%  Center Portion
clear A B rsq
[a,b,c]=size(IM3);
Rad=10;
h=waitbar(0,'Autocorr');
for iy=1:floor(a/Rad)
    waitbar(iy/floor(a/Rad))
    for ix=1:floor(b/Rad)
        IY=(iy-1)*Rad+1;
        IX=(ix-1)*Rad+1;
        I=sum(sum(IM3(IY:IY+Rad,IX:IX+Rad,:)));
        I=I(:);
        ACF=autocorr(I,60);
        [A(iy,ix),B(iy,ix),rsq(iy,ix)] = ExponentialFit((1:61).',ACF);
    end
end
close(h)
save Part_Stalled_AutoCorr.mat A B rsq