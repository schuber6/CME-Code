function BoxPlotCell(C,varargin)

inp={};
if nargin==1
    F=@boxplot;
else
    F=varargin{1};
end
if nargin>2
    for i=2:nargin-1
        inp{i-1}=varargin{i};
    end
end
Ys=[];
Gs=[];
for i=1:length(C)
    Ys=[Ys C{i}];
    Gs=[Gs zeros(1,length(C{i}))+i];
end
F(Ys,Gs,inp{:});