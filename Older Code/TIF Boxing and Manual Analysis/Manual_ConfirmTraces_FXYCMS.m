function FXYCMS_Good=Manual_ConfirmTraces_FXYCMS(FXYCMS)

FXYCMS_Good={};
ind=1;
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    close all
    figure
    subplot(1,3,1)
    plot(fxyc(:,1),fxyc(:,6))
    title('Master Intensity')
    subplot(1,3,2)
    plot(fxyc(:,1),fxyc(:,7))
    title('Slave Intensity')
    D=[];
    for i2=1:length(fxyc(:,1))-1
        D(i2)=norm([fxyc(i2+1,2)-fxyc(i2,2) fxyc(i2+1,3)-fxyc(i2,3)]);
    end
    subplot(1,3,3)
    plot(D)
    title('Distance')
    G(i)=input('Good? (1=Good 2=Bad)');
    if G(i)==1
        FXYCMS_Good{ind}=fxyc;
        ind=ind+1;
    end
end
    
    