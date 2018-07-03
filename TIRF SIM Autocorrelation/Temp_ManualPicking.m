folder='Z:\Scott\TIRF SIM\Control SIM Movies\CALM\0330_W1_145705';
fileG=FindFiles(folder,'*488*cam*');
fileR=FindFiles(folder,'*560*cam*');
fileO=FindFiles(folder,'*orig*');
fileS=strcat(folder,'\tracest_488.mat');
%load(fileS)
% tracest=EmptyTracest();  %ONLY UNCOMMENT THESE TEMPORARILY
% save(fileS,'tracest');
figure_code_for_scott(fileG{1},fileO{1},fileS)