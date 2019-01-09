function NSTA=SubStructs(NSTA1,NSTA2)


    
        
            
            names=fieldnames(NSTA1);
           
            T=length(NSTA1);
             for i=1:T
            NSTA(i).name=names{i+1};
             end
            for i=2:length(names)
                for i2=1:T
                    NSTA(i2).(names{i})=NSTA1(i2).(names{i})-NSTA2(i2).(names{i});
                end
            end
       
    

