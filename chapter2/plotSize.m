function plotSize(Re,Cd)
    K=Cd/Re;
    hold on;
    ReX=logspace(-3,5,1000);
    CdY=K*ReX;
    CdY(CdY>10^5)=NaN;
    CdY(CdY<0.1)=NaN;
    loglog(ReX,CdY,'k','linewidth',0.5);
    loglog(Re,Cd,'ok','linewidth',2);
    loglog([Re Re],[Cd 10^-1],'k--','linewidth',0.5);
    hold off;
end