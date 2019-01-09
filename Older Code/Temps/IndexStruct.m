function [FileC,areas]=IndexStruct(stru,inds)

FileC={};
areas=[];
ind=1;
for i=1:length(inds)
    FileC{i}=stru(inds(i)).file;
    areas(i)=stru(inds(i)).area;
end
