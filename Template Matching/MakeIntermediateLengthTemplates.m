function TemplateNew=MakeIntermediateLengthTemplates(Template,framegap)
    
    %Given Templates of increasing length, mixes closest templates to make
    %templates for the gaps in length
    
    Ls=StatCell(Template,'length');
    num=length(min(Ls):framegap:max(Ls));
    TemplateNew=cell(1,num);
    count=1;
    for L=min(Ls):framegap:max(Ls)
        if ismember(L,Ls)
            index=find(Ls==L);
            TemplateNew{count}=Template{index};
            count=count+1;
            continue
        end
        Lower=find(Ls<L,1,'last');
        Upper=find(Ls>L,1,'first');
        SL=ScottifyTrace(Template{Lower},L);
        SU=ScottifyTrace(Template{Upper},L);
        DL=abs(Ls(Lower)-L);
        DU=abs(Ls(Upper)-L);
        TemplateNew{count}=(SL*DU+SU*DL)/(DU+DL);
        count=count+1;
    end
    
    