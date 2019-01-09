function BoxEventsColors_RGB(file,newfile,events,Cs)
%Draws boxes around events in tif, specified by fxy matrix

frames=length(imfinfo(file));
A=imread(file,'Index',1);
Bright=double(max(max(max(A))));
for i0=1:frames
    A=imread(file,'Index',i0);
    [Y,X]=size(A);
    B=A;
    used=find(events(:,1)==i0);
    for i=1:length(used)
        x=round(events(used(i),2));
        y=round(events(used(i),3));
        Cr=Cs(used(i),1);
        Cg=Cs(used(i),2);
        Cb=Cs(used(i),3);
        if x~=0 && y~=0
            for xoff=-4:4
                for yoff=-4:4
                    if (abs(xoff)==4 || abs(yoff)==4) && x+xoff>0 && x+xoff<=X && y+yoff>0 && y+yoff<=Y
                        B(y+yoff,x+xoff,1)=round(Bright*Cr);
                        B(y+yoff,x+xoff,2)=round(Bright*Cg);
                        B(y+yoff,x+xoff,3)=round(Bright*Cb);
                    end
                end
            end
        end
    end
    
    imwrite(B,newfile,'Writemode','append','Compression','none')
end