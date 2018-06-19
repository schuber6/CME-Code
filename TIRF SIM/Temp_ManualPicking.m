folder='Z:\Scott\TIRF SIM\Control SIM Movies\AP2\0330_W1_103301';
fileG=FindFiles(folder,'*488*cam*');
fileR=FindFiles(folder,'*560*cam*');
fileS=strcat(folder,'\TST.mat');
% tracest=EmptyTracest();  %ONLY UNCOMMENT THESE TEMPORARILY
% save(fileS,'tracest');
figure_code_for_scott(fileR{1},fileG{1},fileS)