function NSTA=AvStructs(NSTAc)

count=0;
for i0=1:length(NSTAc)
    if ~isempty(NSTAc{i0})
        count=count+1;
        if count==1
            NSTA=NSTAc{i0};
        else
            NSTA1=NSTAc{i0};
            names=fieldnames(NSTA1);
            T=length(NSTA);
            for i=2:length(names)
                for i2=1:T
                    NSTA(i2).(names{i})=NSTA(i2).(names{i})+NSTA1(i2).(names{i});
                end
            end
        end
    end
end
for i=2:length(names)
    for i2=1:T
    NSTA(i2).(names{i})=NSTA(i2).(names{i})/count;
    end
end
