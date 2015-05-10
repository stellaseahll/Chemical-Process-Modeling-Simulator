function showEquationNewton_ParticleSize(Ut,denF,denP,vis,Ren)
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,20,-30,3]);

showValues(Ut,denF,denP,vis);
equationNewton(Ut,denF,denP,vis,Ren);

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

function equationNewton(Ut,denF,denP,vis,Ren)
text('FontSize',15,'Position',[0 -10],'Interpreter','latex','String','$$\underline{Assume\hspace{2mm}Newton''s\hspace{2mm}Law\hspace{2mm}(Re_p>500)\hspace{5mm}}$$');
size=Ren*vis/denF/Ut;
k=4*9.81*(denP-denF)/3/denF/Ut/Ut;
str=strcat('$$C_D=\frac{4gx(\rho_p-\rho_f)\hspace{2mm}}{3U_T^2\rho_f}=\frac',...
    sprintf('{4(9.81)(%.3f-%.3f)x\\hspace{10mm}}{3(%.6f)^2(%.3f)}',denP,denF,Ut,denF),...
    '\hspace{2mm}=',sprintf('%.5fx$$',k));
text('FontSize',15,'Interpreter','latex','String',str,'Position',[0 -12]);
text('FontSize',15,'Interpreter','latex','String','$$For\hspace{2mm}Newton''s\hspace{2mm}region,\hspace{2mm}C_D=0.44$$','Position',[0 -14.5]);
text('FontSize',15,'Interpreter','latex','String','$$Equating\hspace{2mm}both\hspace{2mm}equations:$$','Position',[0 -16.5]);
strSize=strcat('$$x=\frac{\hspace{3mm}3(0.44)U_T^2\rho_f\hspace{3mm}}{4g(\rho_p-\rho_f)}=\frac',...
    sprintf('{(3)(0.44)(%.6f)^2(%.3f)\\hspace{10mm}}{4(9.81)(%.3f-%.3f)\\hspace{3mm}}',Ut,denF,denP,denF),...
    '\hspace{1mm}=',sprintf('\\bf{%.6f\\hspace{1mm}m}',size),'$$');
text('FontSize',15,'Interpreter','latex','String',strSize,'Position',[0 -19]);
text('FontSize',15,'Interpreter','latex','String','$$Check\hspace{2mm}Reynold''s\hspace{2mm}number:$$','Position',[0 -21]);
if (Ren>499.99995)
    strCheck=strcat('$$Re_p=\frac{\rho_fU_Tx}{\mu}=\frac',sprintf('{(%.3f)(%.5f)(%.6f)\\hspace{8mm}}{%.6f}=%.5f',denF,Ut,size,vis,Ren),...
        '\hspace{2mm}>500\hspace{2mm}\rightarrow \bf{Newton''s\hspace{2mm}Law\hspace{2mm}valid}$$');
else
   strCheck=strcat('$$Re_p=\frac{\rho_fU_Tx}{\mu}=\frac',sprintf('{(%.3f)(%.5f)(%.6f)\\hspace{8mm}}{%.6f}=%.5f',denF,Ut,size,vis,Ren),...
     '\hspace{2mm}<500\hspace{2mm}\rightarrow \bf{Newton''s\hspace{2mm}Law\hspace{2mm}invalid}$$');
end
text('FontSize',15,'Interpreter','latex','String',strCheck,'Position',[0 -23]);

