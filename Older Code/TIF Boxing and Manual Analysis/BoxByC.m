function BoxByC(file,movie,Cols)

load(file)
A=distinguishable_colors(7,[0 0 0]);
Cs=[];
events=[];
[~,~,N]=size(Threshfxyc);
L=0;
for i=1:N
    used=find(Threshfxyc(:,1,i));
    C=Cols(i);
    if C<=4 && C>0
        L=L+length(used);
    end
end
events=zeros(L,3);
Cs=zeros(L,3);
ind=1;
for i=1:N
    used=find(Threshfxyc(:,1,i));
    C=Cols(i);
    if C<=4 && C>0
        Col=A(C,:);
        for i2=1:length(used)
            events(ind,:)=[Threshfxyc(i2,1,i) Threshfxyc(i2,2,i) Threshfxyc(i2,3,i)];
            Cs(ind,:)=Col;
            ind=ind+1;
        end
    end
end
% folder='E:\CME Superfolder\CME Data\180320_Analysis\orig_movies';
% files=FindFiles(folder,'*009*.tif');

newfile=strcat(movie(1:end-4),'MLCBoxes.tif');
BoxEventsColors(movie,newfile,events,Cs);