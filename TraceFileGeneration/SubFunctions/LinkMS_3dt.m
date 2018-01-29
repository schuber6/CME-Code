function NSTAms=LinkMS_3dt(NSTAm,NSTAs)
%Finds brightest spot within 1 px of each master spot and adds its
%parameters to master NSTA.  Assigns sint of 0 if none found

Fs=[];
Xs=[];
Ys=[];
for i=1:length(NSTAs)
    for i2=1:length(NSTAs(i).frame)
        Fs(i,i2)=NSTAs(i).frame(i2);
        Xs(i,i2)=NSTAs(i).xpos(i2);
        Ys(i,i2)=NSTAs(i).ypos(i2);
    end
end


ind=1;
h=waitbar(0,'Linking channel coincidences');
for i=1:length(NSTAm)
    waitbar(i/length(NSTAm))
    if NSTAm(i).class==0
        NSTAtemp.class=0;
        NSTAtemp.frame=[];
        NSTAtemp.xpos=[];
        NSTAtemp.ypos=[];
        NSTAtemp.mint=[];
        NSTAtemp.st=[];
        NSTAtemp.sx=[];
        NSTAtemp.sy=[];
        NSTAtemp.sint=[];
        NSTAtemp.sind=[];
        NSTAtemp.sclass=[];
        NSTAtemp.sst=[];
        for itrace=1:length(NSTAm(i).xpos)
            x=NSTAm(i).xpos(itrace);
            y=NSTAm(i).ypos(itrace);
            f=NSTAm(i).frame(itrace);
            NSTAtemp.frame=[NSTAtemp.frame NSTAm(i).frame(itrace)];
            NSTAtemp.xpos=[NSTAtemp.xpos NSTAm(i).xpos(itrace)];
            NSTAtemp.ypos=[NSTAtemp.ypos NSTAm(i).ypos(itrace)];
            NSTAtemp.mint=[NSTAtemp.mint NSTAm(i).int(itrace)];
            NSTAtemp.st=[NSTAtemp.st NSTAm(i).st(itrace)];
            sints=[];
            sinds=[];
            [usedx,usedy]=find(Fs==f);
            for i2=1:length(usedx)
                
                
                xs=Xs(usedx(i2),usedy(i2));
                ys=Ys(usedx(i2),usedy(i2));
                
                if norm([x-xs y-ys])<=1
                    sints=[sints NSTAs(usedx(i2)).int(usedy(i2))];
                    sinds=[sinds ; [usedx(i2) usedy(i2)]];
                end
                
                
            end
            
            if ~isempty(sinds)
                best=find(sints==max(sints));
                ix=sinds(best(1),1);
                iy=sinds(best(1),2);
                NSTAtemp.sx=[NSTAtemp.sx NSTAs(ix).xpos(iy)];
                NSTAtemp.sy=[NSTAtemp.sy NSTAs(ix).ypos(iy)];
                NSTAtemp.sint=[NSTAtemp.sint NSTAs(ix).int(iy)];
                NSTAtemp.sind=[NSTAtemp.sind ; [ix iy]];
                NSTAtemp.sclass=[NSTAtemp.sclass NSTAs(ix).class];
                NSTAtemp.sst=[NSTAtemp.sst NSTAs(ix).st(iy)];
                
            else
                
                NSTAtemp.sx=[NSTAtemp.sx 0];
                NSTAtemp.sy=[NSTAtemp.sy 0];
                NSTAtemp.sint=[NSTAtemp.sint 0];
                NSTAtemp.sind=[NSTAtemp.sind ; [0 0]];
                NSTAtemp.sclass=[NSTAtemp.sclass -1];
                NSTAtemp.sst=[NSTAtemp.sst 0];
                
            end
            
        end
        NSTAms(ind)=NSTAtemp;
        ind=ind+1;
    end
end
close(h)
        