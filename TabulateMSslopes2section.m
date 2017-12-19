start=0;

BeforeMSslope=[];

AfterMSslope=[];
for i=1:length(INTsF)
    for i2=1:length(INTsF{i})
        if INTsF{i}(i2)<start
            if slopesS{i}(i2)~=0 && slopesM{i}(i2)~=0
                BeforeMSslope=[BeforeMSslope;[slopesM{i}(i2) slopesS{i}(i2) INTsM{i}(i2) INTsS{i}(i2)]];
            end
        else
            
            if slopesS{i}(i2)~=0 && slopesM{i}(i2)~=0
                AfterMSslope=[AfterMSslope;[slopesM{i}(i2) slopesS{i}(i2) INTsM{i}(i2) INTsS{i}(i2)]];
            end
            
        end
    end
end