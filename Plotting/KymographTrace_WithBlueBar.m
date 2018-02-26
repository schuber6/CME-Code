function Kym=KymographTrace_WithBlueBar(fxy,movieG,movieR,number,Window,KymProj,BlueF)
    %Takes area around trace (given by fxy matrix) and makes kymograph
    %image with each column of pixels corresponding to a single frame--the
    %top 5 from movieG, the bottom 5 from movieR.  Each pixel is the sum of
    %the 5 pixel row in the corresponding frame and column.  Saves image to
    %file in same folder as movies with trace number.
    %Replace 5 above with window (must be odd)
    
    Fs=length(fxy(:,1));
    Kym=zeros(2*Window,Fs+1,3);
    KymG=zeros(Window,Fs);
    KymR=zeros(Window,Fs);
    HWind=(Window-1)/2;
    scan=-HWind:HWind;
    BlueInd=find(fxy(:,1)>=BlueF,1,'first');
    for i=1:length(fxy(:,1))
        F=fxy(i,1);
        X=round(fxy(i,2));
        Y=round(fxy(i,3));
        IMg=imread(movieG,'Index',F);
        IMr=imread(movieR,'Index',F);
        %col=zeros(10,1);
        for irow=-HWind:HWind
            if KymProj=='sum'
                Pg(irow+HWind+1,1)=sum(IMg(Y+irow,X+scan));
                Pr(irow+HWind+1,1)=sum(IMr(Y+irow,X+scan));
            end
            if KymProj=='max'
                Pg(irow+HWind+1,1)=max(IMg(Y+irow,X+scan));
                Pr(irow+HWind+1,1)=max(IMr(Y+irow,X+scan));
            end
        end
        %col=[Pg ; Pr];
        KymG(:,i)=Pg;
        KymR(:,i)=Pr;
    end
    Mr=max(max(KymR));
    Mg=max(max(KymG));
    
    %Put in blue line just before BlueF
    KymG=[KymG(:,1:BlueInd-1) zeros(Window,1) KymG(:,BlueInd:end)];
    KymR=[KymR(:,1:BlueInd-1) zeros(Window,1) KymR(:,BlueInd:end)];
    Kym(:,BlueInd,3)=zeros(2*Window,1)+Mg;
    
    KymR=KymR*Mg/Mr;
    
    %Kym=[KymG ; KymR];
    Kym(1:Window,:,2)=KymG;
    Kym(Window+1:2*Window,:,1)=KymR;
    file=strcat(movieG(1:end-4),'Kymogram_Trace_Blue_',num2str(number),'.tif');
    imwrite(uint16(Kym),file,'Writemode','append','Compression','none')