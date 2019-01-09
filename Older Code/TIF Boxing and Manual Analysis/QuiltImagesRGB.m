function Quilt=QuiltImagesRGB(IMs,GridLines,varargin)
    
    if length(varargin)==0
        AR=1;
    else
        AR=varargin{1};
    end
    for i=1:length(IMs)
        [A(i),B(i),~]=size(IMs{i});
        MI(i)=max(max(max(IMs{i})));
    end
    M=max([max(A) max(B)]);
    MInt=max(MI);
    for i=1:length(IMs)
        IM=IMs{i};
        PIM{i}(:,:,1)=PadImageToSize(IM(:,:,1),M,M);
        PIM{i}(:,:,2)=PadImageToSize(IM(:,:,2),M,M);
        PIM{i}(:,:,3)=PadImageToSize(IM(:,:,3),M,M);
    end
    GridY=ceil(sqrt(length(IMs)/AR));
    GridX=ceil(length(IMs)/GridY);
    Grid=ceil(sqrt(length(IMs)));
    for i=1:GridX*GridY-length(IMs)
        PIM{i+length(IMs)}=zeros(M,M,3);
    end
    Quilt=[];
    if ~GridLines
        for ix=1:GridX
            Col=[];
            for iy=1:GridY
                Num=(iy-1)*Grid+ix;
                Col=[Col ; PIM{Num}];
            end
            Quilt=[Quilt Col];
        end
    else
        for ix=1:GridX
            Col=[];
            for iy=1:GridY
                Num=(iy-1)*GridX+ix;
                Col=[Col ; uint16(zeros(1,M,3))+MInt ; PIM{Num}];
            end
            Quilt=[Quilt uint16(zeros(length(Col(:,1)),1,3))+MInt Col];
        end
    end