function PIM=PadImageToSize(IM,A,B)
    %Pads Image with 0s on right and bottom so that it becomes size AxB
    
    [a,b]=size(IM);
    IM=[IM zeros(a,B-b)];
    PIM=[IM ; zeros(A-a,B)];