function showEquationGraph(size,denF,denP,vis,sphericity,Re,Cd,Ut)
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,20,-30,3]);
showValues(size,denF,denP,vis,sphericity);
equationCdRep2(size,denF,denP,vis,Re,Cd,Ut);

function showValues(size,denF,denP,vis,sphericity)
text('FontSize',15,'Position',[0 0],'Interpreter','latex','String','$$\underline{Parameters\hspace{2mm}given\hspace{5mm}}$$');
%size
strSize=strcat('$$Particle\hspace{2mm}Size\hspace{2mm}x=',sprintf('%.6f',size),'\hspace{1mm}m$$');
text('FontSize',15,'Position',[0 -1*1.5],'Interpreter','latex','String',strSize);
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

function equationCdRep2(size,denF,denP,vis,Re,Cd,Ut)
text('FontSize',15,'Position',[0 -10],'Interpreter','latex','String','$$\underline{Graphical\hspace{2mm}method\hspace{5mm}}$$');
k=4*size^3*denF*(denP-denF)*9.81/3/vis/vis;
str=strcat('$$C_DRe_p^2=\frac{4x^3\rho_f(\rho_p-\rho_f)g\hspace{2mm}}{3\mu^2}=\frac',...
    sprintf('{4(%.6f)^3(%.3f)(%.3f-%.3f)(9.81)\\hspace{12mm}}{3(%.6f)^2}',size,denF,denP,denF,vis),...
    '\hspace{2mm}=',sprintf('%.5f',k),'$$');
text('FontSize',15,'Interpreter','latex','String',str,'Position',[0 -6*2]);
str2=sprintf('$$log_{10}(C_D)=log_{10}(%.5f)-2log_{10}(Re_p)=%.5f-2log_{10}(Re_p)$$',k,log10(k));
text('FontSize',15,'Interpreter','latex','String',str2,'Position',[0 -7*2]);
text('FontSize',15,'Interpreter','latex','String',...
    '$$Plot\hspace{2mm}log_{10}(C_D)\hspace{2mm}against\hspace{2mm}log_{10}(Re_p):$$','Position',[0 -8*2]);
strCd=sprintf('$$log_{10}(C_D)=%.5f\\rightarrow\\hspace{5mm}C_D=%.5f$$',log10(Cd),Cd);
text('FontSize',15,'Interpreter','latex','String',strCd,'Position',[0 -17.5]);
strRe=sprintf('$$log_{10}(Re_p)=%.5f\\rightarrow\\hspace{5mm}Re_p=%.5f$$',log10(Re),Re);
text('FontSize',15,'Interpreter','latex','String',strRe,'Position',[0 -19]);
text('FontSize',15,'Interpreter','latex','String','$$Re_p=\frac{\rho_fU_Tx}{\mu}$$','Position',[0 -21]);
strU=sprintf('$$%.5f=\\frac{(%.3f)(%.6f)U_T\\hspace{6mm}}{%.6f}\\rightarrow\\hspace{5mm}\\bf{U_T=%.5f\\hspace{1mm}m/s}$$',Re,denF,size,vis,Ut);
text('FontSize',15,'Interpreter','latex','String',strU,'Position',[0 -23]);


