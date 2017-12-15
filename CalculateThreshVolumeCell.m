function VT=CalculateThreshVolumeCell(masks)

p=length(masks(1,1,:));
VT=zeros(1,p);
for i=1:p
num=length(find(masks(:,:,i)==1));



planespacing=.4/.7;
pixelspacing=.16;
VT(i)=num*pixelspacing^2;
end