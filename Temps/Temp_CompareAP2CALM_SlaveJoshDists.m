figure
subplot(2,2,1)
hist(JFs_ac,100)
sd=sqrt(var(JFs_ac));
title(strcat('SD= ',num2str(sd)))
xlim([-200 200])
subplot(2,2,2)
hist(JFs_ao,100)
sd=sqrt(var(JFs_ao));
title(strcat('SD= ',num2str(sd)))
xlim([-200 200])
subplot(2,2,3)
hist(JFs_cc,100)
sd=sqrt(var(JFs_cc));
title(strcat('SD= ',num2str(sd)))
xlim([-200 200])
subplot(2,2,4)
hist(JFs_co,100)
sd=sqrt(var(JFs_co));
title(strcat('SD= ',num2str(sd)))
xlim([-200 200])