function [Data,varargout]=FXYC2Data(movie,file,framegap,varargin)

if length(varargin)==0
    Cls=7;
else
    Cls=varargin{1};
end
if ischar(file)
    load(file,'Threshfxyc')
else
    Threshfxyc=file;
end
MF=length(imfinfo(movie));
for i=1:MF
    IM(:,:,i)=imread(movie,'Index',i);
end

R=2;

%i=1;
%i2=1;
h=waitbar(0,'Gathering Trace Data');
%T=4422;
%used=find(Decisions(:,1)==T);
L=[];
for i=1:length(Threshfxyc(1,1,:))
    L(i)=length(nonzeros(Threshfxyc(:,1,i)));
end
C4=Threshfxyc(1,4,:)<=Cls;
used0=find(C4(:) & L(:)>=4);
varargout{1}=used0;
L=0;
for i=1:length(used0)
    T=used0(i);
    L=L+length(Threshfxyc(:,1,T))+2;
end
events=zeros(L,3);
ind=1;
for i=1:length(used0)
    T=used0(i);
    fxyc=Threshfxyc(:,:,T);
    used=find(fxyc(:,1));
    fxyc=fxyc(used,:);
    
    if fxyc(1,1)~=1 && max(fxyc(:,1))~=MF
        Fs=[fxyc(1,1)-1 ; fxyc(:,1) ; fxyc(end,1)+1];
        xs=[fxyc(1,2) ; fxyc(:,2) ; fxyc(end,2)];
        ys=[fxyc(1,3) ; fxyc(:,3) ; fxyc(end,3)];
    else
        if fxyc(1,1)==1 && max(fxyc(:,1))~=MF
            Fs=[fxyc(:,1) ; fxyc(end,1)+1];
            xs=[fxyc(:,2) ; fxyc(end,2)];
            ys=[fxyc(:,3) ; fxyc(end,3)];
        else
            if fxyc(1,1)~=1 && max(fxyc(:,1))==MF
                Fs=[fxyc(1,1)-1 ; fxyc(:,1)];
                xs=[fxyc(1,2) ; fxyc(:,2)];
                ys=[fxyc(1,3) ; fxyc(:,3)];
            else
                if fxyc(1,1)==1 && max(fxyc(:,1))==MF
                    Fs=[fxyc(:,1)];
                    xs=[fxyc(:,2)];
                    ys=[fxyc(:,3)];
                end
            end
        end
    end
        
    Xs=round(xs);
    Ys=round(ys);
    for i2=1:length(Fs)
        f=Fs(i2);
        x=Xs(i2);
        y=Ys(i2);
        events(ind,:)=[f x y];
        ind=ind+1;
    end
end
[MIs,~]=ManualFitEvents_BackR(events,movie,2,0,'sum');
ind=1;
for i=1:length(used0) %i=used %ceil(rand*2040) %
    waitbar(i/length(used0))
    T=used0(i);
    fxyc=Threshfxyc(:,:,T);
    used=find(fxyc(:,1));
    fxyc=fxyc(used,:);
    A=zeros(1,length(used));
    
    if fxyc(1,1)~=1 && max(fxyc(:,1))~=MF
        Fs=[fxyc(1,1)-1 ; fxyc(:,1) ; fxyc(end,1)+1];
        xs=[fxyc(1,2) ; fxyc(:,2) ; fxyc(end,2)];
        ys=[fxyc(1,3) ; fxyc(:,3) ; fxyc(end,3)];
        Hits=0;
    else
        if fxyc(1,1)==1 && max(fxyc(:,1))~=MF
            Fs=[fxyc(:,1) ; fxyc(end,1)+1];
            xs=[fxyc(:,2) ; fxyc(end,2)];
            ys=[fxyc(:,3) ; fxyc(end,3)];
            Hits=1;
        else
            if fxyc(1,1)~=1 && max(fxyc(:,1))==MF
                Fs=[fxyc(1,1)-1 ; fxyc(:,1)];
                xs=[fxyc(1,2) ; fxyc(:,2)];
                ys=[fxyc(1,3) ; fxyc(:,3)];
                Hits=2;
            else
                if fxyc(1,1)==1 && max(fxyc(:,1))==MF
                    Fs=[fxyc(:,1)];
                    xs=[fxyc(:,2)];
                    ys=[fxyc(:,3)];
                    Hits=3;
                end
            end
        end
    end
    
    Xs=round(xs);
    Ys=round(ys);
    for i2=1:length(Fs)
        f=Fs(i2);
        x=Xs(i2);
        y=Ys(i2);
        A(i2)=MIs(ind);
        ind=ind+1;
    end
    Data(i).A=A;
    Data(i).T=T;
    Data(i).CMED=fxyc(1,4);
    Data(i).frame=Fs;
    Data(i).X=xs;
    Data(i).Y=ys;
    Data(i).framegap=framegap;
    Data(i).Hits=Hits;
end
close(h)