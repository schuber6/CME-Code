function Display3dFitData(zstacks,trace,ind,movie,NSTA)

Window=5;
HW=floor(Window/2);

frame=NSTA(trace).frame(ind);
x=round(NSTA(trace).xpos(ind));
y=round(NSTA(trace).ypos(ind));
st=NSTA(trace).st(ind);
int=NSTA(trace).int(ind);
weight=NSTA(trace).weight(ind);
if zstacks==10
    for i=1:10
        IM=imread(movie,'Index',zstacks*(frame-1)+i);
        crop{i}=IM(y-HW:y+HW,x-HW:x+HW);
        
        
        
    end
    crops=[];
    crops2=[];
    for i=1:5 
        crops=[crops crop{i}];
    end
    for i=6:10 
        crops2=[crops2 crop{i}];
    end
    crops=[crops ; crops2];
    imagesc(crops)
    hold on
    for i=1:4
    line([i*5+.5 i*5+.5],[0 10],'Color','g')
    text(0,0,strcat('(F,X,Y)=(',num2str(frame),',',num2str(x),',',num2str(y),')',' (int,st,wei)=(',num2str(int),',',num2str(st),',',num2str(weight),')'))
    end
end