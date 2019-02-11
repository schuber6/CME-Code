function N=IntensityNormalization(fxyc,varargin)
%max intensity 
%mean intensity
%median intensity (default)
%Nth prctile of spots
%median max of internalizations
%90th prctile of internalizations maxs

n=length(fxyc(1,1,:));
Ls=zeros(1,n);
for i=1:n
    Ls(i)=length(nonzeros(fxyc(:,1,i)));
end
used=find(Ls>=4);
fxyc=fxyc(:,:,used);

if length(varargin)==0
    modeN=4;
else
    modeN=varargin{1};
    if length(varargin)==1
        p=90;
    else
        p=varargin{2};
    end
end

if modeN==1
   As=fxyc(:,5,:);
   V=nonzeros(As(:));
   N=max(V);
   return
end
if modeN==2
   As=fxyc(:,5,:);
   V=nonzeros(As(:));
   N=mean(V);
   return
end
if modeN==3
   As=fxyc(:,5,:);
   V=nonzeros(As(:));
   N=median(V);
   return
end
if modeN==4
   As=fxyc(:,5,:);
   V=nonzeros(As(:));
   N=prctile(V,p);
   return
end
used=find(fxyc(1,4,:)==2 | fxyc(1,4,:)==3);
MA=zeros(1,length(used));
for i=1:length(used)
    MA(i)=max(fxyc(:,5,used(i)));
end
if modeN==5
    N=median(MA);
end
if modeN==6
    N=prctile(MA,90);
end