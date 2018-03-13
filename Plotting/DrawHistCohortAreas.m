function [ArObj,varargout]=DrawHistCohortAreas(CohortCell,xbins,Stacked,varargin)
    
    %Takes cell area of vectors from each cohort and plots a histogram
    %split into cohort areas
    %xbins can be a vector of bin centers or a number of bins
    %If xbins is a number, can get vector as output
    %The optional third parameter, when 1, sets xbins so that it includes 0
    %in the first bin
    %Optional fourth parameter Scales plot to integrate to 1
    
    if length(xbins)==1
        nbins=xbins;
        clear xbins
        Full=[];
        for i=1:length(CohortCell)
            Full=[Full CohortCell{i}];
        end
        if varargin{1}
            Full=[Full 0];
        end
        [~,xbins]=hist(Full,nbins);
        varargout{1}=xbins;
    end
    
    if isempty(Stacked)
        A=zeros(length(xbins),length(CohortCell));
        for i=1:length(CohortCell)
            H=hist(CohortCell{i},xbins);
            A(:,i)=H;
        end
        ArObj=area(xbins,A);
    else
        for i=1:length(CohortCell)
            A=zeros(length(xbins),length(CohortCell));
            H=hist(CohortCell{i},xbins);
            A(:,i)=H;
            subplot(Stacked(i,1),Stacked(i,2),Stacked(i,3))
            %ArObj{i}=area(xbins,A);
            if length(varargin)>=2 && varargin{2}
                H=H/sum(H)/(xbins(end)-xbins(1));
            end
            ArObj{i}=plot(xbins,H);
            hold on
        end
    end
    
    