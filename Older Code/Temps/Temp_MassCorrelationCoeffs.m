clear all
exp_name='E:\CME Superfolder\CME Data\170907_CALM_CLCa_1StackOsmo';
%exp_name='E:\CME Superfolder\CME Data\170520_AP2CLCA_SingleStackOsmo\170520_Analysis\movies';
omd=fullfile(exp_name);
rbins=1:50;
rbins=rbins/50*5;
ZzC=cell(1,5);
for i0=2:4
    SM=strcat('*00',num2str(i0),'_GFP_BS_Stack*ZFit.mat');
    %SS=strcat('*00',num2str(i0),'_RFP_BS_Stack*mat');
tmpdm = dir(fullfile(omd,SM));
%tmpds = dir(fullfile(omd,SS));
    XL=[0 0];
    YL=[0 0];
    clear t
    Xfull=[];
    for i=1:6 %length(tmpdm)
        %subplot(3,ceil(length(tmpdm)/3),i)
        moviesM{i} = fullfile(omd,tmpdm(i).name);
        
        load(moviesM{i})
        [X,names]=NSTA2Mat(NSTAms);
        used=find([NSTAms.class]==0 & [NSTAms.sclass]==0);
        X=X(used,:);
        [Xfs,names]=FilterData(X,names);
        [A,B]=size(Xfs);
        Stack=zeros(A,1)+i;
        Xfs=[Xfs Stack];
        names{end+1}='Stack';
        Xfull=[Xfull ; Xfs];
    end
    Xfulls_CALM{i0}=Xfull;
    Cor{i0}=corr(Xfull);
    for i=1:length(names)
        for i2=1:length(names)
            Cors(i2).name=names{i2};
        %Xfstr.(names{i})=Xfull(:,i).';
        Cors(i2).(names{i})=Cor{i0}(i2,i);
        
        end
    end
    CorST{i0}=Cors;
    %XFST{i0}=Xfstr;
    clear Xfstr
    
    
end
CALM_CST=CorST;
CALM_Av=AvStructs(CALM_CST);
clear CorST

%exp_name='E:\CME Superfolder\CME Data\170907_CALM_CLCa_1StackOsmo';
exp_name='E:\CME Superfolder\CME Data\170520_AP2CLCA_SingleStackOsmo\170520_Analysis\movies';
omd=fullfile(exp_name);
rbins=1:50;
rbins=rbins/50*5;
ZzC=cell(1,5);
for i0=1:3
    SM=strcat('*00',num2str(i0),'_GFP_BS_Stack*ZFit.mat');
    %SS=strcat('*00',num2str(i0),'_RFP_BS_Stack*mat');
tmpdm = dir(fullfile(omd,SM));
%tmpds = dir(fullfile(omd,SS));
    XL=[0 0];
    YL=[0 0];
    clear t
    Xfull=[];
    for i=1:6 %length(tmpdm)
        %subplot(3,ceil(length(tmpdm)/3),i)
        moviesM{i} = fullfile(omd,tmpdm(i).name);
        
        load(moviesM{i})
        [X,names]=NSTA2Mat(NSTAms);
        used=find([NSTAms.class]==0 & [NSTAms.sclass]==0);
        X=X(used,:);
        [Xfs,names]=FilterData(X,names);
        [A,B]=size(Xfs);
        Stack=zeros(A,1)+i;
        Xfs=[Xfs Stack];
        names{end+1}='Stack';
        Xfull=[Xfull ; Xfs];
    end
    Xfulls_AP2{i0}=Xfull;
    Cor{i0}=corr(Xfull);
    for i=1:length(names)
        for i2=1:length(names)
            Cors(i2).name=names{i2};
        %Xfstr.(names{i})=Xfull(:,i).';
        Cors(i2).(names{i})=Cor{i0}(i2,i);
        
        end
    end
    CorST{i0}=Cors;
    %XFST{i0}=Xfstr;
    clear Xfstr
    
    
end
AP2_CST=CorST;
AP2_Av=AvStructs(AP2_CST);


NSTA=SubStructs(CALM_Av,AP2_Av);