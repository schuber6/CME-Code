names{1}='First_Frame';
names{2}='Last_Frame';
names{3}='Lifetime';
names{4}='Max_A_Int';
names{5}='Max_C_Int';
names{6}='Log_Max_A_over_Max_C';
names{7}='Init_A_Int';
names{8}='Init_C_Int';
names{9}='Log_Init_A_over_Init_C';
names{10}='Final_A_Int';
names{11}='Final_C_Int';
names{12}='Log_Final_A_over_Final_C';
names{13}='Init_A_Rate';
names{14}='Init_C_Rate';
names{15}='Final_A_Rate';
names{16}='Final_C_Rate';


Data=PullTraceData(fxycMS);
Cor=corr(Data);
for i=1:length(names)
    for i2=1:length(names)
        Cors(i2).name=names{i2};
        %Xfstr.(names{i})=Xfull(:,i).';
        Cors(i2).(names{i})=Cor(i2,i);
        
    end
end