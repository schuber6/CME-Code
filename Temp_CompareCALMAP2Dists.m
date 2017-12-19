figure
for i=1:3
    subplot(2,3,i)
    Xfs=Xfulls_AP2{i};
    % for i=1:max(Xfs(:,13))
    %     used{i}=find(Xfs(:,13)==i);
    %
    % end
    %scatter(Xfs(:,13),Xfs(:,12))
    M=median(Xfs(:,5));
    ML=median(Xfs(:,12));
    %hexscatter((Xfs(:,5)-M)*300,Xfs(:,12))
    ScatterWithLR((Xfs(:,5)-M)*300,Xfs(:,12),1)
    hold on
    
    ylim([ML-2 ML+2])
    XL=xlim;
   
    if i==1
        ylabel('Log AP2:CLCa Ratio')
    end
    xlabel('Z Position (nm from bottom surface)')
   
end
for i=2:4
    subplot(2,3,i-1+3)
    Xfs=Xfulls_CALM{i};
    % for i=1:max(Xfs(:,13))
    %     used{i}=find(Xfs(:,13)==i);
    %
    % end
    %scatter(Xfs(:,13),Xfs(:,12))
    M=median(Xfs(:,5));
     ML=median(Xfs(:,12));
    %hexscatter((Xfs(:,5)-M)*300,Xfs(:,12))
    ScatterWithLR((Xfs(:,5)-M)*300,Xfs(:,12),1)
    if i==2
        ylabel('Log CALM:CLCa Ratio')
    end
    
    ylim([ML-2 ML+2])
    XL=xlim;
    
    xlabel('Z Position (nm from bottom surface)')
end