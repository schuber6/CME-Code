function CoverEvents(file,newfile,events)
%Draws boxes around events in tif, specified by fxy matrix

frames=length(imfinfo(file));
A=imread(file,'Index',1);
Bright=max(max(A));
for i0=1:frames
    A=imread(file,'Index',i0);
    [Y,X]=size(A);
    B=A;
    used=find(events(:,1)==i0);
    for i=1:length(used)
        x=round(events(used(i),2));
        y=round(events(used(i),3));
        if x~=0 && y~=0
            for xoff=-3:3
                for yoff=-3:3
                    if x+xoff>0 && x+xoff<=X && y+yoff>0 && y+yoff<=Y
                        B(y+yoff,x+xoff)=0;

                    end
                end
            end
        end
    end
    
    imwrite(B,newfile,'Writemode','append','Compression','none')
end