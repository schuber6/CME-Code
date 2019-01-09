function DisplaySelData(Sevents,n,movie)

figure
Fs=Sevents{n}(:,1);
Xs=Sevents{n}(:,2);
Ys=Sevents{n}(:,3);
for BackR=2:4
    [Is{BackR},Bs{BackR}]=ManualFitEvents_BackR(Sevents{n},movie,BackR);
    [Upper(BackR),Lower(BackR),Drop(BackR),t(BackR)]=FindBiggestDrop(Is{BackR});
end

for i=1:3
    FI=[];
    for i2=1:length(Is{i+1})
        if i2<t(i+1)
            FI(i2)=Upper(i+1);
        end
        if i2>t(i+1)
            FI(i2)=Lower(i+1);
        end
        if i2==t(i+1)
            FI(i2)=(Upper(i+1)+Lower(i+1))/2;
        end
    end
    subplot(2,2,i)
    plot(Fs,Is{i+1})
    hold on
    plot(Fs,Bs{i+1})
    plot(Fs,FI)
    title(strcat('FXY=',num2str(Fs(t(i+1))),',',num2str(Xs(t(i+1))),',',num2str(Ys(t(i+1))),','))
end