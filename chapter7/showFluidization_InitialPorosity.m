function showFluidization_InitialPorosity(size,denF,denP,vis,massP,dia,height,Ufs)
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,20,-30,3]);
showValues(size,denF,denP,vis,massP,dia,height,Ufs);
showInitialPorosity(massP,denP,dia,height);


function showValues(size,denF,denP,vis,massP,dia,height,Ufs)
text('FontSize',15,'Position',[0 0],'Interpreter','latex','String','$$\underline{Parameters\hspace{2mm}given\hspace{5mm}}$$');
%size
strSize=strcat('$$Particle\hspace{2mm}Size\hspace{2mm}x=',sprintf('%.6f',size),'m$$');
text('FontSize',15,'Position',[0 -1*1.2],'Interpreter','latex','String',strSize);
%denF
strDenF=strcat('$$Fluid\hspace{2mm}Density\hspace{2mm}\rho_f=',sprintf('%.3f',denF),'kg/m^3$$');
text('FontSize',15,'Position',[0 -2*1.2],'Interpreter','latex','String',strDenF);
%denP
strDenP=strcat('$$Particle\hspace{2mm}Density\hspace{2mm}\rho_p=',sprintf('%.3f',denP),'kg/m^3$$');
text('FontSize',15,'Position',[0 -3*1.2],'Interpreter','latex','String',strDenP);
%vis
strVis=strcat('$$Viscosity\hspace{2mm}\mu=',sprintf('%.6f',vis),'Pa\cdot s$$');
text('FontSize',15,'Position',[0 -4*1.2],'Interpreter','latex','String',strVis);
%mass
strMassP=strcat('$$Mass\hspace{2mm}of\hspace{2mm}Particles\hspace{2mm}M_p=',sprintf('%.4f',massP),'kg$$');
text('FontSize',15,'Position',[0 -5*1.2],'Interpreter','latex','String',strMassP);
%bed diameter
strDia=strcat('$$Bed\hspace{2mm}Diameter\hspace{2mm}D=',sprintf('%.5f',dia),'m$$');
text('FontSize',15,'Position',[0 -6*1.2],'Interpreter','latex','String',strDia);
%bed height
strHeight=strcat('$$Bed\hspace{2mm}Height\hspace{2mm}H=',sprintf('%.4f',height),'m$$');
text('FontSize',15,'Position',[0 -7*1.2],'Interpreter','latex','String',strHeight);
%Area
strArea=strcat('$$Cross-sectional\hspace{2mm}Area\hspace{2mm}A=\frac{\piD^2}{4}H=\frac',...
    sprintf('{%.4f(%.5f)\\hspace{1mm}^2\\hspace{2mm}}{4}\\hspace{2mm}=%.6f$$',pi,dia,pi*dia*dia/4)));
text('FontSize',15,'Position',[0 -8*1.2],'Interpreter','latex','String',strArea);
%Ufs
strSpeed=strcat('$$Fluid\hspace{2mm}Superficial\hspace{2mm}Velocity\hspace{2mm}M_p=',sprintf('%.5f',Ufs),'m/s$$');
text('FontSize',15,'Position',[0 -8*1.2],'Interpreter','latex','String',strSpeed);

function showInitialPorosity(massP,denP,dia,height)
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String','$$\underline{Find\hspace{2mm}Initial\hspace{2mm}Porosity\hspace{5mm}}$$');
V1=pi*dia*dia*height/4;
V2=massP/denP;
str1=strcat('$$Volume\hspace{2mm}of\hspace{2mm}bed=\frac{\piD^2}{4}H=\frac',...
    sprintf('{%.4f(%.5f)\\hspace{1mm}^2\\hspace{2mm}}{4}(%.4f)\\hspace{2mm}=%.6f$$',pi,dia,H,V1));
text('FontSize',15,'Position',[0 -10.5*1.2],'Interpreter','latex','String',str1);
str2=strcat('$$Volume\hspace{2mm}of\hspace{2mm}particles=\frac{M_p}{\rho_p}=\frac',sprintf('{%.4f}{%.4f}\\hspace{2mm}=%.6f$$',massP,denP,V2));
text('FontSize',15,'Position',[0 -11.5*1.2],'Interpreter','latex','String',str2);
str3=strcat('$$C=\frac{Volume\hspace{2mm}of\hspace{2mm}particles}{Volume\hspace{2mm}of\hspace{2mm}bed}=\frac',...
    sprintf('{%.6f}{%.6f}\\hspace{2mm}=%.6f$$',V1,V2,V1/V2));
text('FontSize',15,'Position',[0 -12.5*1.2],'Interpreter','latex','String',str3);
str4=strcat('$$Initial\hspace{2mm}Void\hspace{2mm}Fraction\hspace{2mm}\epsilon=1-C=1-',sprintf('%.6f\hspace{1mm}=\hspace{1mm}%.6f',V2/V1,1-V2/V1));
text('FontSize',15,'Position',[0 -13.5*1.2],'Interpreter','latex','String',str3);