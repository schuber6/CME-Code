function [DNRdrop,CLTAdrop]=CalculateDrops(events,MSD)
% Record how much DNR and CLTA signals dropped during disappearance events
DNRdrop=[];
CLTAdrop=[];
for i=1:length(events(:,1))
%     before=find(MSD{events(i,4)}(:,1)==events(i,1));
%     after=find(MSD{events(i,4)}(:,1)==events(i,1)+6);
%     
%     if isempty(after)
%         L=length(MSD{events(i,4)}(:,1));
%         time=zeros(1,L)+50;
%         for i2=1:L
%             time(i2)=abs(MSD{events(i,4)}(i2,1)-(events(i,1)+6));
%         end
%         after=find(time==min(time));
%     end
    [before,after]=FindMaxDisappearance(events(i,1),MSD{events(i,4)});
    DNRdrop=[DNRdrop;[MSD{events(i,4)}(before(1),4)-MSD{events(i,4)}(after(1),4) events(i,1)]];
    CLTAdrop=[CLTAdrop;[MSD{events(i,4)}(before(1),5)-MSD{events(i,4)}(after(1),4) events(i,1)]];
end