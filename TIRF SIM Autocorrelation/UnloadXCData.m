function [FWHMs,XCRs,Groups]=UnloadXCData(FWHMs,XCRs,Groups,Protein,FWHM,XC,Group,Subset)

if strcmp(Protein,'AP2')
    G=[1 2];
end
if strcmp(Protein,'CALM')
    G=[3 4];
end
[a,b]=size(FWHM);
if strcmp(Subset,'All')
    for i=2:a
        for i2=1:b
            if ~isempty(FWHM{i,i2})
                FWHMs=[FWHMs ; FWHM{i,i2}];
                XCRs=[XCRs XC(i,i2)];
                Groups=[Groups G(Group(i,i2)+1)];
            end
        end
    end
end
if strcmp(Subset,'First')
    for i=2:a
        i2=1;
        if ~isempty(FWHM{i,i2})
            FWHMs=[FWHMs ; FWHM{i,i2}];
            XCRs=[XCRs XC(i,i2)];
            Groups=[Groups G(Group(i,i2)+1)];
        end
        
    end
end
if strcmp(Subset,'XCMin')
    for i=2:a
        for i2=1:b
            if ~isempty(FWHM{i,i2}) && XC(i,i2)>=.5
                FWHMs=[FWHMs ; FWHM{i,i2}];
                XCRs=[XCRs XC(i,i2)];
                Groups=[Groups G(Group(i,i2)+1)];
            end
        end
    end
end
if strcmp(Subset,'XCMinFirst')
    for i=2:a
        i2=1;
        if ~isempty(FWHM{i,i2}) && XC(i,i2)>=.5
            FWHMs=[FWHMs ; FWHM{i,i2}];
            XCRs=[XCRs XC(i,i2)];
            Groups=[Groups G(Group(i,i2)+1)];
        end
        
    end
end