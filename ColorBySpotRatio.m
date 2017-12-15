fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\pre_z1_003_RFP_BS_10X.tif';
fileSlaveC='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\pre_z1_003_RFP_BS_10X_RatioBox_Min400RFP_Minp8Ratio.tif';
SlaveFrame=3;
fileFXYC='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\pre_z1_003_GFP_BS_10X\orig_movies\Stack_3.mat';
load(fileFXYC)
IM=imread(fileSlave,'Index',SlaveFrame);
A=IM;
B(:,:,1)=A;
B(:,:,2)=A;
B(:,:,3)=A;
movie=1;
R=XYAmAs{movie}(:,3)./XYAmAs{movie}(:,4);
medR=median(R);
MaxI=3000;

MinRFP=400;
MinRatio=.8;

for j=1:length(XYAmAs{movie}(:,1))
    
    x=XYAmAs{movie}(j,1);
    y=XYAmAs{movie}(j,2);
    Rj=R(j);
    CV=min(Rj/medR,2);
    if XYAmAs{movie}(j,4)>=MinRFP && Rj>MinRatio
    c=[1-CV/2 CV/2 0];
    else
        c=[0 0 1];
    end
    
    if x~=0 && y~=0
        for xoff=-3:3
            for yoff=-3:3
                if abs(xoff)==3 || abs(yoff)==3
                    
                    B(y+yoff,x+xoff,1)=MaxI*c(1);
                    B(y+yoff,x+xoff,2)=MaxI*c(2);
                    B(y+yoff,x+xoff,3)=MaxI*c(3);
                end
            end
        end
    end
end
imwrite(B,fileSlaveC,'Writemode','append','Compression','none')
