Traces=[];
MaxClath=[];
MaxAdapt=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if fxyc(1,4)==3 && length(fxyc(:,1))>=10 %&& max(fxyc(:,1))<60
        Traces=[Traces i];
        MaxClath=[MaxClath max(fxyc(:,7))];
        MaxAdapt=[MaxAdapt max(fxyc(:,6))];
    end
end
[slopes,rsqs,LTs]=FindACSlopeOfTraces(FXYCMS,Traces);
figure
scatter(slopes,MaxClath)
xlabel('A:C Slope')
ylabel('Max Clathrin Intensity')