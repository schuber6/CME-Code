LsI=[];
LsZ=[];
LvI=[];
LvZ=[];
LvF=[];
LsD=[];
LmI=[];
num=0;
h=waitbar(0,'Listing Slopes');
for i=1:length(slopesINT)
    %waitbar(i/length(slopesINT))
    for i2=1:length(slopesINT{i})
        if slopesINT{i}(i2)~=0 && minint{i}(i2)>=1000
            num=num+1;
%             LsI=[LsI slopesINT{i}(i2)];
%             LsZ=[LsZ slopesZ{i}(i2)];
%             LvI=[LvI INTcell{i}(i2)];
%             LmI=[LmI minint{i}(i2)];
%             LvZ=[LvZ Zcell{i}(i2)];
%             LvF=[LvF Fcell{i}(i2)];
%             d1=[NSTA(inds(i)).xpos(i2-2) NSTA(inds(i)).ypos(i2-2)]; %May need to change for different frame rates
%             d2=[NSTA(inds(i)).xpos(i2+1) NSTA(inds(i)).ypos(i2+1)];
%             LsD=[LsD norm(d1-d2)];

        end
    end
end
LsI=zeros(1,num);
LsZ=zeros(1,num);
LvI=zeros(1,num);
LmI=zeros(1,num);
LvZ=zeros(1,num);
LvF=zeros(1,num);
LsD=zeros(1,num);
num=0;
for i=1:length(slopesINT)
    waitbar(i/length(slopesINT))
    for i2=1:length(slopesINT{i})
        if slopesINT{i}(i2)~=0 && minint{i}(i2)>=1000
            num=num+1;
            LsI(num)=slopesINT{i}(i2);
            LsZ(num)=slopesZ{i}(i2);
            LvI(num)=INTcell{i}(i2);
            LmI(num)=minint{i}(i2);
            LvZ(num)=Zcell{i}(i2);
            LvF(num)=Fcell{i}(i2);
            d1=[NSTA(inds(i)).xpos(i2-2) NSTA(inds(i)).ypos(i2-2)]; %May need to change for different frame rates
            d2=[NSTA(inds(i)).xpos(i2+1) NSTA(inds(i)).ypos(i2+1)];
            LsD(num)=norm(d1-d2);

        end
    end
end
close(h)

