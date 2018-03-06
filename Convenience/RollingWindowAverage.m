function RollingVector=RollingWindowAverage(Vector,Window,Alignment)
    %Takes vector and returns averages of the "Window" elements around each
    %index.  Can be set to 'Before','After', or 'Centered'
    
    %(After and Centered to be coded)
    
    if strcmp(Alignment,'After')
        RollingVector=zeros(1,length(Vector));
        for i=1:length(Vector)-Window+1
            RollingVector(i)=mean(Vector(i:i+Window-1));
        end
    end