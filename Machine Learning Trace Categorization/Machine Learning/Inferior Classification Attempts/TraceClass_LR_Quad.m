clear
load('MLData_ExtraFrame_R2_Split.mat')
Ls=[0 .01 .03 .1 .3 1 3 10];
NBins=20;
[X,y,LN,AN]=ConstructFeatures_Quad(trainData,NBins);
[Xcv,ycv]=ConstructFeatures_Quad(CVData,NBins,LN,AN);
for i=1:length(Ls)
    lambda=Ls(i);
    for i2=1:4
        Theta{i2}=RegLogisticResgression(X,y(:,i2),lambda);
        [ErrT{i2}(i),~]=LRErrorRate(X,y(:,i2),Theta{i2});
        [ErrCV{i2}(i),~]=LRErrorRate(Xcv,ycv(:,i2),Theta{i2});
    end
end
figure
for i=1:4  %Lambda_min~.1
    subplot(2,2,i)
    plot(ErrT{i})
    hold on
    plot(ErrCV{i})
end

%%

clear
load('MLData_ExtraFrame_R2_Split.mat')
Ls=0;
NBins=20;
[X,y,LN,AN]=ConstructFeatures_Quad(trainData,NBins);
[Xcv,ycv]=ConstructFeatures_Quad(CVData,NBins,LN,AN);

lambda=Ls;
for i2=1:4
    Theta{i2}=RegLogisticResgression(X,y(:,i2),lambda);
end
save('190107_LRThetas_Quad.mat','Theta','AN','LN')

%%

for i=1:length(X(:,1))
    v=X(i,:);
    v(2)=v(2)*LN;
    v(3:end)=v(3:end)*AN;
    pred(i)=CategorizeExample_Quad(v);
    answers=[trainData.Decision];
end
for i=1:length(Xcv(:,1))
    v=Xcv(i,:);
    v(2)=v(2)*LN;
    v(3:end)=v(3:end)*AN;
    predCV(i)=CategorizeExample_Quad(v);
    answersCV=[CVData.Decision];
end
%%
sum(pred~=answers)/length(answers)
sum(predCV~=answersCV)/length(answersCV)
