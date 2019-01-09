function Struct=AssembleCorrStruct(Data,names)

CD=corr(Data);
    for i=1:length(names)
        for i2=1:length(names)
            Struct(i2).name=names{i2};
            %Xfstr.(names{i})=Xfull(:,i).';
            Struct(i2).(names{i})=CD(i2,i);
            
        end
    end