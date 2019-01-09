function [x,y]=ScalePosition(X,Y,Size,size)
    
    x=(X-1)/(Size-1)*(size-1)+1;
    y=(Y-1)/(Size-1)*(size-1)+1;