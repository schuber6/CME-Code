function BoxEvents_FirstFrame(file,newfile,events)
%Draws boxes around events in tif, specified by fxy matrix

frames=1;
A=imread(file,'Index',1);
Bright=max(max(A));
for i0=1:frames
    A=imread(file,'Index',i0);
    [Y,X]=size(A);
    B(:,:,1)=A;
    B(:,:,2)=A;
    B(:,:,3)=A;
    used=find(events(:,1)==i0);
    for i=1:length(used)
        x=round(events(used(i),2));
        y=round(events(used(i),3));
        if x~=0 && y~=0
            for xoff=-4:4
                for yoff=-4:4
                    if (abs(xoff)==4 || abs(yoff)==4) && x+xoff>0 && x+xoff<=X && y+yoff>0 && y+yoff<=Y
                        B(y+yoff,x+xoff,1)=Bright;
                        B(y+yoff,x+xoff,2)=0;
                        B(y+yoff,x+xoff,3)=0;
                    end
                end
            end
        end
    end
    
    imwrite(B,newfile,'Writemode','append','Compression','none')
end