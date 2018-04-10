function [Mslopes,Sslopes]=FindAllJoshSlopes_InRange(FXYCMS,Range,thresh)
    
    RegL=4;
    
    Mslopes=[];
    Sslopes=[];
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        if ismember(fxyc(1,4),[1 2 3 5 6])
            used=find(ismember(fxyc(:,1),Range) & fxyc(:,6)>=thresh & fxyc(:,7)>=thresh);
            TempMS=[];
            TempSS=[];
            Mints=fxyc(used,6)/max(fxyc(used,6));
            Sints=fxyc(used,7)/max(fxyc(used,7));
            for i2=1:length(used)-RegL+1
                MI=zeros(1,RegL);
                SI=zeros(1,RegL);
                for i3=1:RegL
                    MI(i3)=Mints(i2+i3-1);
                    SI(i3)=Sints(i2+i3-1);
                end
                [slopeM, intercept, rsq]=LinearSlopeInterceptandR2(1:RegL,MI);
                [slopeS, intercept, rsq]=LinearSlopeInterceptandR2(1:RegL,SI);
                TempMS=[TempMS slopeM];
                TempSS=[TempSS slopeS];
            end
            Mslopes=[Mslopes TempMS];
            Sslopes=[Sslopes TempSS];
        end
    end
