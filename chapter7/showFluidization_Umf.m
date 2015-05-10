function showFluidization_Umf(size,denF,denP,vis,massP,dia,height,Ufs)
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,12,-30,1]);
A=pi*dia*dia/4;
[e, Umf ,P]=findFluidizationCondition(denF, denP, massP, size, vis,height,dia);
showValues(size,denF,denP,vis,massP,dia,height,Ufs,A);
showInitialPorosity(massP,denP,dia,height);
showPressure(denP,denF,height,P,e);
showUmf(size,denF,vis,height,P,e,Umf);


function showValues(size,denF,denP,vis,massP,dia,height,Ufs,A)
text('FontSize',14,'Position',[0 0],'Interpreter','latex','String','$$\underline{Parameters\hspace{2mm}given\hspace{5mm}}$$');
%size
strSize=strcat('$$Particle\hspace{2mm}Size\hspace{2mm}x=',sprintf('%.6f',size),'\hspace{1mm}m$$');
text('FontSize',14,'Position',[0 -1*0.9],'Interpreter','latex','String',strSize);
%denF
strDenF=strcat('$$Fluid\hspace{2mm}Density\hspace{2mm}\rho_f=',sprintf('%.3f',denF),'\hspace{1mm}kg/m^3$$');
text('FontSize',14,'Position',[0 -2*0.9],'Interpreter','latex','String',strDenF);
%denP
strDenP=strcat('$$Particle\hspace{2mm}Density\hspace{2mm}\rho_p=',sprintf('%.3f',denP),'\hspace{1mm}kg/m^3$$');
text('FontSize',14,'Position',[0 -3*0.9],'Interpreter','latex','String',strDenP);
%vis
strVis=strcat('$$Viscosity\hspace{2mm}\mu=',sprintf('%.6f',vis),'\hspace{1mm}Pa\cdot s$$');
text('FontSize',14,'Position',[0 -4*0.9],'Interpreter','latex','String',strVis);
%mass
strMassP=strcat('$$Mass\hspace{2mm}of\hspace{2mm}Particles\hspace{2mm}M_p=',sprintf('%.4f',massP),'\hspace{1mm}kg$$');
text('FontSize',14,'Position',[0 -5*0.9],'Interpreter','latex','String',strMassP);
%bed diameter
strDia=strcat('$$Bed\hspace{2mm}Diameter\hspace{2mm}D=',sprintf('%.5f',dia),'\hspace{1mm}m$$');
text('FontSize',14,'Position',[0 -6*0.9],'Interpreter','latex','String',strDia);
%bed height
strHeight=strcat('$$Bed\hspace{2mm}Height\hspace{2mm}H=',sprintf('%.3f',height),'\hspace{1mm}m$$');
text('FontSize',14,'Position',[0 -7*0.9],'Interpreter','latex','String',strHeight);
%Area
strArea=strcat('$$Cross-sectional\hspace{2mm}Area\hspace{2mm}A=\frac{\pi D^2}{4}=\frac',...
    sprintf('{%.4f(%.5f)^2\\hspace{4mm}}{4}\\hspace{2mm}=%.6f\\hspace{1mm}m^2$$',pi,dia,A));
text('FontSize',14,'Position',[0 -8*0.9],'Interpreter','latex','String',strArea);
%Ufs
strSpeed=strcat('$$Fluid\hspace{2mm}Superficial\hspace{2mm}Velocity\hspace{2mm}U_{fs}=',sprintf('%.5f',Ufs),'\hspace{1mm}m/s$$');
text('FontSize',14,'Position',[0 -9.3*0.9],'Interpreter','latex','String',strSpeed);

function showInitialPorosity(massP,denP,dia,height)
text('FontSize',14,'Position',[0 -9.2*1.1],'Interpreter','latex','String','$$\underline{Determining\hspace{2mm}Initial\hspace{2mm}Porosity\hspace{9mm}}$$');
V1=pi*dia*dia*height/4;
A=pi*dia*dia/4;
V2=massP/denP;
str1=strcat('$$Volume\hspace{2mm}of\hspace{2mm}bed=AH=',...
    sprintf('(%.6f)(%.4f)\\hspace{2mm}=%.6f\\hspace{1mm}m^3$$',A,height,V1));
text('FontSize',14,'Position',[0 -11],'Interpreter','latex','String',str1);
str2=strcat('$$Volume\hspace{2mm}of\hspace{2mm}particles=\frac{M_p}{\rho_p}=\frac',sprintf('{%.4f\\hspace{2mm}}{%.4f\\hspace{2mm}}\\hspace{2mm}=%.6f\\hspace{1mm}m^3$$',massP,denP,V2));
text('FontSize',14,'Position',[0 -12.5],'Interpreter','latex','String',str2);
str3=strcat('$$C=\frac{Volume\hspace{2mm}of\hspace{2mm}particles\hspace{6mm}}{Volume\hspace{2mm}of\hspace{2mm}bed}=\frac',...
    sprintf('{%.6f\\hspace{2mm}}{%.6f\\hspace{2mm}}\\hspace{1mm}=%.6f$$',V1,V2,V2/V1));
text('FontSize',14,'Position',[0 -14],'Interpreter','latex','String',str3);
str4=strcat('$$Initial\hspace{2mm}Void\hspace{2mm}Fraction\hspace{2mm}\epsilon=1-C=1-',sprintf('%.6f\\hspace{1mm}=\\hspace{1mm}%.6f$$',V2/V1,1-V2/V1));
text('FontSize',14,'Position',[0 -15.2],'Interpreter','latex','String',str4);

function showPressure(denP,denF,height,P,e)
text('FontSize',14,'Position',[0 -17.3],'Interpreter','latex','String','$$\underline{Determining\hspace{2mm}frictional\hspace{2mm}pressure\hspace{2mm}drop\hspace{2mm}across\hspace{2mm}the\hspace{2mm}bed\hspace{2mm}when\hspace{2mm}fluidized\hspace{23mm}}$$');
%% Determine pressure drop
str2=strcat('$$(-\Delta p)=\frac{weight\hspace{2mm}of\hspace{2mm}particles-\hspace{2mm}upthrust\hspace{2mm}on\hspace{2mm}particles\hspace{12mm}}{cross-sectional\hspace{2mm}area}',...
    '\hspace{2mm}=\hspace{2mm}\frac{HA(1-\epsilon)(\rho_p-\rho_g)\hspace{3mm}}{A}=\hspace{2mm}H(1-\epsilon)(\rho_p-\rho_g)$$');
text('FontSize',14,'Position',[0 -18.7],'Interpreter','latex','String',str2);
str3=strcat('$$Hence,\hspace{2mm}(-\Delta p)\hspace{1mm}=\hspace{1mm}',...
    sprintf('(%.3f)(1-%.5f)(%.3f-%.3f)(9.81)=%.4f\\hspace{1mm}Pa$$',height,e,denP,denF,P));
text('FontSize',14,'Position',[0 -20.3],'Interpreter','latex','String',str3);

function showUmf(size,denF,vis,height,P,e,Umf)
text('FontSize',14,'Position',[0 -22.3],'Interpreter','latex','String','$$\underline{Determining\hspace{2mm}minimum\hspace{2mm}fluidization\hspace{2mm}velocity\hspace{2mm}U_{mf}\hspace{14mm}}$$');
%% Ergun Equation
str='$$From\hspace{2mm}Ergun\hspace{2mm}equation:';
strErgun1='\frac{(-\Delta p)}{H}=';
strErgun2='150\frac{(1-\epsilon)^2\mu U_{mf}\hspace{3mm}}{\epsilon ^3 x^2}+';
strErgun3='1.75\frac{(1-\epsilon)\rho_f U_{mf}^2\hspace{3mm}}{\epsilon ^3 x}$$';
strErgun=strcat(str,strErgun1,strErgun2,strErgun3);
text('FontSize',14,'Position',[0 -23.5],'Interpreter','latex','String',strErgun);
%% Substituting Values
str='$$Substituting\hspace{2mm}the\hspace{2mm}corresponding\hspace{2mm}values:$$';
text('FontSize',14,'Position',[0 -24.9],'Interpreter','latex','String',str);
strSub1=sprintf('$$\\frac{%.4f\\hspace{1mm}}{%.3f}=',P,height);
strSub2=sprintf('\\frac{150(1-%.5f)^2(%.6f)\\hspace{7mm}}{(%.5f)^3(%.6f)^2}U_{mf}\\hspace{1mm}+',e,vis,e,size);
strSub3=sprintf('\\frac{1.75(1-%.5f)(%.3f)\\hspace{7mm}}{(%.5f)^3(%.6f)}U_{mf}^2\\hspace{1mm}$$',e,denF,e,size);
strSub=strcat(strSub1,strSub2,strSub3);
text('FontSize',14,'Position',[0 -26.2],'Interpreter','latex','String',strSub);
%% 
a=P/height;
b=150*(1-e)^2*vis/e^3/size^2;
c=1.75*(1-e)*denF/e^3/size;
str=sprintf('$$Hence,\\hspace{1mm}%.6f=%.6fU_{mf}\\hspace{1mm}+%.6fU_{mf}^2\\hspace{3mm}\\rightarrow U_{mf}=%.5f\\hspace{1mm}m/s$$',a,b,c,Umf);
text('FontSize',14,'Position',[0 -27.8],'Interpreter','latex','String',str);