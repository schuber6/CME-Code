function events=BoxACRatios(NSTAfiles,Movie)
%Finds mean and standard deviation of Log A:C ratio of all spots

planes=5;
events=[];
for i0=1:length(NSTAfiles)
    load(NSTAfiles{i0})
    for i=1:length(NSTAms)
        if NSTAms(i).sclass==0 && NSTAms(i).class==0
            x=NSTAms(i).xpos(1);
            y=NSTAms(i).ypos(1);
            for i2=1:planes
                events=[events ; [(i0-1)*planes+i2 x y]];
            end

        end
    end

end
newfile=strcat(Movie(1:end-4),'_Boxes.tif');
BoxEvents(Movie,newfile,events)