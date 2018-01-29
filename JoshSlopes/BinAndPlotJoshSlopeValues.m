clear JACbin JSSlopebin JMintbin JSintbin JMSlopebin JM JS JssM JssS JmM JmS JsM JsS JmsM JmsS
%scatter(JSSlopes(used),JMSlopes(used))
%hist(JMSlopes,10)
used=find(JACs~=Inf & JMrsq>.5);

% xbins=-600:100:600;
% xbinsp=-550:100:550;
xbins=-.2:.05:.2;
xbinsp=-.175:.05:.175;
for i=1:length(xbins)-1
    JACbin{i}=[];
    JSSlopebin{i}=[];
    JMintbin{i}=[];
    JSintbin{i}=[];
    JMSlopebin{i}=[];
    for i2=1:length(used)
        if JMSlopes(used(i2))>xbins(i) && JMSlopes(used(i2))<xbins(i+1)
            JACbin{i}=[JACbin{i} JACs(used(i2))];
            JSSlopebin{i}=[JSSlopebin{i} JSSlopes(used(i2))];
            JMintbin{i}=[JMintbin{i} JMints(used(i2))];
            JSintbin{i}=[JSintbin{i} JSints(used(i2))];
            JMSlopebin{i}=[JMSlopebin{i} JMSlopes(used(i2))];
        end
    end
end

for i=1:length(JACbin)
    JM(i)=median(JACbin{i});
    JS(i)=sqrt(var((JACbin{i})));
    JssM(i)=median(JSSlopebin{i});
    JssS(i)=sqrt(var((JSSlopebin{i})));
    JmM(i)=median(JMintbin{i});
    JmS(i)=sqrt(var((JMintbin{i})));
    JsM(i)=median(JSintbin{i});
    JsS(i)=sqrt(var((JSintbin{i})));
    JmsM(i)=median(JMSlopebin{i});
    JmsS(i)=sqrt(var((JMSlopebin{i})));
end

%FSFig()
subplot(2,3,1)
errorbar(xbinsp,JM,JS,'Color',Col)
hold on
ylabel('A:C Ratios')
xlabel('Josh Slope Bin')
subplot(2,3,2)
errorbar(xbinsp,JssM,JssS,'Color',Col)
hold on
ylabel('CLTA Josh Slope')
xlabel('Josh Slope Bin')
subplot(2,3,3)
errorbar(xbinsp,JmM,JmS,'Color',Col)
hold on
ylabel('AP2 Intensity')
xlabel('Josh Slope Bin')
subplot(2,3,4)
errorbar(xbinsp,JsM,JsS,'Color',Col)
hold on
ylabel('CLTA Intensity')
xlabel('Josh Slope Bin')
subplot(2,3,5)
errorbar(xbinsp,JmsM,JmsS,'Color',Col)
hold on
ylabel('AP2 Josh Slope')
xlabel('Josh Slope Bin')