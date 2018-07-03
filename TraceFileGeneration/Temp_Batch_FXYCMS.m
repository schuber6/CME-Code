Traces{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 SI\Traces';
Traces{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 WT\Traces';
Traces{3}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Traces';
Traces{4}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Traces';

Movies{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 SI\Movies';
Movies{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 WT\Movies';
Movies{3}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
Movies{4}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';

for i=1:3
    jC{i}=batch(@MasterSlave_RedMaster,0,{Traces{i},Movies{i}});
end

%% Run after cmeAnalysis finishes this folder and you reformat
i=4;
jC{i}=batch(@MasterSlave_RedMaster,0,{Traces{i},Movies{i}});

%%
Traces{5}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Traces';
Movies{5}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies';

jC{5}=batch(@MasterSlave_RedMaster,0,{Traces{5},Movies{5}});

Traces{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 SI\Traces';
Traces{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 WT\Traces';
Traces{3}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Traces';
Traces{4}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Traces';

Movies{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 SI\Movies';
Movies{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 WT\Movies';
Movies{3}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
Movies{4}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';

for i=1:4
    jC{i}=batch(@MasterSlave_GreenMaster,0,{Traces{i},Movies{i}});
end
