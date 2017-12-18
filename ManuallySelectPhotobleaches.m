function [Sevents,SAs,SIs,SUppers,SLowers,SDrops]=ManuallySelectPhotobleaches(events,Is,MIs)
%Uppers gives the mean int of the higher part of event
%Lowers gives the same for the lower part
%Drops is Uppers-Lowers
%The photobleach frame is counted in neither as the florophore may have
%bleached part-way through the exposure

Drops=[];
Uppers=[];
Conversion=mean(nonzeros(Is))/mean(nonzeros(MIs));
i=1;
ind=1;
Gind=1;

Sevents=[];
SAs=[];
SIs=[];
SUppers=[];
SLowers=[];
SDrops=[];
while i<length(events(:,1))
    Xi=events(i,2);
    Yi=events(i,3);
    INTS{ind}=Is(i);
    mINTS{ind}=MIs(i);
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
                mINTS{ind}=[mINTS{ind} MIs(i+offset)];
                Evs{ind}=[Evs{ind} i+offset];
            else
                break
            end
            offset=offset+1;
        else
            break
        end
    end
    
    for i2=2:length(mINTS{ind})-1
        DropsT=[DropsT mean(mINTS{ind}(1:i2-1))-mean(mINTS{ind}(i2+1:length(mINTS{ind})))];
    end
    if ~isempty(DropsT)
        Drops(ind)=max(DropsT);
    else
        Drops(ind)=0;
    end
    best=find(DropsT==max(DropsT));
    if ~isempty(best)
        Uppers(ind)=mean(mINTS{ind}(1:best(1)));
        Lowers(ind)=mean(mINTS{ind}(best(1)+2:end));
        FINTS{ind}=[zeros(1,best(1))+Uppers(ind) mean([Uppers(ind) Lowers(ind)]) zeros(1,length(mINTS{ind})-best(1)-1)+Lowers(ind)];
    end
    if length(mINTS{ind})>=5
        figure
        plot(mINTS{ind}*Conversion,'r')
        hold on
        plot(INTS{ind},'b')
        title(strcat('Events:',num2str(i),'-',num2str(i+offset),'/',num2str(length(events(:,1)))))
        XL=xlim;
        FF=input('First Frame of Higher (0 for none)?');
        if FF~=0
            xlim([FF XL(2)])
            LF=input('Last Frame of Lower (0 for quit movie)? ');
            if LF~=0
                xlim([FF LF])
                PF=input('Photobleach Frame');
                U=mean(mINTS{ind}(FF:PF-1))*Conversion;
                L=mean(mINTS{ind}(PF+1:LF))*Conversion;
                FI=[zeros(1,PF-1)+U (U+L)/2 zeros(1,LF-(PF))+L];
                plot(FI,'g')
                Boo=input('Good? ');
                if Boo
                    Sevents{Gind}=events(i+FF-1:i+LF-1,:);
                    SAs{Gind}=INTS{ind};
                    SIs{Gind}=mINTS{ind};
                    SUppers(Gind)=U/Conversion;
                    SLowers(Gind)=L/Conversion;
                    SDrops(Gind)=(U-L)/Conversion;
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