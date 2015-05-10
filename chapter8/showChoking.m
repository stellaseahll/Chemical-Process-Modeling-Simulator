function showChoking(size,denF,denP,vis,massP,dia,Ufs)
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,12,-30,1]);
A=pi*dia*dia/4;
G=massP/A;

[Uchoke echoke Ut]=findChokingConditions(massP,denP,denF,size,vis,dia);
Uchoke=round(Uchoke*100000)/100000;
Ufs=round(Ufs*100000)/100000; 
showValues(size,denF,denP,vis,massP,dia,Ufs,A,G);
showChokingCalculation(Ufs,Uchoke,echoke,Ut);


function showValues(size,denF,denP,vis,massP,dia,Ufs,A,G)
text('FontSize',15,'Position',[0 0],'Interpreter','latex','String','$$\underline{Parameters\hspace{2mm}given\hspace{5mm}}$$');
%size
strSize=strcat('$$Particle\hspace{2mm}Size\hspace{2mm}x=',sprintf('%.6f',size),'\hspace{1mm}m$$');
text('FontSize',15,'Position',[0 -1*1.2],'Interpreter','latex','String',strSize);
%denF
strDenF=strcat('$$Fluid\hspace{2mm}Density\hspace{2mm}\rho_f=',sprintf('%.3f',denF),'\hspace{1mm}kg/m^3$$');
text('FontSize',15,'Position',[0 -2*1.2],'Interpreter','latex','String',strDenF);
%denP
strDenP=strcat('$$Particle\hspace{2mm}Density\hspace{2mm}\rho_p=',sprintf('%.3f',denP),'\hspace{1mm}kg/m^3$$');
text('FontSize',15,'Position',[0 -3*1.2],'Interpreter','latex','String',strDenP);
%vis
strVis=strcat('$$Viscosity\hspace{2mm}\mu=',sprintf('%.6f',vis),'\hspace{1mm}Pa\cdot s$$');
text('FontSize',15,'Position',[0 -4*1.2],'Interpreter','latex','String',strVis);
%Ufs
strSpeed=strcat('$$Fluid\hspace{2mm}Superficial\hspace{2mm}Velocity\hspace{2mm}U_{fs}=',sprintf('%.5f',Ufs),'\hspace{1mm}m/s$$');
text('FontSize',15,'Position',[0 -5*1.2],'Interpreter','latex','String',strSpeed);
%massflowrate
strMassP=strcat('$$Particle\hspace{2mm}Mass\hspace{2mm}Flow\hspace{2mm}Rate\hspace{2mm}M_p=',sprintf('%.4f\\hspace{1mm}kg/h=%.6f\\hspace{1mm}kg/s$$',massP*3600,massP));
text('FontSize',15,'Position',[0 -6*1.2],'Interpreter','latex','String',strMassP);
%bed diameter
strDia=strcat('$$Pipe\hspace{2mm}Diameter\hspace{2mm}D=',sprintf('%.5f',dia),'\hspace{1mm}m$$');
text('FontSize',15,'Position',[0 -7*1.2],'Interpreter','latex','String',strDia);
%Area
strArea=strcat('$$Cross-sectional\hspace{2mm}Area\hspace{2mm}A=\frac{\pi D^2}{4}=\frac',...
    sprintf('{%.4f(%.5f)^2\\hspace{4mm}}{4}\\hspace{2mm}=%.6f\\hspace{1mm}m^2$$',pi,dia,A));
text('FontSize',15,'Position',[0 -8*1.2],'Interpreter','latex','String',strArea);
%mass flux
strArea=strcat('$$Mass\hspace{2mm}Flux\hspace{2mm}G=\frac{M_p}{A}=\frac',...
    sprintf('{%.6f\\hspace{2mm}}{%.6f}\\hspace{2mm}=%.6f\\hspace{1mm}kg/(m^2 \\cdot s)$$',massP,A,G));
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String',strArea);

function showChokingCalculation(Ufs,Uchoke,echoke,Ut)
text('FontSize',15,'Position',[0 -11.5*1.2],'Interpreter','latex','String','$$\underline{Determining\hspace{2mm}Choking\hspace{2mm}velocity\hspace{9mm}}$$');
%Equation
str='$$From\hspace{2mm}Punwani\hspace{2mm}correlation,$$';
str2='$$\frac{U_{CH}}{\epsilon_{CH}}-U_T\hspace{1mm}=\hspace{1mm}\frac{G}{\rho_p(1-\epsilon_{CH})}\hspace{10mm}(1)$$';
str3='$$\rho_f^{0.77}\hspace{1mm}=\hspace{1mm}\frac{2250D(\epsilon_{CH}^{-4.7}-1)\hspace{3mm}}{\left(\frac{U_{CH}}{\epsilon_{CH}}-U_T\right)^2}\hspace{10mm}(2)$$';
str4=sprintf('$$From\\hspace{2mm}graphical\\hspace{2mm}method,\\hspace{2mm}U_T=%.5f\\hspace{1mm}m/s$$',Ut);
str5='$$Substituting\hspace{2mm}the\hspace{2mm}values\hspace{2mm}and\hspace{2mm}solving\hspace{2mm}the\hspace{2mm}equations\hspace{2mm}by\hspace{2mm}trial\hspace{2mm}and\hspace{2mm}error:$$';
str6=sprintf('$$\\bf{U_{CH}=%.5f\\hspace{1mm}m/s}\\hspace{5mm}and\\hspace{2mm}\\epsilon_{CH}=%.4f$$',Uchoke,echoke);
text('FontSize',15,'Position',[0 -13*1.2],'Interpreter','latex','String',str);
text('FontSize',15,'Position',[0 -14.5*1.2],'Interpreter','latex','String',str2);
text('FontSize',15,'Position',[0 -16.5*1.2],'Interpreter','latex','String',str3);
text('FontSize',15,'Position',[0 -19*1.2],'Interpreter','latex','String',str4);
text('FontSize',15,'Position',[0 -20.5*1.2],'Interpreter','latex','String',str5);
text('FontSize',15,'Position',[0 -22*1.2],'Interpreter','latex','String',str6);
%Compare
if (Ufs>(Uchoke*1.5))
    str=strcat('$$U_{fs}=',sprintf('%.5f\\hspace{1mm}m/s\\hspace{1mm}>\\hspace{1mm}1.5U_{choke}\\hspace{3mm}(=%.5f)',Ufs,Uchoke*1.5),'\hspace{2mm}\rightarrow \bf{superficial\hspace{2mm}velocity\hspace{2mm}selected\hspace{2mm}is\hspace{2mm}valid}$$');
elseif (Ufs>Uchoke)
    str=strcat(sprintf('$$Since\\hspace{2mm}U_{choke}\\hspace{1mm}<U_{fs}=%.5f\\hspace{1mm}<1.5U_{choke}\\hspace{3mm}(=%.5f)\\hspace{2mm},',Ufs,Uchoke*1.5),'\hspace{2mm}\bf{choking\hspace{2mm}might\hspace{2mm}still\hspace{2mm}occur}$$');
else
    str=strcat('$$U_{fs}=',sprintf('%.5f\\hspace{1mm}m/s<\\hspace{1mm}U_{choke}',Ufs),'\hspace{2mm}\rightarrow \bf{superficial\hspace{2mm}velocity\hspace{2mm}selected\hspace{2mm}is\hspace{2mm}invalid}$$');
end
text('FontSize',15,'Position',[0 -23.5*1.2],'Interpreter','latex','String',str);