function usedC=SelectReasonableZGaussFits(NSTAms)
    %1<x<5  %Assumes 5 planes
    %400<A<10^6  %Mostly designed to eliminate absurdly high As
    %.5<sd<3  %Assumes plane spacing of 300 nm
    %For both master and slave channels
    usedC=cell(1,length(NSTAms));
    for i=1:length(NSTAms)
        VA=NSTAms(i).ZGaussA;
        VX=NSTAms(i).ZGaussX0;
        VSD=NSTAms(i).ZGaussSD;
        VAs=NSTAms(i).SZGaussA;
        VXs=NSTAms(i).SZGaussX0;
        VSDs=NSTAms(i).SZGaussSD;
        usedM=find(VA>400 & VA<10^6 & VX>1 & VX<5 & VSD>.5 & VSD<3);
        usedS=find(VAs>400 & VAs<10^6 & VXs>1 & VXs<5 & VSDs>.5 & VSDs<3);
        usedC{i}=intersect(usedM,usedS);
    end
    
