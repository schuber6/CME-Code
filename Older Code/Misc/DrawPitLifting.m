function DrawPitLifting(SAfrac,H,ClosingFrac)
%Draws cartoon of pit on membrane
%SAfrace says how much of the final CLTA area to draw
%H says how high the base should be above the membrane
%ClosingFrac gives the progress of the Closing step--should be 0 before
%closing step and transition to 1 as it closes

FinalRadius=50;
SA=4*pi*FinalRadius^2*SAfrac;
SArad=4*pi*((sqrt(2)-ClosingFrac*(sqrt(2)-1))*FinalRadius)^2;
C=CirclePoints(SA/SArad,(sqrt(2)-ClosingFrac*(sqrt(2)-1))*FinalRadius);
C(:,2)=C(:,2)-C(1,2)+H;
Start=C(1,:);
Finish=C(end,:);
MS=[Start(1),0];
MF=[Finish(1),0];
plot([Start(1) MS(1)],[Start(2) MS(2)],'b')
hold on
plot([Finish(1) MF(1)],[Finish(2) MF(2)],'b')
plot(C(:,1),C(:,2),'g')
xlim([-150 150])
ylim([-20 280])
XL=xlim;
YL=ylim;
MMS=[XL(2) 0];
MMF=[XL(1) 0];
plot([MS(1) MMS(1)],[MS(2) MMS(2)],'b')
plot([MF(1) MMF(1)],[MF(2) MMF(2)],'b')


