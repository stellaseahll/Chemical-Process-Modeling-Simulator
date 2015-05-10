function showEquationStoke_ParticleSize(Ut,denF,denP,vis,Res)
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,20,-30,3]);

showValues(Ut,denF,denP,vis);
equationStokes(Ut,denF,denP,vis,Res);

function showValues(Ut,denF,denP,vis)
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
strSphericity=strcat('$$Sphericity\hspace{2mm}\Psi=',sprintf('%d',1),'$$');
text('FontSize',15,'Position',[0 -5*1.5],'Interpreter','latex','String',strSphericity);

function equationStokes(Ut,denF,denP,vis,Res)
text('FontSize',15,'Position',[0 -10],'Interpreter','latex','String','$$\underline{Assume\hspace{2mm}Stoke''s\hspace{2mm}Law\hspace{2mm}(Re_p<0.3)\hspace{5mm}}$$');
size=Res*vis/denF/Ut;
k=4*9.81*(denP-denF)/3/denF/Ut/Ut;
k2=24*vis/denF/Ut;
str=strcat('$$C_D=\frac{4gx(\rho_p-\rho_f)\hspace{2mm}}{3U_T^2\rho_f}=\frac',...
    sprintf('{4(9.81)(%.3f-%.3f)x\\hspace{10mm}}{3(%.6f)^2(%.3f)}',denP,denF,Ut,denF),...
    '\hspace{2mm}=',sprintf('%.5fx$$',k));
text('FontSize',15,'Interpreter','latex','String',str,'Position',[0 -12]);
str2=strcat('$$For\hspace{2mm}Stoke''s\hspace{2mm}region,\hspace{2mm}C_D=\frac{24}{Re_p}=\frac{24}{\frac{\rho_fU_Tx}{\mu}}=',...
    sprintf('\\frac{24(%.6f)}{(%.3f)(%.6f)x\\hspace{6mm}}=\\frac{%.5f\\hspace{3mm}}{x}$$',vis,denF,Ut,k2));
text('FontSize',15,'Interpreter','latex','String',str2,'Position',[0 -14.5]);
text('FontSize',15,'Interpreter','latex','String','$$Equating\hspace{2mm}both\hspace{2mm}equations:$$','Position',[0 -16.5]);
strSize=strcat('$$x=\sqrt{\frac{18\mu U_T}{(\rho_p-\rho_f)g\hspace{2mm}}}=\sqrt{\frac',...
    sprintf('{18(%.6f)(%.5f)\\hspace{8mm}}{(%.3f-%.3f)(9.81)\\hspace{8mm}}}',vis,Ut,denP,denF),...
    '\hspace{1mm}=',sprintf('\\bf{%.6f\\hspace{1mm}m}',size),'$$');
text('FontSize',15,'Interpreter','latex','String',strSize,'Position',[0 -19]);
text('FontSize',15,'Interpreter','latex','String','$$Check\hspace{2mm}Reynold''s\hspace{2mm}number:$$','Position',[0 -21]);
if (Res<0.300005)
    strCheck=strcat('$$Re_p=\frac{\rho_fU_Tx}{\mu}=\frac',sprintf('{(%.3f)(%.5f)(%.6f)\\hspace{8mm}}{%.6f}=%.5f',denF,Ut,size,vis,Res),...
        '\hspace{2mm}<0.3\hspace{2mm}\rightarrow \bf{Stoke''s\hspace{2mm}Law\hspace{2mm}valid}$$');
else
   strCheck=strcat('$$Re_p=\frac{\rho_fU_Tx}{\mu}=\frac',sprintf('{(%.3f)(%.5f)(%.6f)\\hspace{8mm}}{%.6f}=%.5f',denF,Ut,size,vis,Res),...
     '\hspace{2mm}>0.3\hspace{2mm}\rightarrow \bf{Stoke''s\hspace{2mm}Law\hspace{2mm}invalid}$$');
end
text('FontSize',15,'Interpreter','latex','String',strCheck,'Position',[0 -23]);

