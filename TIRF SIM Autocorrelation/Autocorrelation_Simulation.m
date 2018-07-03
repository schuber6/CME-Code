IM=zeros(100);
for i=1:25
    mu=[rand*100 rand*100];
    Sigma=[[4 0];[0 4]];
    for ix=1:100
        for iy=1:100
            IM(ix,iy) = IM(ix,iy)+mvnpdf([ix iy],mu,Sigma);
        end
    end
end

AutocorrelationFig(IM)