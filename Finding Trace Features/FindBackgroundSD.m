function BI=FindBackgroundSD(file)
%Finds total intensity that can be attributed to background by assuming
%the box described by xl xu yl yu fl fu is empty of spots
xl=208;
xu=250;
yl=397;
yu=426;
fl=214;
fu=259;
frames=length(imfinfo(file));
[A,B]=size(imread(file,'Index',1));
BI=[];
for i=fl:fu
    IM=imread(file,'Index',i);
    S=0;
    for i2=yl:yu
        for i3=xl:xu
            BI=[BI,double(IM(i2,i3))];
        end
    end
end