function BoxAll_Data(file,movie,newfile)

load(file)
N=length(Data);

A=distinguishable_colors(5000,[0 0 0]);
Cs=[];
events=[];
L=0;
for i=1:N
    if Data(i).Cat~=4
        L=L+length(Data(i).frame);
    end
end
events=zeros(L,3);
Cs=zeros(L,3);
ind=1;
for i=1:N
    if Data(i).Cat~=4
    NF=length(Data(i).frame);

        Col=A(ceil(rand*length(A(:,1))),:);
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