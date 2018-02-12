function NSTAf=MakeTestNSTA

Tnum=1000;
Frames=300;
Cutoff=125;
Trace=[1 2 3 4 5 5.01 5.02 5.01 5 4 3 2 1];
BeforeZ=[1 2 3 4 5 6 7 6 5 4 3 2 1];
AfterZ=BeforeZ*.1;
for i=1:Tnum
    start=ceil(rand*(Frames-length(Trace)));
    for i2=1:length(Trace)
        NSTAf(i).frame=(start:start+length(Trace)-1)';
        NSTAf(i).int=Trace';
        NSTAf(i).xpos=ones(1,length(Trace))';
        NSTAf(i).ypos=NSTAf(i).xpos;
        if start<Cutoff
            NSTAf(i).st=BeforeZ';
        else
            NSTAf(i).st=AfterZ';
        end
        NSTAf(i).class=0;
    end
end