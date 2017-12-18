function ScatterMasterVSInt(fxyc)

[A,B]=find(fxyc(:,5,:)>=500);
Ms=[];
ints=[];
Ss=[];
for i=1:length(A)
    Ms=[Ms fxyc(A(i),9,B(i))];
    Ss=[Ss fxyc(A(i),6,B(i))];
    ints=[ints fxyc(A(i),5,B(i))];
end
figure
scatter(ints,Ms)
figure
scatter(ints,Ss)
figure

% xbins=-25:100;
% xbins=xbins/100*10;
% HM=hist(Ms/mean(Ms),xbins);
% 
% HS=hist(Ss/mean(Ss),xbins);
% plot(xbins,HM,'g')
% hold on
% plot(xbins,HS,'r')

bins=1:100;
SA=cell(1,length(bins));
MA=cell(1,length(bins));
bins=bins/100*7000;
h=waitbar(0,'asfd');
for i0=1:length(ints)
    waitbar(i0/length(ints))
for i=1:length(bins)
    if ints(i0)<bins(i)
        MA{i}=[MA{i} Ms(i0)];
        SA{i}=[SA{i} Ss(i0)];
        break
    end
end
end
close(h)
MAA=zeros(1,length(bins));
SAA=zeros(1,length(bins));
for i=1:length(bins)
    if ~isempty(MA{i})
        MAA(i)=mean(MA{i});
    end
    if ~isempty(SA{i})
        SAA(i)=mean(SA{i});
    end
end
plot(bins,MAA/mean(MAA),'g')
hold on
plot(bins,SAA/mean(SAA),'r')


