function [scoreB,startB,finishB,TemplateB]=TemplateMatch_ScoreTraceSections_nonchisq(Template,FullTrace,framegap)
    
    L=length(Template);
    Template=ScottifyTrace(Template,L/framegap);
    L=length(Template);
    count=1;
    score=[];
    start=[];
    for i2=1:length(FullTrace)-L+1  %Go through all sections of size of template and find best match 
        inds=i2:i2+L-1;
        STrace=FullTrace(inds);
        MT=STrace/mean(STrace);
        chi=sum((MT-Template).^2./Template);
        MT100=ScottifyTrace(MT,100);
        Temp100=ScottifyTrace(Template,100);
        score(count)=sum(abs(MT100-Temp100));
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
    finishB=startB+L-1;
    scoreB=min(score);
    TemplateB=Template;
    
    while true %Check if adding point before best start improves match
        if startB==1
            break
        end
        TemplateTrial=ExtrapolateNAdditionalValues(TemplateB,1,1);
        TemplateTrial=TemplateTrial/mean(TemplateTrial);
        if min(TemplateTrial)<0
            break
        end
        inds=startB-1:finishB;
        STrace=FullTrace(inds);
        MT=STrace/mean(STrace);
        MT100=ScottifyTrace(MT,100);
        Temp100=ScottifyTrace(TemplateTrial,100);
        scoreT=sum(abs(MT100-Temp100));
        if scoreT<=scoreB
            startB=startB-1;
            scoreB=scoreT;
            TemplateB=TemplateTrial;
        else
            break
        end
    end
    
    while true %Check if adding point after best end improves match
        if finishB==length(FullTrace)
            break
        end
        TemplateTrial=ExtrapolateNAdditionalValues(TemplateB,2,1);
        TemplateTrial=TemplateTrial/mean(TemplateTrial);
        if min(TemplateTrial)<0
            break
        end
        inds=startB:finishB+1;
        STrace=FullTrace(inds);
        MT=STrace/mean(STrace);
        chi=sum((MT-TemplateTrial).^2./TemplateTrial);
        scoreT=chi2cdf(chi,length(MT)-2);
        if scoreT<=scoreB
            finishB=finishB+1;
            scoreB=scoreT;
            TemplateB=TemplateTrial;
        else
            break
        end
    end
    