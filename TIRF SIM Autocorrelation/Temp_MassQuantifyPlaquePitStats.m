P=PitsPlaquesSI;
B=median([PitsPlaquesSI(2:end).Back]);
for i=2:length(P)
    C(i-1)=P(i).Cyt-B;
    NPl(i-1)=length(P(i).Plaques);
    NPi(i-1)=length(P(i).Pits);
    PPl(i-1)=NPl(i-1)/(NPl(i-1)+NPi(i-1));
end
figure
scatter(C,PPl,'r')
hold on
% B=median([PitsPlaquesWT(2:end).Back]);
% P=PitsPlaquesWT;
% for i=1:length(P)
%     Cwt(i)=P(i).Cyt-B;
%     NPlwt(i)=length(P(i).Plaques);
%     NPiwt(i)=length(P(i).Pits);
%     PPlwt(i)=NPlwt(i)/(NPlwt(i)+NPiwt(i));
% end
% %figure
% scatter(Cwt,PPlwt,'g')
% xlabel('Cytosolic CALM Intensity')
% ylabel('Percent of Structures that are non diffraction limited')
% legend('siRNA','WT')