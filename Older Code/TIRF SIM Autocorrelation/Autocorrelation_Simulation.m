IM=zeros(100);
for i=1:10
    mu=[rand*100 rand*100];
    Sigma=[[4 0];[0 4]];
    for ix=1:100
        for iy=1:100
            IM(ix,iy) = IM(ix,iy)+mvnpdf([ix iy],mu,Sigma);
        end
    end
end

AutocorrelationFig(IM)
subplot(2,2,1)
title('Original Image, SD=2')
subplot(2,2,4)
ylim([0 1])
subplot(2,2,2)
xlim([0 10])