function VT=CalculateThreshVolume(masks)

num=length(find(masks==1));


planespacing=.4/.7;
pixelspacing=.16;
VT=num*planespacing*pixelspacing^2;


