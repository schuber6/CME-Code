function [Sevents,SAs,SIs,SUppers,SLowers,SDrops]=ManuallySelectPhotobleaches23_Continue(events,Is,MIs2,MIs3,Sevents,SAs,SIs,SUppers,SLowers,SDrops)

Drops=[];
Uppers=[];
Conversion=mean(nonzeros(Is))/mean(nonzeros(MIs2));
Conversion3=mean(nonzeros(Is))/mean(nonzeros(MIs3));
i=1;
ind=1;
Gind=max(length(SAs),1);
if isempty(Sevents)
    i=1;
else
    Last=Sevents{end};
    LastLast=Last(end,:);
    found=find(events(:,1)==LastLast(1) & events(:,2)==LastLast(2) & events(:,3)==LastLast(3));
    i=found(1)+1;
end

while i<length(events(:,1))
    Xi=events(i,2);
    Yi=events(i,3);
    INTS{ind}=Is(i);
    mINTS2{ind}=MIs2(i);
    mINTS3{ind}=MIs3(i);
    Evs{ind}=i;
    DropsT=[];
    missed=0;
    offset=1;
    while ~missed
        if i+offset<=length(events(:,1))
            Xf=events(i+offset,2);
            Yf=events(i+offset,3);
            D=norm([Xi-Xf Yi-Yf]);
            if D<=3
                INTS{ind}=[INTS{ind} Is(i+offset)];
                mINTS2{ind}=[mINTS2{ind} MIs2(i+offset)];
                mINTS3{ind}=[mINTS3{ind} MIs3(i+offset)];
                Evs{ind}=[Evs{ind} i+offset];
            else
                break
            end
            offset=offset+1;
        else
            break
        end
    end
    if length(mINTS2{ind})>=5
        figure
        subplot(1,2,1)
        plot(mINTS2{ind}*Conversion,'r')
        hold on
        plot(INTS{ind},'b')
        title(strcat(num2str(Gind-1),' Good, Events:',num2str(i),'-',num2str(i+offset),'/',num2str(length(events(:,1)))))
        subplot(1,2,2)
        plot(mINTS3{ind}*Conversion3,'r')
        hold on
        plot(INTS{ind},'b')
        XL=xlim;
        FF=input('First Frame of Higher (0 for none)?');
        if FF~=0
            xlim([FF XL(2)])
            LF=input('Last Frame of Lower (0 for quit movie)? ');
            if LF~=0
                xlim([FF LF])
                PF=input('Photobleach Frame');
                U2=mean(mINTS2{ind}(FF:PF-1))*Conversion;
                L2=mean(mINTS2{ind}(PF+1:LF))*Conversion;
                U3=mean(mINTS3{ind}(FF:PF-1))*Conversion3;
                L3=mean(mINTS3{ind}(PF+1:LF))*Conversion3;
                FI2=[zeros(1,PF-1)+U2 (U2+L2)/2 zeros(1,LF-(PF))+L2];
                FI3=[zeros(1,PF-1)+U3 (U3+L3)/2 zeros(1,LF-(PF))+L3];
                plot(FI,'g')
                Boo=input('Good? ');
                if Boo
                    Sevents{Gind}=events(i+FF-1:i+LF-1,:);
                    SAs{Gind}=INTS{ind};
                    SIs{Gind}=mINTS2{ind};
                    SUppers(Gind)=U2/Conversion;
                    SLowers(Gind)=L2/Conversion;
                    SDrops(Gind)=(U2-L2)/Conversion;
                    Gind=Gind+1;
                end
            else
                break
            end
        end
        close
    end
    ind=ind+1;
    i=i+offset+1;
end