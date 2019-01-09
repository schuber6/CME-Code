function [AV,SD]=ColorMapSH(Mat,Ma,Mi)
    %Colors a map of Mat's data with colormap scaled to mave min Mi and max
    %Ma
    %Outside the cell gets the Lowest (and only negative) value in order to color it
    %distinctly blue
    %Inside the cell, values range from Ma-Max to Ma-Min
    %Higher (more red) values correspond to more clathrin
    %Lower  (more green/yellow) values correspond to more adaptor
    
    [A,B]=size(Mat);
    Vect=reshape(Mat,[1 A*B]);
    used=find(~isnan(Vect));
    AV=mean(Vect(used));
    SD=sqrt(var(Vect(used)));
    for ix=1:A
        for iy=1:B
            if isnan(Mat(ix,iy))
                Mat(ix,iy)=Ma-Mi;
            else
                Mat(ix,iy)=Mat(ix,iy)-Ma;
            end
        end
    end
    Mat(1,1)=Mi-Ma;
    colormap jet
    h=pcolor(-Mat);
    set(h, 'EdgeColor', 'none');
    title(strcat('Average Log A:C= ',num2str(AV),' +/- ',num2str(SD)))