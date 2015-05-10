function plotDragForce()

K=correlationDrag;
Re=logspace(-4,4,1000);
X=log10(Re);
table=zeros(7,length(X));
for i=1:7
    table(i,:)=X.^(7-i);
end
logCd=K*table;
logCd(1,1:250)=-0.9819*X(1:250)+1.4310;
logCd(2,1:250)=-0.9198*X(1:250)+1.677;
logCd(3,1:250)=-0.9549*X(1:250)+1.6946;
logCd(4,1:250)=-0.9771*X(1:250)+1.7154;
logCd(5,1:250)=-0.9153*X(1:250)+1.8996;
Cd=10.^(logCd);
loglog(Re,Cd,'linewidth',1.2);
axis([10^-3 10^4 10^-1 10^5]);
grid on;
ylabel('Drag Coefficient, C_D');
xlabel('Single particle Reynolds number. Re_p');
title('Drag coefficient C_D versus Reynolds number Re_p');
legend('sphericity=1','sphericity=0.806','sphericity=0.6','sphericity=0.22','sphericity=0.125');
return;
end