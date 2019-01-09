ScaleInt=2;
%CALM stuff
folder='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Traces_Fixed\Good';
newfig=1;
colorc='r--';
coloro='r';
controlvect=1:5;
[Mc,Sc,MSrc,MACc,SACc,Samplec,Mo,So,MSro,MACo,SACo,Sampleo]=Mass_QuantifyACRatios_func(folder,controlvect);
PlotACInts_Pooled_func(Mc,Mo,Sc,So,newfig,colorc,coloro,ScaleInt);
%AP2 stuff
newfig=0;
colorc='b--';
coloro='b';
controlvect=1:3;
folder='E:\CME Superfolder\CME Data\180208_AP2CLCa_Data\Traces\Good';
[Mc,Sc,MSrc,MACc,SACc,Samplec,Mo,So,MSro,MACo,SACo,Sampleo]=Mass_QuantifyACRatios_func(folder,controlvect);
PlotACInts_Pooled_func(Mc,Mo,Sc,So,newfig,colorc,coloro,ScaleInt);

subplot(2,2,1)
legend('CALM control','CALM 85% water','Time of Water Addition','AP2 control','AP2 85% water')