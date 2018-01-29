function NSTAms=LinkMS(NSTAm,NSTAs)
%Finds brightest spot within 1 px of each master spot and adds its
%parameters to master NSTA.  Assigns sint of 0 if none found
%ONLY WORKS FOR SINGLE STACKS

ind=1;
h=waitbar(0,'Linking channel coincidences');
for i=1:length(NSTAm)
    waitbar(i/length(NSTAm))
    if NSTAm(i).class==0
        x=NSTAm(i).xpos(1);
        y=NSTAm(i).ypos(1);
        sints=[];
        sinds=[];
        for i2=1:length(NSTAs)
            xs=NSTAs(i2).xpos(1);
            ys=NSTAs(i2).ypos(1);
            
            if norm([x-xs y-ys])<=1
                sints=[sints NSTAs(i2).int(1)];
                sinds=[sinds i2];
            end
        end
        clear NSTAtemp
        if ~isempty(sinds)
            best=find(sints==max(sints));
            NSTAtemp=NSTAm(i);
            NSTAtemp.sx=NSTAs(sinds(best(1))).xpos(1);
            NSTAtemp.sy=NSTAs(sinds(best(1))).ypos(1);
            NSTAtemp.sint=NSTAs(sinds(best(1))).int(1);
            NSTAtemp.sind=sinds(best(1));
            NSTAtemp.sclass=NSTAs(sinds(best(1))).class;
            NSTAtemp.sst=NSTAs(sinds(best(1))).st;
            
        else
            NSTAtemp=NSTAm(i);
            NSTAtemp.sx=0;
            NSTAtemp.sy=0;
            NSTAtemp.sint=0;
            NSTAtemp.sind=0;
            NSTAtemp.sclass=-1;
            NSTAtemp.sst=0;
            
        end
        NSTAms(ind)=NSTAtemp;
        ind=ind+1;
    end
end
close(h)
        