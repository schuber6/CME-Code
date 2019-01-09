A=distinguishable_colors(7,[0 0 0]);
Cs=[];
events=[];
[~,~,N]=size(Threshfxyc);
for i=1:N
    used=find(Threshfxyc(:,1,i));
    C=Threshfxyc(1,4,i);
    Col=A(C,:);
    for i2=1:length(used)
        events=[events ; [Threshfxyc(i2,1,i) Threshfxyc(i2,2,i) Threshfxyc(i2,3,i)]];
        Cs=[Cs ; Col];
    end
end
folder='E:\CME Superfolder\CME Data\180320_Analysis\orig_movies';
files=FindFiles(folder,'*009*.tif');
newfile=strcat(files{1}(1:end-4),'CBoxes.tif');
BoxEventsColors(files{1},newfile,events,Cs);