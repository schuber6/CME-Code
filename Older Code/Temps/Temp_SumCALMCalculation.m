folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\ZStacks';
[Sum_SI,Area,Cyt,Back,ThreshSI]=ZStackSumFlourescence(folder);

%%
folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\ZStacks';
[Sum_WT,Area,Cyt,Back,ThreshWT]=ZStackSumFlourescence(folder);

%%

folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\ZStacks';
[Sum_DSI,Area,Cyt,Back,ThreshDSI]=ZStackSumFlourescence(folder);