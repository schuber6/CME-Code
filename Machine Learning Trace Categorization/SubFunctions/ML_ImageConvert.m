file='E:\CME Superfolder\CME Data\FakeTIRFSIM\tirf_009.tif';
newpath='E:\CME Superfolder\CME Data\FakeTIRFSIM\009';
for i=1:length(imfinfo(file))
    Channel=mod(i,2);
    num=ceil((i)/2);
    if Channel==0
        name=strcat('R',num2str(num,'%03.f'));
    else
        name=strcat('G',num2str(num,'%03.f'));
    end
    newfile{i}=strcat(newpath,'\',name,'.tif');
end
for i=1:30
    IM=imread(file,'Index',i);
    IM2=imresize(IM,2);
    M=max(max(IM2));
    IM3=double(IM2)*255/double(M);
    IM4=uint8(IM3);
    imwrite(IM4,newfile{i})
end

%%  Put output images back into tif stacks

file='E:\CME Superfolder\CME Data\FakeTIRFSIM\tirf_009.tif';
newfileG='E:\CME Superfolder\CME Data\FakeTIRFSIM\tirf_009_Proc_G.tif';
Path='E:\CME Superfolder\CME Data\FakeTIRFSIM\009_Processed';
for i=1:15
    name=strcat('G',num2str(i,'%03.f'));
    p=strcat(Path,'\',name,'\','Network.png');
    IM=imread(p);
    imwrite(IM,newfileG,'Writemode','append','Compression','none')
end
newfileR='E:\CME Superfolder\CME Data\FakeTIRFSIM\tirf_009_Proc_R.tif';
Path='E:\CME Superfolder\CME Data\FakeTIRFSIM\009_Processed';
for i=1:15
    name=strcat('R',num2str(i,'%03.f'));
    p=strcat(Path,'\',name,'\','Network.png');
    IM=imread(p);
    imwrite(IM,newfileR,'Writemode','append','Compression','none')
end
