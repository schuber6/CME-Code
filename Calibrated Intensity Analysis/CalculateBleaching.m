movie='E:\CME Superfolder\CME Data\181107_SUM_CALMsiRNA_Calibrated\calibration_002_BS.tif';
events=[];
inds=[];
for i=1:length(tracest)
    for i2=1:length(tracest(i).frame)
        f=tracest(i).frame(i2);
        x=tracest(i).xpos(i2);
        y=tracest(i).ypos(i2);
        events=[events ; [f x y]];
        inds=[inds ; [i i2]];
    end
    for i3=1:5
        i2=i2+1;
        f=f+1;
        events=[events ; [f x y]];
        inds=[inds ; [i i2]];
    end
end
[MIs,Bs]=ManualFitEvents_BackR(events,movie,3,0,'sum');
for i=1:length(MIs)
    I1=inds(i,1);
    I2=inds(i,2);
%     f=tracest(I1).frame(I2);
%     x=tracest(I1).xpos(I2);
%     y=tracest(I1).ypos(I2);
    FXYC{I1}(I2,:)=[events(i,:) MIs(i)];
end

%%
figure
for i=1:length(FXYC)
    subplot(4,5,i)
    plot(FXYC{i}(:,4))
    ints=nonzeros(FXYC{i}(:,4));
    if length(ints)>6
    M(i)=mean(ints(1:end-6))-mean(ints(end-6:end));
    title(num2str(M(i)))
    end
end
figure
hist(M,2000:400:5000)
median(M)

%%
figure
for i=17

    plot(FXYC{i}(:,4))
    hold on
    ints=nonzeros(FXYC{i}(:,4));
    if length(ints)>6
    M(i)=mean(ints(1:end-6))-mean(ints(end-6:end));
    title(strcat('delta=',num2str(M(i))),'fontsize',20)
    end
end
U=mean(ints(1:8));
L=mean(ints(9:15));
line([1 8],[U U],'Color','g')
line([9 15],[L L],'Color','r')
xlabel('Frame #','fontsize',20)
ylabel('Intensity','fontsize',20)
