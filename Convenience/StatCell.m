function Stat=StatCell(C,st)
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