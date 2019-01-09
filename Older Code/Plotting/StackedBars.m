function StackedBars(files1,files2,Cap1,Cap2,varargin)

StallF=100;
if nargin>5
    Area_WT=varargin{2};
    Area_SI=varargin{3};
else
    Area_WT=zeros(1,length(files1))+1;
    Area_SI=zeros(1,length(files2))+1;
end
for i=1:length(files1)
    figure
    load(files1{i})
    FXYCMS_Sel=SelectSmallOnes(FXYCMS);
    subplot(2,5,i)
    CALMwtC{i}=Temp_TwoColorCohorts_NPlots(FXYCMS,2,0,'',1);
    Temp_TwoColorCohorts_NPlots(FXYCMS,2,1,'',1);
    Stallwt{i}=FindFullMovieTraces(FXYCMS,StallF);
end
for i=1:length(files2)
    figure
    load(files2{i})
    FXYCMS_Sel=SelectSmallOnes(FXYCMS);
    subplot(2,5,i)
    CALMsiC{i}=Temp_TwoColorCohorts_NPlots(FXYCMS,2,0,'',1) ;
    Temp_TwoColorCohorts_NPlots(FXYCMS,2,1,'',1);
    Stallsi{i}=FindFullMovieTraces(FXYCMS,StallF);
end
for i=1:length(CALMwtC)
    for i2=1:length(CALMwtC{i})
        Pwt(i,i2)=length(CALMwtC{i}{i2}{1});

    end
    Pwt(i,length(CALMwtC{i})+1)=length(Stallwt{i});

    PwtNA(i,:)=Pwt(i,:)/Area_WT(i);

    Pwtp(i,:)=Pwt(i,:)/sum(Pwt(i,:));

end
for i=1:length(CALMsiC)
    for i2=1:length(CALMsiC{i})

        Psi(i,i2)=length(CALMsiC{i}{i2}{1});
    end

    Psi(i,length(CALMsiC{i})+1)=length(Stallsi{i});

    PsiNA(i,:)=Psi(i,:)/Area_SI(i);

    Psip(i,:)=Psi(i,:)/sum(Psi(i,:));
end

AvPsi=mean(Psi);

AvPwt=mean(Pwt);
AvPsiNA=mean(PsiNA);

AvPwtNA=mean(PwtNA);
AvPsi=AvPsi/sum(AvPsi);
AvPwt=AvPwt/sum(AvPwt);

%close all
figure
Obj=bar([Pwtp ; zeros(1,length(Pwtp(1,:))) ; Psip],'stacked');
L={'30-150s Pits','150+s Pits'};
legend(fliplr(Obj),fliplr(L));
xticks([3 9 15])
xticklabels({Cap1,Cap2})
ylabel('Percent of Traces')

if nargin>4
    figure(100)
    subplot(1,3,varargin{1})
else
    figure
end

Obj=bar([AvPwt ; AvPsi],'stacked');
L={'30-150s Pits','150+s Pits'};
legend(fliplr(Obj),fliplr(L));
xticks([1 2])
xticklabels({Cap1,Cap2})
ylabel('Percent of Traces')

figure
Obj=bar([PwtNA ; zeros(1,length(Pwtp(1,:))) ; PsiNA],'stacked');
L={'30-150s Pits','150+s Pits'};
legend(fliplr(Obj),fliplr(L));
xticks([3 9 15])
xticklabels({'WT Cells','siRNA Cells with best Clathrin signal','siRNA Cells with Lowest CALM signal'})
ylabel('Percent of Traces')

if nargin>4
    figure(101)
    subplot(1,3,varargin{1})
else
    figure
end

Obj=bar([AvPwtNA ; AvPsiNA],'stacked');
L={'30-150s Pits','150+s Pits'};
legend(fliplr(Obj),fliplr(L));
xticks([1 2 3])
xticklabels({Cap1,Cap2})
ylabel('Traces/um^2')