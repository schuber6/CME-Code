folder='Z:\Scott\TIRF SIM\Osmo SIM\CALM\0330_W1_26min';
fileG=FindFiles(folder,'*488*cam*');
fileR=FindFiles(folder,'*560*cam*');
%fileO=FindFiles(folder,'*orig*');
fileS=strcat(folder,'\tracest_488.mat');

% tracest=EmptyTracest();  %ONLY UNCOMMENT THESE TEMPORARILY
% save(fileS,'tracest');

load(fileS)
figure_code_for_scott(fileG{1},fileG{1},fileS)