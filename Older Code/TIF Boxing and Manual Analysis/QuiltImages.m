function Quilt=QuiltImages(IMs,GridLines)
    
    for i=1:length(IMs)
        [A(i),B(i)]=size(IMs{i});
        MI=max(max(IMs{i}));
    end
    M=max([max(A) max(B)]);
    MInt=max(MI);
    for i=1:length(IMs)
        IM=IMs{i};
        PIM{i}=PadImageToSize(IM,M,M);
    end
    Grid=ceil(sqrt(length(IMs)));
    for i=1:Grid^2-length(IMs)
        PIM{i+length(IMs)}=zeros(M,M);
    end
    Quilt=[];
    if ~GridLines
        for ix=1:Grid
            Col=[];
            for iy=1:Grid
                Num=(iy-1)*Grid+ix;
                Col=[Col ; PIM{Num}];
            end
            Quilt=[Quilt Col];
        end
    else
        for ix=1:Grid
            Col=[];
            for iy=1:Grid
                Num=(iy-1)*Grid+ix;
                Col=[Col ; uint16(zeros(1,M))+MInt ; PIM{Num}];
            end
            Quilt=[Quilt uint16(zeros(length(Col(:,1)),1))+MInt Col];
        end
    end