function BoxByC_Data(file,movie,newfile,varargin)

if length(varargin)==0
    Draw=1:7;
else
    Draw=varargin{1};
end

load(file)
N=length(Data);
A=distinguishable_colors(7,[0 0 0]);
Cs=[];
events=[];
L=0;
for i=1:N
    if ismember(Data(i).Cat,Draw)
        L=L+length(Data(i).frame);
    end
end
events=zeros(L,3);
Cs=zeros(L,3);
ind=1;
for i=1:N

    NF=length(Data(i).frame);
    if ismember(Data(i).Cat,Draw)
        Col=A(Data(i).Cat,:);
        f=Data(i).frame;
        x=Data(i).X;
        y=Data(i).Y;
        for i2=1:NF
            events(ind,:)=[f(i2) x(i2) y(i2)];
            Cs(ind,:)=Col;
            ind=ind+1;
        end
    end
end
% folder='E:\CME Superfolder\CME Data\180320_Analysis\orig_movies';
% files=FindFiles(folder,'*009*.tif');


BoxEventsColors(movie,newfile,events,Cs);