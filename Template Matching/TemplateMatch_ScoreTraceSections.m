function [scoreB,startB,finishB,TemplateB]=TemplateMatch_ScoreTraceSections(Template,FullTrace,framegap)
    
    L=length(Template);
    count=1;
    score=[];
    start=[];
    for i2=1:length(FullTrace)-L/framegap+1  %Go through all sections of size of template and find best match 
        inds=i2:i2+L/framegap-1;
        STrace=ScottifyTrace(FullTrace(inds),L);
        MT=STrace/mean(STrace);
        score(count)=sum((MT-Template).^2/length(MT)^2);
        start(count)=i2;
        count=count+1;
    end
    
    if isempty(score)
        scoreB=0;
        startB=0;
        finishB=0;
        TemplateB=[];
        return
    end
    BestInd=find(score==min(score));
    startB=start(BestInd(1));
    finishB=startB+L/framegap-1;
    scoreB=min(score);
    TemplateB=Template;
    
    while true %Check if adding point before best start improves match
        if startB==1
            break
        end
        TemplateTrial=ExtrapolateNAdditionalValues(TemplateB,1,framegap);
        TemplateTrial=TemplateTrial/mean(TemplateTrial);
        inds=startB-1:finishB;
        STrace=ScottifyTrace(FullTrace(inds),length(TemplateTrial));
        MT=STrace/mean(STrace);
        scoreT=sum((MT-TemplateTrial).^2/length(MT)^2);
        if scoreT<=scoreB
            startB=startB-1;
            scoreB=scoreT;
            TemplateB=TemplateTrial;
        else
            break
        end
    end
    