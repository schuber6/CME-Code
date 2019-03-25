function BoxByC_tracks(file,movie)

load(file)
N=length(tracks);
A=distinguishable_colors(5000,[0 0 0]);
Cs=[];
events=[];
L=0;
for i=1:N
    if ~tracks(i).isCCP
        L=L+length(tracks(i).t);
    end
end
events=zeros(L,3);
Cs=zeros(L,3);
ind=1;
for i=1:N
    NF=length(tracks(i).t);
    if ~tracks(i).isCCP
        Col=A(ceil(rand*length(A(:,1))),:);
        f=tracks(i).f;
        x=tracks(i).x;
        y=tracks(i).y;
        for i2=1:NF
            events(ind,:)=[f(i2) x(i2) y(i2)];
            Cs(ind,:)=Col;
            ind=ind+1;
        end
    end
end
% folder='E:\CME Superfolder\CME Data\180320_Analysis\orig_movies';
% files=FindFiles(folder,'*009*.tif');

newfile=strcat(movie(1:end-4),'tracksnotCCPBoxes.tif');
BoxEventsColors(movie,newfile,events,Cs);