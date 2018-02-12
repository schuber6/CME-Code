function Scatter2ChannelInt(MSD)

Data=[];
for i=1:min(50,length(MSD)) %length(MSD)
    for i2=1:length(MSD{i}(:,1))
        Data=[Data ; [MSD{i}(i2,4) MSD{i}(i2,5)]];
    end
end
figure
scatter(Data(:,1),Data(:,2))
xlabel('CLTA Intensity')
ylabel('DNR Intensity')