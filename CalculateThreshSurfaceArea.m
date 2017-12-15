function SA=CalculateThreshSurfaceArea(masks,BottomPlane,TopPlane)

planespacing=.4/.7;
pixelspacing=.16;
SA=0;

SA=SA+length(find(masks(:,:,BottomPlane)==1))*pixelspacing^2;
SA=SA+length(find(masks(:,:,TopPlane)==1))*pixelspacing^2;
Edge=mean([length(find(masks(:,:,BottomPlane)==.5)) length(find(masks(:,:,TopPlane)==.5))]);
SA=SA+Edge*pixelspacing*planespacing*(TopPlane-BottomPlane);


