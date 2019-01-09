function Tracest=ConstructTraceST(TraceFXY,ManI,TemplateB,factor,start,finish,score)
    
    for i=1:length(ManI)
        Tracest(i).frame=TraceFXY{i}(:,1);
        Tracest(i).xpos=TraceFXY{i}(:,2);
        Tracest(i).ypos=TraceFXY{i}(:,3);
        Tracest(i).int=ManI{i};
        Tracest(i).ishot=0;
        Tracest(i).ispair=0;
        Tracest(i).SNR=zeros(1,length(ManI{i}))+1;
        count=1;
        Temp=[];
        for i2=1:length(TraceFXY{i}(:,1))
            if ismember(i2,start(i):finish(i))
                Temp(i2)=TemplateB{i}(count)*factor(i);
                count=count+1;
            else
                Temp(i2)=0;
            end
        end
        Tracest(i).area=Temp;
        %Tracest(i).area=zeros(1,length(ManI{i}))+1;
    end