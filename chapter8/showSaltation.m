function showSaltation(size,denF,denP,vis,massP,dia,Ufs)
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,12,-30,1]);
Usalt=findSaltationConditions(massP,denP,denF,size,dia);
   Usalt=round(Usalt*100000)/100000;
    Ufs=round(Ufs*100000)/100000;
showValues(size,denF,denP,vis,massP,dia,Ufs);
showSaltationCalculation(size,denF,massP,dia,Ufs,Usalt);


function showValues(size,denF,denP,vis,massP,dia,Ufs)
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


function showSaltationCalculation(size,denF,massP,dia,Ufs,Usalt)
text('FontSize',15,'Position',[0 -9*1.2],'Interpreter','latex','String','$$\underline{Determining\hspace{2mm}saltation\hspace{2mm}velocity\hspace{9mm}}$$');
%Equation
str='$$From\hspace{2mm}Rizk\hspace{2mm}correlation,\hspace{2mm}U_{salt}\hspace{1mm}=\left(\frac{4M_p10^\alpha g^{\beta/2}\hspace{1mm} D^{\beta/2-2\hspace{1mm}}\hspace{3mm}}{\pi\rho_f}\right)^{1/(\beta+1)}$$';
text('FontSize',15,'Position',[0 -10.5*1.2],'Interpreter','latex','String',str);
a=1440*size+1.96;
b=1100*size+2.5;
strA=strcat('$$where \hspace{2mm} \alpha \hspace{1mm}=\hspace{1mm}1440x+1.96\hspace{1mm}=',sprintf('1440(%.6f)+1.96=\\hspace{1mm}%.3f$$',size,a));
strB=strcat('$$and\hspace{2mm} \beta \hspace{1mm} = \hspace{1mm}1100x+2.5\hspace{1mm}=',sprintf('1100(%.6f)+2.5=\\hspace{1mm}%.3f$$',size,b));
text('FontSize',15,'Position',[0 -12.5*1.2],'Interpreter','latex','String',strA);
text('FontSize',15,'Position',[0 -13.5*1.2],'Interpreter','latex','String',strB);
%Substitution
str='$$Substituting\hspace{2mm}the\hspace{2mm}values,$$';
text('FontSize',15,'Position',[0 -15*1.2],'Interpreter','latex','String',str);
strFinal=strcat('$$U_{salt}\hspace{1mm}=\left(\frac',...
    sprintf('{4(%.4f)10^{%.3f}\\hspace{3mm} (9.81)^{%.3f/2}\\hspace{4mm} (%.5f)^{%.3f/2-2\\hspace{3mm}}\\hspace{10mm}}{\\pi (%.3f)}\\right)^{1/(%.3f+1)}\\hspace{1mm}=\\hspace{1mm}%.5f\\hspace{1mm}m/s$$',...
    massP,a,b,dia,b,denF,b,Usalt));
text('FontSize',15,'Position',[0 -17*1.2],'Interpreter','latex','String',strFinal);
%Compare
if (Ufs>(Usalt*1.5))
    str=strcat('$$U_{fs}=',sprintf('%.5f\\hspace{1mm}m/s\\hspace{1mm}>\\hspace{1mm}1.5U_{salt}\\hspace{3mm}(=%.5f)',Ufs,Usalt*1.5),'\hspace{2mm}\rightarrow \bf{superficial\hspace{2mm}velocity\hspace{2mm}selected\hspace{2mm}is\hspace{2mm}valid}$$');
elseif (Ufs>Usalt)
    str=strcat(sprintf('$$Since\\hspace{2mm}U_{salt}\\hspace{1mm}<U_{fs}=%.5f\\hspace{1mm}<1.5U_{salt}\\hspace{3mm}(=%.5f)\\hspace{2mm},',Ufs,Usalt*1.5),'\hspace{2mm}\bf{saltation\hspace{2mm}might\hspace{2mm}still\hspace{2mm}occur}$$');
else
    str=strcat('$$U_{fs}=',sprintf('%.5f\\hspace{1mm}m/s\\hspace{1mm}<\\hspace{1mm}U_{salt}',Ufs),'\hspace{2mm}\rightarrow \bf{superficial\hspace{2mm}velocity\hspace{2mm}selected\hspace{2mm}is\hspace{2mm}invalid}$$');
end
text('FontSize',15,'Position',[0 -19*1.2],'Interpreter','latex','String',str);