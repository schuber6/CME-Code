function BoxSingleTraces(fxyc,traces,StartFrames,colors,file,newfile,endL) %adds colored spots to tif stack (named file--rewrites it in a file named newfile) at desired locations--fzzzmmmc is a nzzz4 matrizzz with the n spots--column 1 frame,column 2 zzz position, column 3 mmm position, column 4 color (1 for green, 2 for red)
%traces is a vector with the desired trace numbers
frames=length(imfinfo(file));
h=waitbar(0,'Coloring Images');
A=imread(file,'Index',1);
[n,m]=size(A);
maxtime=length(fxyc(:,1,1));
usedframes=[];
for i=1:length(traces)
usedsing=find(fxyc(:,1,traces(i)));
usedframes=union(fxyc(usedsing,1,traces(i)),usedframes);
end
for i=1:frames
    if i>=min(usedframes)-5 && i<=max(usedframes)+5 %To save time, only color frames near the trace
    clear A B
    A=imread(file,'Index',i);
    [~,~,d]=size(A);
    if d==1
    B(:,:,1)=A;
    B(:,:,2)=A;
    B(:,:,3)=A;
    end
    if d==3
        B(:,:,1)=A(:,:,1);
    B(:,:,2)=A(:,:,2);
    B(:,:,3)=A(:,:,3);
    end
    inds=find(fxyc(1,1,:)==i);
    
    for j=1:length(inds)
        if ismember(inds(j),traces) && i>=StartFrames(find(traces==inds(j),1,'first')) && i<=StartFrames(find(traces==inds(j),1,'first'))+endL-1
        x=fxyc(1,2,inds(j));
        y=fxyc(1,3,inds(j));
        c=fxyc(1,4,inds(j));
        if colors(find(traces==inds(j),1,'first'))==2
        if x~=0 && y~=0
            for xoff=-4:4
                for yoff=-4:4
                    if abs(xoff)==4 || abs(yoff)==4
            B(y+yoff,x+xoff,1)=6000;
            B(y+yoff,x+xoff,2)=0;
            B(y+yoff,x+xoff,3)=0;
                    end
                end
            end
        end
        end
        if colors(find(traces==inds(j),1,'first'))==1
        if x~=0 && y~=0
            for xoff=-4:4
                for yoff=-4:4
                    if abs(xoff)==4 || abs(yoff)==4
            B(y+yoff,x+xoff,1)=0;
            B(y+yoff,x+xoff,2)=6000;
            B(y+yoff,x+xoff,3)=0;
                    end
                end
            end
        end
        end
        end
    end
    for time=2:maxtime
        inds=find(fxyc(time,1,:)==i);
        for j=1:length(inds)
            if ismember(inds(j),traces) && i>=StartFrames(find(traces==inds(j),1,'first')) && i<=StartFrames(find(traces==inds(j),1,'first'))+endL-1
            t=time;
            c=fxyc(time,4,inds(j));
            
            Tlength=length(find(fxyc(:,1,inds(j))));
            while t==time  %Draw lines to all previous points on trace
                p2=[fxyc(t,3,inds(j)) fxyc(t,2,inds(j))];
                p1=[fxyc(t-1,3,inds(j)) fxyc(t-1,2,inds(j))];
                int=fxyc(t,5,inds(j));
                p=PointsInLine(p1,p1);
                if p1(1)~=0 && p1(2)~=0 && p2(1)~=0 && p2(2)~=0
                    for k=2:length(p(:,1))
                        y=p(k,1);
                        x=p(k,2);
                        if colors(find(traces==inds(j),1,'first'))==2
                        for xoff=-4:4
                            for yoff=-4:4
                                if abs(xoff)==4 || abs(yoff)==4
                                    B(y+yoff,x+xoff,1)=6000;
                                    B(y+yoff,x+xoff,2)=0;
                                    B(y+yoff,x+xoff,3)=0;
                                end
                            end
                        end
                        end
                        if colors(find(traces==inds(j),1,'first'))==1
                        for xoff=-4:4
                            for yoff=-4:4
                                if abs(xoff)==4 || abs(yoff)==4
                                    B(y+yoff,x+xoff,1)=0;
                                    B(y+yoff,x+xoff,2)=6000;
                                    B(y+yoff,x+xoff,3)=0;
                                end
                            end
                        end
                        end
                    end
                end
                t=t-1;
                
            end
            end
        end
    
%         if y>=3 && x>=2 && y<=n-3 && x<=m-3
%             %B(y-2,x,1)=1000;
%             %B(y-2,x,2)=1000;
%             %B(y-2,x,3)=1000;
%         for k=1:4
%             if c==2
%                 B(y+mod(k,2),x+floor((k-1)/2),1)=3000;
%                 B(y+mod(k,2),x+floor((k-1)/2),2)=0;
%             end
%             if c==1
%                 B(y+mod(k,2),x+floor((k-1)/2),1)=0;
%                 B(y+mod(k,2),x+floor((k-1)/2),2)=3000;
%             end
%             B(y+mod(k,2),x+floor((k-1)/2),3)=0;
%         end
%         B(y-1,x,1)=1000;
%         B(y-1,x,2)=1000;
%         B(y-1,x,3)=1000;
%         B(y,x-1,1)=1000;
%         B(y,x-1,2)=1000;
%         B(y,x-1,3)=1000;
%         B(y+1,x-1,1)=1000;
%         B(y+1,x-1,2)=1000;
%         B(y+1,x-1,3)=1000;
%         B(y+2,x,1)=1000;
%         B(y+2,x,2)=1000;
%         B(y+2,x,3)=1000;
%         B(y+2,x+1,1)=1000;
%         B(y+2,x+1,2)=1000;
%         B(y+2,x+1,3)=1000;
%         B(y+1,x+2,1)=1000;
%         B(y+1,x+2,2)=1000;
%         B(y+1,x+2,3)=1000;
%         B(y,x+2,1)=1000;
%         B(y,x+2,2)=1000;
%         B(y,x+2,3)=1000;
%         B(y-1,x+1,1)=1000;
%         B(y-1,x+1,2)=1000;
%         B(y-1,x+1,3)=1000;
%         end
    
    end
    imwrite(B,newfile,'Writemode','append','Compression','none')
    waitbar(i/frames)
    end
end
close(h);