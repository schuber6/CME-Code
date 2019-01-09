function BatchRunTrackingAndMasterSlave(folders,FrameGap)
%Runs both cmeAnalysis tracking and my master-slave intensity calculation
%and organizes Data into a 'Movies' and a 'Traces' folder.  folders should
%be a cell array of folder names, each of which has a number of movies with
%'Red' in the name and the same number of movies with 'Green' in the name

for i=1:length(folders)  %Batch Run 2d cmeAnalysis
    files=FindFiles(folders{i},'*Red*.tif');
    if length(files)~=0
        fg=zeros(1,length(files)) +FrameGap;
        thresh=fg*400/FrameGap;
        j{i}=batch(@comb_run_masterslave,0,{folders{i},fg,thresh});
    end
end

