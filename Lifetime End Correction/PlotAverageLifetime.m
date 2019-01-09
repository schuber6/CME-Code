function ltf=PlotAverageLifetime(C,L,T,EndCorrection,Naive)
%EndCorrection extrapolates lifetimes of 5s and 6s to correct lifetime
%drops near movie ends
%Naive just includes 5s and 6s without any correction
%If you put 0s in both endcorrection and naive it just includes 3s
%Don't put 1s in both endcorrection and naive

%Each traces should be split into single frames, each of which gets one
%entry in C, L, and T to specify its category, lifetime, and frame #
%Lifetime should be in frames


ltfSum=zeros(1,max(T));
ltfCount=zeros(1,max(T));
for i=1:max(T)
    U=find(T==i);
    for i2=1:length(U)
        if C(U(i2))==3
            ltfSum(i)=ltfSum(i)+L(U(i2));
            ltfCount(i)=ltfCount(i)+1;
        end
        if EndCorrection
            if C(U(i2))==5
                ltfSum(i)=ltfSum(i)+2*L(U(i2))-(max(T)-i+1);
                ltfCount(i)=ltfCount(i)+1;
            end
            if C(U(i2))==6
                ltfSum(i)=ltfSum(i)+2*L(U(i2))-(i);
                ltfCount(i)=ltfCount(i)+1;
            end
        end
        if Naive
            if C(U(i2))==5
                ltfSum(i)=ltfSum(i)+L(U(i2));
                ltfCount(i)=ltfCount(i)+1;
            end
            if C(U(i2))==6
                ltfSum(i)=ltfSum(i)+L(U(i2));
                ltfCount(i)=ltfCount(i)+1;
            end
        end
    end
end
ltf=ltfSum./ltfCount;
% if Naive
% plot(ltf,'r')
% hold on
% end
% if EndCorrection
% plot(ltf,'k')
% hold on
% end
% if ~EndCorrection && ~Naive
% plot(ltf)
% end