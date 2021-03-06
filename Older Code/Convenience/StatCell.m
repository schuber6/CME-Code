function [Stat,varargout]=StatCell(C,st,varargin)
    %Calculates st statistic on all cells in C and returns vector of all
    %statistics
    
    
    Stat=zeros(1,length(C));
    if strcmp(st,'mean')
        for i=1:length(C)
            if ~isempty(C{i})
                Stat(i)=mean(C{i});
            end
        end
    end
    if strcmp(st,'median')
        for i=1:length(C)
            if ~isempty(C{i})
                Stat(i)=median(C{i});
            end
        end
    end
    if strcmp(st,'variance')
        for i=1:length(C)
            if ~isempty(C{i})
                Stat(i)=var(C{i});
            end
        end
    end
    if strcmp(st,'stdev')
        for i=1:length(C)
            if ~isempty(C{i})
                Stat(i)=sqrt(var(C{i}));
            end
        end
    end
    if strcmp(st,'mean_assumezeros')
        ML=0;
        for i=1:length(C)
            if ~isempty(C{i}) && length(C{i})>ML
                ML=length(C{i});
            end
        end
        for i=1:length(C)
            if ~isempty(C{i})
                Stat(i)=sum(C{i})/ML;
            end
        end
    end
    if strcmp(st,'mean_std_errorbar')
        varargout{1}=zeros(1,length(C));
        for i=1:length(C)
            if ~isempty(C{i})
                Stat(i)=mean(C{i});
                varargout{1}(i)=sqrt(var(C{i}));
            end
        end
        errorbar(Stat,varargout{1})
    end
    if strcmp(st,'median_boxplot')
        varargout{1}=zeros(1,length(C));
        x=[];
        g=[];
        for i=1:length(C)
            if ~isempty(C{i})
                Stat(i)=median(C{i});
                x=[x C{i}];
                g=[g zeros(1,length(C{i}))+i];
            end
        end
        if nargin==2
            boxplot(x,g)
        else
            if nargin==4
                boxplot(x,g,varargin{1},varargin{2})
            else
                if nargin==6
                    boxplot(x,g,varargin{1},varargin{2},varargin{3},varargin{4})
                else
                    boxplot(x,g,varargin{1},varargin{2},varargin{3},varargin{4},varargin{5},varargin{6})
                end
            end
        end
    end
    if strcmp(st,'median_notboxplot')
        varargout{1}=zeros(1,length(C));
        x=[];
        g=[];
        for i=1:length(C)
            if ~isempty(C{i})
                Stat(i)=median(C{i});
                x=[x C{i}];
                g=[g zeros(1,length(C{i}))+i];
            end
        end
        notBoxPlot(x,g)
    end
    if strcmp(st,'max')
        for i=1:length(C)
            if ~isempty(C{i})
                Stat(i)=max(C{i});
            end
        end
    end
    if strcmp(st,'min')
        for i=1:length(C)
            if ~isempty(C{i})
                Stat(i)=min(C{i});
            end
        end
    end
    if strcmp(st,'length')
        for i=1:length(C)
            if ~isempty(C{i})
                Stat(i)=length(C{i});
            end
        end
    end
    if strcmp(st,'median_boxplot_xpos')
        xpos=varargin{1};
        sortx=sort(unique(xpos));
        varargout{1}=zeros(1,length(C));
        x=[];
        g=[];
        for i=1:length(C)
            if ~isempty(C{i})
                Stat(i)=median(C{i});
                x=[x C{i}];
                g=[g zeros(1,length(C{i}))+find(sortx==xpos(i),1,'first')];
            end
        end
        
        boxplot(x,g,'Position',sortx)
        
    end
