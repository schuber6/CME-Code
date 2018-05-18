function [Kym,Ir,Ig,Zr,Zg]=TwoColorZKymograph(fileR,fileG,X,Y,Planes,varargin)
    
    R=2; %Number of pixels from (Y,X) that kymograph looks at
    vx=X-R:X+R;
    vy=Y-R:Y+R;
    w=1:5;
    if nargin==5
        frameM=length(imfinfo(fileR));
        Mframes=frameM/Planes;
        frames=1:Mframes;
    else
        frames=varargin{1};
    end
    IMr=imread(fileR,'Index',ceil(Planes/2));
    IMg=imread(fileG,'Index',ceil(Planes/2));
    Nr=double(max(max(IMr)));
    Ng=double(max(max(IMg)));
    
    for i=1:Planes
        IMr=imread(fileR,'Index',i);
        IMg=imread(fileG,'Index',i);
        [a,b]=size(IMr);
        vr=reshape(IMr,[1 a*b]);
        vg=reshape(IMg,[1 a*b]);
        Mr(i)=double(median(vr));
        Mg(i)=double(median(vg)); %Medians for background subtraction
    end
    
    Nr=Nr-Mr(ceil(Planes/2)); %Max intensity for normalization
    Ng=Ng-Mg(ceil(Planes/2));
    for i=frames
        for i2=1:Planes
            n=(i-1)*Planes+i2;
%             IMr=imread(fileR,'Index',n);
%             IMg=imread(fileG,'Index',n);
%             Cr=(double(IMr(vy,vx))-Mr(i2))/Nr*1000;
%             Cg=(double(IMg(vy,vx))-Mg(i2))/Ng*1000;
% %             Red(i,i2)=max(max(Cr));
% %             Green(i,i2)=max(max(Cg));
            [IsR,BsR]=ManualFitEventsFrame(X,Y,fileR,n,3,'sum');
            [IsG,BsG]=ManualFitEventsFrame(X,Y,fileG,n,3,'sum');
            Red(i,i2)=IsR(1);
            Green(i,i2)=IsG(1);
        end
        Ir(i)=max(Red(i,:));
        Ig(i)=max(Green(i,:));
        Zr(i)=sum(Red(i,:).*w)/sum(Red(i,:));
        Zg(i)=sum(Green(i,:).*w)/sum(Green(i,:));
    end
    Kym=[Red Green].';
    figure
    subplot(2,3,1)
    imagesc(Green.')
    xlabel('Frame # (3.5s per frame)')
    ylabel('Plane # (300 nm per plane)')
    title('CALM Kymograph')
    set(gca,'YDir','normal')
    subplot(2,3,4)
    imagesc(Red.')
    xlabel('Frame # (3.5s per frame)')
    ylabel('Plane # (300 nm per plane)')
    title('AP2 Kymograph')
    set(gca,'YDir','normal')
    subplot(1,3,2)
    plot(Ir,'r')
    hold on
    plot(Ig,'g')
    xlabel('Frame # (3.5s per frame)')
    ylabel('Intensity')
    subplot(1,3,3)
    plot(Zr,'r')
    hold on
    plot(Zg,'g')
    xlabel('Frame # (3.5s per frame)')
    ylabel('Z Center of Intensity (plane #)')
    
                    