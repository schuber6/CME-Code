function Pi=FindPlateau(MI,PL)
%Find highest intensity run of length PL

Pi=[];
MM=0;
for i=1:length(MI)-PL+1
    Is=MI(i:i+PL-1);
    M=mean(Is);
    if M>MM
        MM=M;
        Pi=i:(i+PL-1);
    end
end