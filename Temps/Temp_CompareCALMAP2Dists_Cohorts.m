
for i0=2:4
    figure
Xc=SplitByPRCT(Xfulls_CALM{i0},4,10);
for i=1:length(Xc)
    subplot(2,5,i)
    Xfs=Xc{i};
    % for i=1:max(Xfs(:,13))
    %     used{i}=find(Xfs(:,13)==i);
    %
    % end
    %scatter(Xfs(:,13),Xfs(:,12))
    M=median(Xfs(:,5));
    ML=median(Xfs(:,12));
    %hexscatter((Xfs(:,5)-M)*300,Xfs(:,12))
    [slope_calm(i,i0-1),intercept_calm(i,i0-1),rsq_calm(i,i0-1)]=ScatterWithLR_pars((Xfs(:,7)-M)*300,Xfs(:,12),1);
    hold on
    Low=prctile(Xfs(:,5)-M,10);
    High=prctile(Xfs(:,5)-M,90);
    ylim([ML-2 ML+2])
    XL=xlim;
   
    if i==1
        ylabel('Log AP2:CLCa Ratio')
    end
    xlabel('Z Position (nm from bottom surface)')
    title(strcat('Height: ',num2str(Low),'-',num2str(High))) 
   
end
end
for i0=1:3
    figure
Xc=SplitByPRCT(Xfulls_AP2{i0},4,10);
for i=1:length(Xc)
    subplot(2,5,i)
    Xfs=Xc{i};
    % for i=1:max(Xfs(:,13))
    %     used{i}=find(Xfs(:,13)==i);
    %
    % end
    %scatter(Xfs(:,13),Xfs(:,12))
    M=median(Xfs(:,5));
    ML=median(Xfs(:,12));
    %hexscatter((Xfs(:,5)-M)*300,Xfs(:,12))
    [slope_ap2(i,i0),intercept_ap2(i,i0),rsq_ap2(i,i0)]=ScatterWithLR_pars((Xfs(:,7)-M)*300,Xfs(:,12),1);
    Low=prctile(Xfs(:,5)-M,10);
    High=prctile(Xfs(:,5)-M,90);
    hold on
    
    ylim([ML-2 ML+2])
    XL=xlim;
   
    if i==1
        ylabel('Log AP2:CLCa Ratio')
    end
    xlabel('Z Position (nm from bottom surface)')
    title(strcat('Height: ',num2str(Low),'-',num2str(High))) 
   
end
end
figure
for i0=1:2
plot(slope_ap2(:,i0),'r')
hold on
plot(slope_calm(:,i0),'g')
end
figure
for i0=1:2
plot(rsq_ap2(:,i0),'r')
hold on
plot(rsq_calm(:,i0),'g')
end


