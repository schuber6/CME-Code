function [C1,C2,C3,C4,C5,C6]=SplitLifetimeCohorts(fxyc,FrameGap)
%Gives trace indices of traces in each lifetime cohort (1: 1-10s, 2:11-15,
%3: 16-20, 4:21-40, 5:41-60, 6:61-120

C1=[];
C2=[];
C3=[];
C4=[];
C5=[];
C6=[];
for i=1:length(fxyc(1,1,:))
    LT=length(find(fxyc(:,1,i)))*FrameGap;
    C=fxyc(1,4,i);
    if C==3
        if LT<=10
            C1=[C1 i];
        else
            if LT<=15
                C2=[C2 i];
            else if LT<=20
                    C3=[C3 i];
                else if LT<=40
                        C4=[C4 i];
                    else if LT<=60
                            C5=[C5 i];
                        else if LT<=120
                                C6=[C6 i];
                            end
                        end
                    end
                end
            end
        end
    end
end

