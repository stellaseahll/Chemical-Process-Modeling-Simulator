function showEquationGraph_ParticleSize(Ut,denF,denP,vis,sphericity,Re,Cd,size)
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,20,-30,3]);
showValues(Ut,denF,denP,vis,sphericity);
equationCdRe(Ut,denF,denP,vis,Re,Cd,size);

function showValues(Ut,denF,denP,vis,sphericity)
text('FontSize',15,'Position',[0 0],'Interpreter','latex','String','$$\underline{Parameters\hspace{2mm}given\hspace{5mm}}$$');
%velocity
strVel=strcat('$$Terminal\hspace{2mm}Velocity\hspace{2mm}U_T=',sprintf('%.6f',Ut),'\hspace{1mm}m/s$$');
text('FontSize',15,'Position',[0 -1*1.5],'Interpreter','latex','String',strVel);
%denF
strDenF=strcat('$$Fluid\hspace{2mm}Density\hspace{2mm}\rho_f=',sprintf('%.3f',denF),'\hspace{1mm}kg/m^3$$');
text('FontSize',15,'Position',[0 -2*1.5],'Interpreter','latex','String',strDenF);
%denP
strDenP=strcat('$$Particle\hspace{2mm}Density\hspace{2mm}\rho_p=',sprintf('%.3f',denP),'\hspace{1mm}kg/m^3$$');
text('FontSize',15,'Position',[0 -3*1.5],'Interpreter','latex','String',strDenP);
%vis
strVis=strcat('$$Viscosity\hspace{2mm}\mu=',sprintf('%.6f',vis),'\hspace{1mm}Pa\cdot s$$');
text('FontSize',15,'Position',[0 -4*1.5],'Interpreter','latex','String',strVis);
%sphericity
strSphericity=strcat('$$Sphericity\hspace{2mm}\Psi=',sprintf('%.3f',sphericity),'$$');
text('FontSize',15,'Position',[0 -5*1.5],'Interpreter','latex','String',strSphericity);

function equationCdRe(Ut,denF,denP,vis,Re,Cd,size)
text('FontSize',15,'Position',[0 -10],'Interpreter','latex','String','$$\underline{Graphical\hspace{2mm}method\hspace{5mm}}$$');
k=4*9.81*vis*(denP-denF)/3/(denF^2)/(Ut^3);
str=strcat('$$\frac{C_D}{Re_p}=\frac{4g\mu (\rho_p-\rho_f)\hspace{2mm}}{3\rho_f^2U_T^3}=\frac',...
    sprintf('{4(9.81)(%.6f)(%.3f-%.3f)\\hspace{12mm}}{3(%.3f)^2(%.5f)^2}',vis,denP,denF,denF,Ut),...
    '\hspace{2mm}=',sprintf('%.5f',k),'$$');
text('FontSize',15,'Interpreter','latex','String',str,'Position',[0 -6*2]);
str2=sprintf('$$log_{10}(C_D)=log_{10}(%.5f)+log_{10}(Re_p)=%.5f+log_{10}(Re_p)$$',k,log10(k));
text('FontSize',15,'Interpreter','latex','String',str2,'Position',[0 -7*2]);
text('FontSize',15,'Interpreter','latex','String',...
    '$$Plot\hspace{2mm}log_{10}(C_D)\hspace{2mm}against\hspace{2mm}log_{10}(Re_p):$$','Position',[0 -8*2]);
strCd=sprintf('$$log_{10}(C_D)=%.5f\\rightarrow\\hspace{5mm}C_D=%.5f$$',log10(Cd),Cd);
text('FontSize',15,'Interpreter','latex','String',strCd,'Position',[0 -17.5]);
strRe=sprintf('$$log_{10}(Re_p)=%.5f\\rightarrow\\hspace{5mm}Re_p=%.5f$$',log10(Re),Re);
text('FontSize',15,'Interpreter','latex','String',strRe,'Position',[0 -19]);
text('FontSize',15,'Interpreter','latex','String','$$Re_p=\frac{\rho_fU_Tx}{\mu}$$','Position',[0 -21]);
strU=sprintf('$$%.5f=\\frac{(%.3f)(%.5f)x\\hspace{6mm}}{%.6f}\\rightarrow\\hspace{5mm}\\bf{x=%.6f\\hspace{1mm}m}$$',Re,denF,Ut,vis,size);
text('FontSize',15,'Interpreter','latex','String',strU,'Position',[0 -23]);


