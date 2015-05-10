function showEquationFluxStoke(size,denF,denP,vis,Ut,Re)
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,20,-30,3]);

showValues(size,denF,denP,vis);
equationStokes(size,denF,denP,vis,Ut,Re);

function showValues(size,denF,denP,vis)
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

function equationStokes(size,denF,denP,vis,Ut,Re)
text('FontSize',15,'Position',[0 -8.5],'Interpreter','latex','String','$$\underline{Assume\hspace{2mm}Stoke''s\hspace{2mm}Law\hspace{2mm}(Re_p<0.3)\hspace{5mm}}$$');
text('FontSize',15,'Position',[0 -10],'Interpreter','latex','String','$$Exponent\hspace{2mm}n=\hspace{2mm}\bf{4.65}$$');
k=4*9.81*size*(denP-denF)/3/denF;
k2=24*vis/denF/size;
str=strcat('$$C_D=\frac{4gx(\rho_p-\rho_f)\hspace{2mm}}{3U_T^2\rho_f}=\frac',...
    sprintf('{4(9.81)(%.6f)(%.3f-%.3f)\\hspace{10mm}}{3U_T^2(%.3f)}',size,denP,denF,denF),...
    '\hspace{2mm}=',sprintf('\\frac{%.5f}{U_T^2}',k),'$$');
text('FontSize',15,'Interpreter','latex','String',str,'Position',[0 -12]);
str2=strcat('$$For\hspace{2mm}Stoke''s\hspace{2mm}region,\hspace{2mm}C_D=\frac{24}{Re_p}=\frac{24}{\frac{\rho_fU_Tx}{\mu}}=',...
    sprintf('\\frac{24(%.6f)}{(%.3f)(%.6f)U_T\\hspace{6mm}}=\\frac{%.5f\\hspace{3mm}}{U_T}$$',vis,denF,size,k2));
text('FontSize',15,'Interpreter','latex','String',str2,'Position',[0 -14.5]);
text('FontSize',15,'Interpreter','latex','String','$$Equating\hspace{2mm}both\hspace{2mm}equations:$$','Position',[0 -16.5]);
strUt=strcat('$$U_T=\frac{x^2(\rho_p-\rho_f)g\hspace{2mm}}{18\mu}=\frac',...
    sprintf('{(%.6f)^2(%.3f-%.3f)(9.81)\\hspace{10mm}}{18(%.6f)}',size,denP,denF,vis),...
    '\hspace{1mm}=',sprintf('\\bf{%.5f\\hspace{1mm}m/s}',Ut),'$$');
text('FontSize',15,'Interpreter','latex','String',strUt,'Position',[0 -18.5]);
text('FontSize',15,'Interpreter','latex','String','$$Check\hspace{2mm}Reynold''s\hspace{2mm}number:$$','Position',[0 -20.5]);
if (Re<0.300005)
    strCheck=strcat('$$Re_p=\frac{\rho_fU_Tx}{\mu}=\frac',sprintf('{(%.3f)(%.5f)(%.6f)\\hspace{8mm}}{%.6f}=%.5f',denF,Ut,size,vis,Re),...
        '\hspace{2mm}<0.3\hspace{2mm}\rightarrow \bf{Stoke''s\hspace{2mm}Law\hspace{2mm}valid}$$');
else
   strCheck=strcat('$$Re_p=\frac{\rho_fU_Tx}{\mu}=\frac',sprintf('{(%.3f)(%.5f)(%.6f)\\hspace{8mm}}{%.6f}=%.5f',denF,Ut,size,vis,Re),...
     '\hspace{2mm}>0.3\hspace{2mm}\rightarrow \bf{Stoke''s\hspace{2mm}Law\hspace{2mm}invalid}$$');
end
text('FontSize',15,'Interpreter','latex','String',strCheck,'Position',[0 -22.5]);

