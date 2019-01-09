function [IM,varargout]=AllTraceKymograph(FXYCMS,Sorting,norm,varargin)

if strcmp(Sorting,'LT')
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        L(i)=length(fxyc(:,1));
    end
    
    IM=zeros(length(FXYCMS),100,3);
    ind=1;
    % for i=1:length(FXYCMS)
    %     fxyc=FXYCMS{i};
    %     for i2=1:length(fxyc(:,1))
    %         IM(i,i2,1)=fxyc(i2,6);
    %         IM(i,i2,3)=fxyc(i2,7);
    %     end
    % end
    for i=min(L):max(L)
        u=find(L==i);
        for i2=1:length(u)
            fxyc=FXYCMS{u(i2)};
            if norm
                Mr=max(fxyc(:,6));
                Mg=max(fxyc(:,7));
            else
                Mr=1;
                Mg=1;
            end
            for i3=1:length(fxyc(:,1))
                IM(ind,i3,1)=fxyc(i3,6)/Mr;
                IM(ind,i3,2)=fxyc(i3,7)/Mg;
            end
            ind=ind+1;
        end
    end
end
if strcmp(Sorting,'LTCoh')
    Edges=[10 15 30 45 60 75];
    
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        L(i)=length(fxyc(:,1));
    end
    for i=1:length(Edges)
        cIM{i}=zeros(length(FXYCMS),100,3);
        ind(i)=1;
    end
    % for i=1:length(FXYCMS)
    %     fxyc=FXYCMS{i};
    %     for i2=1:length(fxyc(:,1))
    %         IM(i,i2,1)=fxyc(i2,6);
    %         IM(i,i2,3)=fxyc(i2,7);
    %     end
    % end
    for i=min(L):max(L)
        C=find(Edges<=i,1,'last');
        if ~isempty(C)
            c=C(1);
            
            u=find(L==i);
            for i2=1:length(u)
                fxyc=FXYCMS{u(i2)};
                if norm
                    Mr=max(fxyc(:,6));
                    Mg=max(fxyc(:,7));
                else
                    Mr=1;
                    Mg=1;
                end
                for i3=1:length(fxyc(:,1))
                    cIM{c}(ind(c),i3,1)=fxyc(i3,6)/Mr;
                    cIM{c}(ind(c),i3,2)=fxyc(i3,7)/Mg;
                end
                ind(c)=ind(c)+1;
            end
        end
    end
    IM=[];
    for i=1:length(Edges)
        IM=[IM cIM{i}(1:max(ind),:,:)];
    end
end
if strcmp(Sorting,'AC')
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        Mg=max(fxyc(:,7));
        Mr=max(fxyc(:,6));
        AC=(fxyc(:,7)/Mg)./(fxyc(:,6)/Mr);
        f=find(AC>=1,1,'first');
        L(i)=f(1);
    end
    
    IM=zeros(length(FXYCMS),100,3);
    ind=1;
    % for i=1:length(FXYCMS)
    %     fxyc=FXYCMS{i};
    %     for i2=1:length(fxyc(:,1))
    %         IM(i,i2,1)=fxyc(i2,6);
    %         IM(i,i2,3)=fxyc(i2,7);
    %     end
    % end
    for i=min(L):max(L)
        u=find(L==i);
        for i2=1:length(u)
            fxyc=FXYCMS{u(i2)};
            if norm
                Mr=max(fxyc(:,6));
                Mg=max(fxyc(:,7));
            else
                Mr=1;
                Mg=1;
            end
            for i3=1:length(fxyc(:,1))
                IM(ind,i3,1)=fxyc(i3,6)/Mr;
                IM(ind,i3,2)=fxyc(i3,7)/Mg;
            end
            ind=ind+1;
        end
    end
end
MatR=IM(:,:,1);
MatG=IM(:,:,2);
if nargin==3
    
    Mg=median(nonzeros(MatG(:)));

    Mr=median(nonzeros(MatR(:)));
    Ng=10000/Mg;
    Nr=10000/Mr;
else
    Nr=varargin{1};
    Ng=varargin{2};
end
IM(:,:,1)=MatR*Nr;
IM(:,:,2)=MatG*Ng;
varargout{1}=Nr;
varargout{2}=Ng;
IM=uint16(IM);