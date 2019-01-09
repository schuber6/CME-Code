function [Za,Zc,ZzC]=TabulateAandCRatioMap(Files,fits)   
    
    for i=1:length(Files)
        load(Files{i})
        t(i)=(i-2)*5-1;
        xs=[];
        ys=[];
        AC=[];
        Adap=[];
        Clath=[];
        if strcmp(fits,'VeryGood')
            used=SelectVeryGoodZGaussFits(NSTAms);
        else
            if strcmp(fits,'Reasonable')
                used=SelectReasonableZGaussFits(NSTAms);
            end
        end
        ind=1;
        for i2=1:length(used)
            if ~isempty(used{i2})
                xs(ind)=NSTAms(i2).xpos(1);
                ys(ind)=NSTAms(i2).ypos(1);
                AC(ind)=NSTAms(i2).ZGaussA(1)/NSTAms(i2).SZGaussA(1);
                Adap(ind)=NSTAms(i2).ZGaussA(1);
                Clath(ind)=NSTAms(i2).SZGaussA(1);
                ind=ind+1;
            end
        end
        Za{i}=AvOfNearestN(xs,ys,Adap,5,3).';
        Zc{i}=AvOfNearestN(xs,ys,Clath,5,3).';
        Zz=log(Za{i}./Zc{i});
        ZzC{i}=Zz;
    end