function nstaFT=AddBSSums(nstaF)

MB=CalculateStackBackgrounds(nstaF);
MB2=CalculateStackBackgrounds_FromRawSums(nstaF);
nstaFT=nstaF;
h=waitbar(0,'BSing Sums');
for i=1:length(nstaF)
    waitbar(i/length(nstaF))
    Raw=nstaF(i).RawSums;
    BS=[];
    BS2=[];
    for i2=1:length(Raw(:,1))
        BS=[BS ; Raw(i2,:)-MB*25];
        BS2=[BS2 ; Raw(i2,:)-MB2];
    end
    nstaFT(i).BSSums=BS;
    nstaFT(i).BSSumsNoFit=BS2;
end
close(h)
