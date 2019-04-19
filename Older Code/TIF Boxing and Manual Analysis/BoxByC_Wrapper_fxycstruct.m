function BoxByC_Wrapper_fxycstruct(file,movie,newfile,style,split,varargin)
%Style=1 means color all by class, Style=2 mean color non-4s randomly
load(file)
if split
    fxyc_struct=SplitFXYC_Struct(fxyc_struct);
end
if style==1
    A=distinguishable_colors(7,[0 0 0]);
elseif style==2
    A=distinguishable_colors(5000,[0 0 0]);
end
MaxC=7;
Cs=[];
events=[];
N=length(fxyc_struct);
L=0;
for i=1:N
    C=fxyc_struct(i).class;
    if C~=4 || style==1
        L=L+length(fxyc_struct(i).frame);
    end
end
events=zeros(L,3);
Cs=zeros(L,3);
ind=1;
for i=1:N
    C=fxyc_struct(i).class;
    if C~=4 || style==1
        if style==1
            Col=A(C,:);
        elseif style==2
            Col=A(ceil(rand*5000),:);
        end
        for i2=1:length(fxyc_struct(i).frame)
            events(ind,:)=[fxyc_struct(i).frame(i2) fxyc_struct(i).xpos(i2) fxyc_struct(i).ypos(i2)];
            Cs(ind,:)=Col;
            ind=ind+1;
        end
    end
end

BoxEventsColors(movie,newfile,events,Cs,varargin{:});