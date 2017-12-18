Window=50;
F=max(events(:,1));
DNRdropA=cell(1,F);
for i=1:length(DNRdrop(:,1))
    f=DNRdrop(i,2);
    for i2=1:Window
        if f+i2-1<=F
            DNRdropA{f+i2-1}=[DNRdropA{f+i2-1} DNRdrop(i,1)];
        end
    end
end
%%
for i=1:length(DNRdropA)
    DNRdropAv(i)=mean(DNRdropA{i});
end
for i=1:length(CLTAdropA)
    CLTAdropAv(i)=mean(CLTAdropA{i});
end
plot(DNRdropAv,'g')
hold on
plot(CLTAdropAv,'r')
ylabel('Drop in Intensity Over DNR Disappearence')
xlabel('Frame')
title('S007')
%%
Window=50;
F=max(events(:,1));
CLTAdropA=cell(1,F);
for i=1:length(CLTAdrop(:,1))
    f=CLTAdrop(i,2);
    for i2=1:Window
        if f+i2-1<=F
            CLTAdropA{f+i2-1}=[CLTAdropA{f+i2-1} CLTAdrop(i,1)];
        end
    end
end