function MB=CalculateStackBackgrounds(nstaF)

backs=cell(1,8);
for i=1:length(nstaF)
    for i2=1:8
        backs{i2}=[backs{i2} ; nstaF(i).backs(:,i2)];
    end
end
for i=1:8
    
    MB(i)=median(backs{i});
end