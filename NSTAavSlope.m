exp_name='E:\CME Superfolder\CME Data\170616_Analysis';
tmpd = dir(fullfile(exp_name,'*.mat'));

WindowSize=11; %Should be odd
WindowMid=(WindowSize+1)/2;
h=waitbar(0,'averaging slopes');
for i0=1:length(tmpd)
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0});
    M=maxframeNSTA(NSTA);
    SumSlopes=zeros(1,M);
    CountSlopes=zeros(1,M);
    for i=1:length(NSTA)
        waitbar(i/length(NSTA))
        if NSTA(i).class==0
            for i2=1:length(NSTA(i).frame)
                if i2>=(WindowSize+1)/2 && length(NSTA(i).frame)-i2>=(WindowSize+1)/2
                    for i3=1:WindowSize
                        X(i3)=i3;
                        Y(i3)=NSTA(i).st(i2+(i3-WindowMid));
                    end
                    [slope, rsq]=LinearSlopeandR2(X,Y);
                    for i3=1:WindowSize
                        
                        F(i3)=NSTA(i).frame(i2+(i3-WindowMid));
                        SumSlopes(F(i3))=SumSlopes(F(i3))+slope;
                        CountSlopes(F(i3))=CountSlopes(F(i3))+1;
                    end
                end
            end
        end
    end
    AvSlope=SumSlopes./CountSlopes;
    subplot(2,4,i0)
    plot(AvSlope)
    ylim([0 .02])
end
close(h)