t=[1 51 101 151 201]*.1;
fm=fit(t.',Mcell.','exp1');
figure
plot(fm,t,Mcell)
coeffvalues(fm)
t=[1 51 101 151 201]*.1;
fs=fit(t.',Scell.','exp1');
figure
plot(fs,t,Scell)
coeffvalues(fs)

Mcell10=[355 290 231 208] - 50;
t=[51 101 151 200]*.1;
fm=fit(t.',Mcell10.','exp1');
figure
plot(fm,t,Mcell10)
coeffvalues(fm)

Scell10=[315 261 210 227] - 70;
t=[51 101 151 200]*.1;
fs=fit(t.',Scell10.','exp1');
figure
plot(fs,t,Scell10)
coeffvalues(fs)

Mcell5=[304 311 291 296 280] - 88;
t=[1 51 101 151 200]*.1;
fm=fit(t.',Mcell5.','exp1');
figure
plot(fm,t,Mcell5)
coeffvalues(fm)

Scell10=[419 405 382 361 325] - 56;
t=[1 51 101 151 200]*.1;
fs=fit(t.',Scell10.','exp1');
figure
plot(fs,t,Scell10)
coeffvalues(fs)