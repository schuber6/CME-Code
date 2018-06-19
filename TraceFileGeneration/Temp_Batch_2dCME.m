fg=zeros(1,5) +2;
thresh=fg*400/2;

j1=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 SI',fg,thresh})
j2=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 WT',fg,thresh})
j3=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI',fg,thresh})
j4=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI',fg,thresh})