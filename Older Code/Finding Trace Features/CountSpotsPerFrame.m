function [N,varargout]=CountSpotsPerFrame(FXYCMS,Tmast,MinLTF)
    
    N=0;
    Ms=[];
    Ss=[];
    MMs=[];
    MSs=[];
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        MM=max(fxyc(:,6));
        if MM>=Tmast &&  length(fxyc(:,1))>=MinLTF && fxyc(1,4)~=4
            N=N+length(fxyc(:,1));
            Ms=[Ms fxyc(:,6).'];
            Ss=[Ss fxyc(:,7).'];
            MMs=[MMs max(fxyc(:,6))];
            MSs=[MSs max(fxyc(:,7))];
        end
    end
    MF=MaxFrameFXYCMS(FXYCMS);
    N=N/MF;
    varargout{1}=Ms;
    varargout{2}=Ss;
    varargout{3}=MMs;
    varargout{4}=MSs;