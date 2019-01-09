function CMMI=CohortMaxIntensities(MMI,LT,CohortEdges)

    for i2=1:length(CohortEdges)-1
        used=find(LT>=CohortEdges(i2) & LT<CohortEdges(i2+1));
        CMMI{i2}=MMI(used);
    end
        