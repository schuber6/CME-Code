function HistSpikeWidths(MSD,IThresh,TThresh)

Spikes=[];
for i=1:length(MSD)
    AT=find(MSD{i}(:,5)>=IThresh);
    
    if ~isempty(AT)
        explored=zeros(1,length(AT));
        for i2=1:length(AT)
            if explored(i2)==0
                cont=1;
                L=1;
                ind=AT(i2);
                while cont
                    ind=ind+1;
                    if ismember(ind,AT)
                        hit=find(AT==ind);
                        explored(hit)=1;
                        L=L+1;
                    else
                        cont=0;
                    end
                end
                if L>=TThresh
                    Spikes=[Spikes L];
                end
            end
        end
    end
end
xbins=1:30;
figure
hist(Spikes,xbins)
