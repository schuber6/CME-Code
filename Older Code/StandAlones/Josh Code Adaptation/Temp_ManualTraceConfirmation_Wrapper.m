FrameGap=2;
MaxFrame=151;
Tmast=1000;
Tslave=0;
MinLTF=30/FrameGap;
MaxLTF=Inf;


for Group=[3 5 6]
    FXYCMS_Good{Group}={};
    for i=1:length(files{Group})
        FXYC3={};
        ind=1;
        load(files{Group}{i})
        [Nc,Fs,FXYCMS_Sel]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,MaxLTF,1);
        for i2=1:length(FXYCMS_Sel)
            fxyc=FXYCMS_Sel{i2};
            if fxyc(1,4)==3
                FXYC3{ind}=fxyc;
                ind=ind+1;
            end
        end
        FXYCMS_G=Manual_ConfirmTraces_FXYCMS(FXYC3);
        FXYCMS_Good{Group}=CombineCells(FXYCMS_Good{Group},FXYCMS_G);
    end
end