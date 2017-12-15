function ltf=FindEndCorrectedLifetime_Range_median(C,L,T,start,finish,framegap,OnesAndTwos)
%EndCorrection extrapolates lifetimes of 5s and 6s to correct lifetime
%drops near movie ends
%Naive just includes 5s and 6s without any correction
%If you put 0s in both endcorrection and naive it just includes 3s
%Don't put 1s in both endcorrection and naive
Naive=0;
EndCorrection=1;
%OnesAndTwos=true;

ltfSum=zeros(1,max(T));
ltfCount=zeros(1,max(T));
i=1;
used=find(C==3);
app=mean(L(used));
    U=find(T>=start & T<finish);
    LTs=[];
    for i2=1:length(U)
        
        if (C(U(i2))==3 || (OnesAndTwos==1 && (C(U(i2))==1 || C(U(i2))==2)))
            ltfSum(i)=ltfSum(i)+L(U(i2));
            ltfCount(i)=ltfCount(i)+1;
            LTs=[LTs L(U(i2))];
        end
        if EndCorrection
            if C(U(i2))==5 %&& max(T)-T(U(i))<app*2
                ltfSum(i)=ltfSum(i)+2*L(U(i2))-(max(T)-T(U(i)));
                ltfCount(i)=ltfCount(i)+1;
                LTs=[LTs 2*L(U(i2))-(max(T)-T(U(i)))];
            end
            if C(U(i2))==6 %&& T(U(i))<app*2
                ltfSum(i)=ltfSum(i)+2*L(U(i2))-(T(U(i)));
                ltfCount(i)=ltfCount(i)+1;
                LTs=[LTs 2*L(U(i2))-(T(U(i)))];
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

ltf=median(LTs)*framegap;%ltfSum(i)/ltfCount(i)*framegap;
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