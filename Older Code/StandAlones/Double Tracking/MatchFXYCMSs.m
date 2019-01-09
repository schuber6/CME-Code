function Matches=MatchFXYCMSs(FXYCMS1,FXYCMS2)
%1 should be the one taken to be accurate

Matches=[];
h=waitbar(0,'Matching traces');
for i=1:length(FXYCMS1)
    waitbar(i/length(FXYCMS1))
    fxyc1=FXYCMS1{i};
    I=find(fxyc1(:,6)==max(fxyc1(:,6)));
    fxy=fxyc1(I(1),[1 2 3]);
    [fxyc2,ind]=FindClosestTrace(fxy,FXYCMS2);
    if ind~=0
        Matches=[Matches ; [i ind]];
    end
end
close(h)
