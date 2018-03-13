clear all
folder='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies';
files=FindFiles(folder,'*.mat');
figure
for i0=1:3
    if ismember(i0,[1 2])
        Adaptor='CALM';
    end
    if ismember(i0,[3])
        Adaptor='AP2';
    end
    load(files{i0})
subplot(1,3,i0)
Traces=[];
MaxClath=[];
MaxAdapt=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if fxyc(1,4)==3 && length(fxyc(:,1))>=6 %&& max(fxyc(:,1))<60
        Traces=[Traces i];
        MaxClath=[MaxClath max(fxyc(:,7))];
        MaxAdapt=[MaxAdapt max(fxyc(:,6))];
    end
end
[slopes,rsqs,LTs]=FindACSlopeOfTraces(FXYCMS,Traces,0);

scatter(LTs*5,MaxClath)
hold on
xlabel('Lifetime (s)')
ylabel('Max Clathrin Intensity')
[R,P] = corrcoef(slopes,MaxClath);
%title(strcat(Adaptor,'R=',num2str(R(1,2)),', p=',num2str(P(1,2))))
title(Adaptor)
end