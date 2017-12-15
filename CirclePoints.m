function C=CirclePoints(P,R)
%Returns points needed to plot a partial circle where P is the percent
%of the circle to be drawn, and R is the radius

N=1000;
Start=(1-P)*360/2;
Finish=360-Start;

C=[];
for i=1:N
    Angle=360/N*(i-1);
    if Angle>=Start && Angle<=Finish
    X=cosd(Angle-90)*R;
    Y=sind(Angle-90)*R;
    C=[C;[X Y]];
    end
end
