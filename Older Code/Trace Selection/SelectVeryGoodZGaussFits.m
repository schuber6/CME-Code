function usedC=SelectVeryGoodZGaussFits(NSTAms)
    %1<x<5  %Assumes 5 planes
    %20000<A<10^7 %Mostly designed to eliminate absurdly high As
    %1<sd<2  %Assumes plane spacing of 300 nm
    %For both master and slave channels
    usedC=cell(1,length(NSTAms));
    for i=1:length(NSTAms)
        VA=NSTAms(i).ZGaussA;
        VX=NSTAms(i).ZGaussX0;
        VSD=NSTAms(i).ZGaussSD;
        VAs=NSTAms(i).SZGaussA;
        VXs=NSTAms(i).SZGaussX0;
        VSDs=NSTAms(i).SZGaussSD;
        usedM=find(VA>20000 & VA<10^7 & VX>1 & VX<5 & VSD>1 & VSD<2);
        usedS=find(VAs>400 & VAs<10^7 & VXs>1 & VXs<5 & VSDs>.5 & VSDs<3);
        usedC{i}=intersect(usedM,usedS);
    end
    
