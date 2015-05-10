function showHorizontal(size,denF,denP,vis,massP,dia,Ufs,length,isAccelerated,step)
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,12,-45,1]);
A=pi*dia*dia/4;
G=massP/A;
Ufs=round(Ufs*100000)/100000; 
[Ptotal ,Pcomponent ,eh, U, f, ReCd]=findHorizontalPipeConditions(massP,denP,denF,size,vis,dia,length,Ufs,~isAccelerated);
showValues(size,denF,denP,vis,massP,dia,length,Ufs,A,G);
if (step==1)
    showVoidFraction(Ufs,size,denP,U,G,eh,denF,dia,vis,ReCd,f);
elseif (step==2)
    showPressure(U,eh,f,denF,denP,Ufs,G,length,dia,isAccelerated,Pcomponent,Ptotal);
end
end
function showValues(size,denF,denP,vis,massP,dia,length,Ufs,A,G)
text('FontSize',13,'Position',[0 0],'Interpreter','latex','String','$$\underline{Parameters\hspace{2mm}given\hspace{5mm}}$$');
%size
strSize=strcat('$$Particle\hspace{2mm}Size\hspace{2mm}x=',sprintf('%.6f',size),'\hspace{1mm}m$$');
text('FontSize',13,'Position',[0 -1*1.1],'Interpreter','latex','String',strSize);
%denF
strDenF=strcat('$$Fluid\hspace{2mm}Density\hspace{2mm}\rho_f=',sprintf('%.3f',denF),'\hspace{1mm}kg/m^3$$');
text('FontSize',13,'Position',[0 -2*1.1],'Interpreter','latex','String',strDenF);
%denP
strDenP=strcat('$$Particle\hspace{2mm}Density\hspace{2mm}\rho_p=',sprintf('%.3f',denP),'\hspace{1mm}kg/m^3$$');
text('FontSize',13,'Position',[0 -3*1.1],'Interpreter','latex','String',strDenP);
%vis
strVis=strcat('$$Viscosity\hspace{2mm}\mu=',sprintf('%.6f',vis),'\hspace{1mm}Pa\cdot s$$');
text('FontSize',13,'Position',[0 -4*1.1],'Interpreter','latex','String',strVis);
%Ufs
strSpeed=strcat('$$Fluid\hspace{2mm}Superficial\hspace{2mm}Velocity\hspace{2mm}U=',sprintf('%.5f',Ufs),'\hspace{1mm}m/s$$');
text('FontSize',13,'Position',[0 -5*1.1],'Interpreter','latex','String',strSpeed);
%massflowrate
strMassP=strcat('$$Particle\hspace{2mm}Mass\hspace{2mm}Flow\hspace{2mm}Rate\hspace{2mm}M_p=',sprintf('%.4f\\hspace{1mm}kg/h=%.6f\\hspace{1mm}kg/s$$',massP*3600,massP));
text('FontSize',13,'Position',[0 -6*1.1],'Interpreter','latex','String',strMassP);
%pipe diameter
strDia=strcat('$$Pipe\hspace{2mm}Diameter\hspace{2mm}D=',sprintf('%.5f',dia),'\hspace{1mm}m$$');
text('FontSize',13,'Position',[0 -7*1.1],'Interpreter','latex','String',strDia);
%pipe length
strLength=strcat('$$Horizontal\hspace{2mm}Pipe\hspace{2mm}Length\hspace{2mm}L_H=',sprintf('%.3f',length),'\hspace{1mm}m$$');
text('FontSize',13,'Position',[0 -8*1.1],'Interpreter','latex','String',strLength);
%Area
strArea=strcat('$$Cross-sectional\hspace{2mm}Area\hspace{2mm}A=\frac{\pi D^2}{4}=\frac',...
    sprintf('{%.4f(%.5f)^2\\hspace{4mm}}{4}\\hspace{2mm}=%.6f\\hspace{1mm}m^2$$',pi,dia,A));
text('FontSize',13,'Position',[0 -9*1.1],'Interpreter','latex','String',strArea);
%mass flux
strArea=strcat('$$Mass\hspace{2mm}Flux\hspace{2mm}G=\frac{M_p}{A}=\frac',...
    sprintf('{%.6f}{%.6f\\hspace{2mm}}\\hspace{2mm}=%.6f\\hspace{1mm}kg/(m^2 \\cdot s)$$',massP,A,G));
text('FontSize',13,'Position',[0 -10.5*1.1],'Interpreter','latex','String',strArea);
end

function showVoidFraction(Ufs,size,denP,U,G,eh,denF,dia,vis,ReCd,f)
text('FontSize',13,'Position',[0 -12.5*1.1],'Interpreter','latex','String','$$\underline{Determining\hspace{2mm}other\hspace{2mm}parameters\hspace{12mm}}$$');
%Uph
text('FontSize',13,'Position',[0 -13.5*1.1],'Interpreter','latex','String','$$\bf{To\hspace{2mm}find\hspace{2mm}actual\hspace{2mm}particle\hspace{2mm}velocity\hspace{2mm}U_{pH}:\hspace{10mm}}$$');
strUph='$$From\hspace{2mm}Hinkle''s\hspace{2mm}correlation,U_{pH}=U(1-0.0638\hspace{1mm}x^{0.3}\hspace{1mm}\rho_p^{0.5}\hspace{1mm})$$';
strUph2=sprintf('$$U_{pH}=%.5f(1-0.0638(%.6f)^{0.3}\\hspace{1mm}(%.3f)^{0.5}\\hspace{1mm})\\hspace{1mm}=\\hspace{1mm}\\bf{%.5f\\hspace{1mm}m/s}$$',Ufs,size,denP,U(2));
text('FontSize',13,'Position',[0 -14.8*1.1],'Interpreter','latex','String',strUph);
text('FontSize',13,'Position',[0 -16.1*1.1],'Interpreter','latex','String',strUph2);
%eH
text('FontSize',13,'Position',[0 -17.6*1.1],'Interpreter','latex','String','$$\bf{To\hspace{2mm}find\hspace{2mm}void\hspace{2mm}fraction\hspace{2mm}\epsilon_{H}:\hspace{10mm}}$$');
streH1='$$From\hspace{2mm}continuity,\hspace{2mm}G=\rho_p(1-\epsilon_H)U_{pH}$$';
streH2=strcat('$$\epsilon_H=1-\frac{G}{\rho_pU_{pH}}=',...
    sprintf('1-\\frac{%.6f}{(%.3f)(%.5f)\\hspace{3mm}}=\\bf{%.4f}$$',G,denP,U(2),eh));
text('FontSize',13,'Position',[0 -18.9*1.1],'Interpreter','latex','String',streH1);
text('FontSize',13,'Position',[0 -20.2*1.1],'Interpreter','latex','String',streH2);
%Uf
text('FontSize',13,'Position',[0 -21.7*1.1],'Interpreter','latex','String','$$\bf{To\hspace{2mm}find\hspace{2mm}actual\hspace{2mm}fluid\hspace{2mm}velocity\hspace{2mm}U_{fH}:\hspace{10mm}}$$');
strUfh=strcat('$$U_{fH}=\frac{U}{\epsilon_H}=',...
    sprintf('\\frac{%.5f\\hspace{1mm}}{%.4f}=\\bf{%.5f\\hspace{1mm}m/s}$$',Ufs,eh,U(1)));
text('FontSize',13,'Position',[0 -23*1.1],'Interpreter','latex','String',strUfh);
%% fp
text('FontSize',13,'Position',[0 -24.5*1.1],'Interpreter','latex','String','$$\bf{To\hspace{2mm}find\hspace{2mm}particle\hspace{2mm}friction\hspace{2mm}factor\hspace{2mm}f_p:\hspace{10mm}}$$');
%Re
strRe1=strcat('$$Re_p=\frac{\rho_f(U_{fH}-U_{pH})x\hspace{3mm}}{\mu}\hspace{1mm}=\hspace{1mm}\frac',...
    sprintf('{%.3f(%.5f-%.5f)(%.6f)\\hspace{14mm}}{%.6f}\\hspace{1mm}=\\hspace{1mm}%.4f$$',denF,U(1),U(2),size,vis,ReCd(1)));
text('FontSize',13,'Position',[0 -26*1.1],'Interpreter','latex','String',strRe1);
%Cd
if (ReCd(1)<1)
    str1=strcat('$$When\hspace{1mm}Re_p\hspace{1mm}<\hspace{1mm}1,\hspace{2mm}C_D=24/Re_p=',sprintf('24/%.4f=%.4f$$',ReCd(1),ReCd(2)));
elseif (ReCd(1)<500)
    str1=strcat('$$When\hspace{1mm}1\hspace{1mm}<Re_p\hspace{1mm}<\hspace{1mm}500,\hspace{2mm}C_D=18.5Re_p^{-0.6}=18.5Re_p^{-0.6}=',...
        sprintf('18.5(%.4f)^{-0.6}=%.4f$$',ReCd(1),ReCd(2)));
else
    str1='$$When\hspace{1mm}500\hspace{1mm}<Re_p\hspace{1mm}<\hspace{1mm}2\times10^5,\hspace{2mm}C_D=0.44$$';
end
text('FontSize',13,'Position',[0 -27.5*1.1],'Interpreter','latex','String',str1);
%Particle fp
strFp1='$$f_p=\frac{3}{8}\frac{\rho_f}{\rho_p}\frac{D}{x}C_D\left(\frac{U_f-U_p}{U_p}\right)^{2}$$';
strFp2=sprintf('$$\\hspace{4mm}=\\frac{3}{8}\\hspace{1mm}\\left(\\frac{%.3f\\hspace{2mm}}{%.3f\\hspace{2mm}}\\right)\\hspace{1mm}\\left(\\frac{%.5f\\hspace{2mm}}{%.6f\\hspace{2mm}}\\right)(%.4f)\\left(\\frac{%.5f-%.5f\\hspace{4mm}}{%.5f}\\right)^2\\hspace{1mm}=\\hspace{1mm}\\bf{%.5f}$$',...
    denF,denP,dia,size,ReCd(2),U(1),U(2),U(2),f(2));
text('FontSize',13,'Position',[0 -29*1.1],'Interpreter','latex','String',strFp1);
text('FontSize',13,'Position',[0 -30.5*1.1],'Interpreter','latex','String',strFp2);
%Gas ff
text('FontSize',13,'Position',[0 -32*1.1],'Interpreter','latex','String','$$\bf{To\hspace{2mm}find\hspace{2mm}fluid\hspace{2mm}friction\hspace{2mm}factor\hspace{2mm}f_g:\hspace{10mm}}$$');
strFg1='$$From\hspace{2mm}Colebrooke\hspace{2mm}equation,\hspace{2mm}\frac{1}{\sqrt{f_g}}=-4.0log_{10}\left(\frac{e/D}{3.7}+\frac{1.256}{Re\sqrt{f_g}}\right)$$';
strFg2='$$Assuming\hspace{2mm}smooth\hspace{2mm}pipe,\hspace{2mm}e=0\hspace{2mm}\rightarrow\hspace{2mm}\frac{1}{\sqrt{f_g}}=-4.0log_{10}\left(\frac{1.256}{Re\sqrt{f_g}}\right)$$';
strRe=sprintf('$$Re=\\frac{\\rho_fUD\\hspace{2mm}}{\\mu}=\\frac{%.3f(%.5f)(%.3f)\\hspace{8mm}}{%.6f}=%.4f$$',denF,Ufs,dia,vis,ReCd(3));
strFg3=sprintf('$$Substituting\\hspace{2mm}Re=%.4f\\hspace{2mm}and\\hspace{2mm}using\\hspace{2mm}trial\\hspace{2mm}and\\hspace{2mm}error,\\hspace{2mm}\\bf{f_g=%.5f}$$',...
    ReCd(3),f(1));
text('FontSize',13,'Position',[0 -33.5*1.1],'Interpreter','latex','String',strFg1);
text('FontSize',13,'Position',[0 -35.5*1.1],'Interpreter','latex','String',strFg2);
text('FontSize',13,'Position',[0 -37.5*1.1],'Interpreter','latex','String',strRe);
text('FontSize',13,'Position',[0 -39.5*1.1],'Interpreter','latex','String',strFg3);
end

function showPressure(U,eh,f,denF,denP,Ufs,G,length,diameter,isAccelerated,Pcomponent,Ptotal)
text('FontSize',13,'Position',[0 -12.5*1.1],'Interpreter','latex','String','$$\underline{Parameters\hspace{2mm}calculated\hspace{8mm}}$$');
%% State Values
%Ufh
strUfh=strcat('$$Actual\hspace{2mm}Fluid\hspace{2mm}Velocity\hspace{2mm}U_{fH}=',sprintf('%.5f',U(1)),'\hspace{1mm}m/s$$');
text('FontSize',13,'Position',[0 -13.5*1.1],'Interpreter','latex','String',strUfh);
%Uph
strUph=strcat('$$Actual\hspace{2mm}Particle\hspace{2mm}Velocity\hspace{2mm}U_{pH}=',sprintf('%.5f',U(2)),'\hspace{1mm}m/s$$');
text('FontSize',13,'Position',[0 -14.5*1.1],'Interpreter','latex','String',strUph);
%eh
streh=strcat('$$Void\hspace{2mm}Fraction\hspace{2mm}\epsilon_H=',sprintf('%.4f',eh),'$$');
text('FontSize',13,'Position',[0 -15.5*1.1],'Interpreter','latex','String',streh);
%fg
strfg=strcat('$$Fluid\hspace{2mm}Friction\hspace{2mm}Factor\hspace{2mm}f_g=',sprintf('%.5f',f(1)),'$$');
text('FontSize',13,'Position',[0 -16.5*1.1],'Interpreter','latex','String',strfg);
%fp
strfp=strcat('$$Particle\hspace{2mm}Friction\hspace{2mm}Factor\hspace{2mm}f_p=',sprintf('%.5f',f(2)),'$$');
text('FontSize',13,'Position',[0 -17.5*1.1],'Interpreter','latex','String',strfp);
%% title
text('FontSize',13,'Position',[0 -19*1.1],'Interpreter','latex','String','$$\underline{Determining\hspace{2mm}Pressure\hspace{2mm}Drop\hspace{8mm}}$$');
%%
strFfw=strcat('$$F_{fw}\hspace{1mm}L_H=\frac{2f_g\rho_fU^2L_H\hspace{1mm}}{D}\hspace{1mm}=\hspace{1mm}\frac',...
    sprintf('{2(%.5f)(%.3f)(%.5f)^2\\hspace{1mm}(%.3f)\\hspace{15mm}}{%.5f}\\hspace{1mm}=\\hspace{1mm}\\bf{%.5f\\hspace{1mm}Pa}$$',...
    f(1),denF,Ufs,length,diameter,Pcomponent(3)));
strFpw=strcat('$$F_{pw}\hspace{1mm}L_H=\frac{2f_pGU_pL_H\hspace{1mm}}{D}\hspace{1mm}=\hspace{1mm}\frac',...
    sprintf('{2(%.5f)(%.6f)(%.5f)(%.3f)\\hspace{15mm}}{%.5f}\\hspace{1mm}=\\hspace{1mm}\\bf{%.5f\\hspace{1mm}Pa}$$',...
    f(2),G,U(2),length,diameter,Pcomponent(4)));
%% pressure drop
if (isAccelerated)
    str='$$Since\hspace{2mm}mixture\hspace{2mm}was\hspace{2mm}already\hspace{2mm}accelerated,\hspace{2mm}(-\Delta p)=F_{fw}\hspace{1mm}L_H+F_{pw}\hspace{1mm}L_H$$';
    strTotal=sprintf('$$Therefore,\\hspace{2mm}(-\\Delta p)=%.5f\\hspace{1mm}+\\hspace{1mm}%.5f\\hspace{1mm}=\\hspace{1mm}\\bf{%.4f\\hspace{1mm}Pa}$$',...
        Pcomponent(3),Pcomponent(4),Ptotal);
    text('FontSize',13,'Position',[0 -20*1.1],'Interpreter','latex','String',str);
    text('FontSize',13,'Position',[0 -21.5*1.1],'Interpreter','latex','String',strFfw);
    text('FontSize',13,'Position',[0 -23.5*1.1],'Interpreter','latex','String',strFpw);
    text('FontSize',13,'Position',[0 -25*1.1],'Interpreter','latex','String',strTotal);
else
    str='$$Since\hspace{2mm}mixture\hspace{2mm}has\hspace{2mm}to\hspace{2mm}be\hspace{2mm}accelerated,\hspace{2mm}(-\Delta p)=(-\Delta p)_{acc,f}\hspace{1mm}+\hspace{1mm}(-\Delta p)_{acc,p}\hspace{1mm}+\hspace{1mm}F_{fw}\hspace{1mm}L_H\hspace{1mm}+\hspace{1mm}F_{pw}\hspace{1mm}L_H$$';
    strAccf=sprintf('$$(-\\Delta p)_{acc,f}\\hspace{1mm}=\\frac{\\rho_p \\epsilon U_{fH}^2\\hspace{1mm}}{2}\\hspace{1mm}=\\hspace{1mm}\\frac{%.3f(%.4f)(%.5f)\\hspace{5mm}}{2}\\hspace{1mm}=\\hspace{1mm}\\bf{%.5f\\hspace{1mm}Pa}$$',...
        denF,eh,U(1),Pcomponent(1));
    strAccp=sprintf('$$(-\\Delta p)_{acc,p}\\hspace{1mm}=\\frac{\\rho_p(1-\\epsilon) U_{pH}^2\\hspace{2mm}}{2}\\hspace{1mm}=\\hspace{1mm}\\frac{%.3f(1-%.4f)(%.5f)\\hspace{5mm}}{2}\\hspace{1mm}=\\hspace{1mm}\\bf{%.5f\\hspace{1mm}Pa}$$',...
        denP,eh,U(2),Pcomponent(2));
    strTotal=sprintf('$$Therefore,\\hspace{2mm}(-\\Delta p)=%.5f\\hspace{1mm}+%.5f\\hspace{1mm}+%.5f\\hspace{1mm}+\\hspace{1mm}%.5f\\hspace{1mm}=\\hspace{1mm}\\bf{%.4f\\hspace{1mm}Pa}$$',...
        Pcomponent(1),Pcomponent(2),Pcomponent(3),Pcomponent(4),Ptotal);
    text('FontSize',13,'Position',[0 -20*1.1],'Interpreter','latex','String',str);
    text('FontSize',13,'Position',[0 -21.5*1.1],'Interpreter','latex','String',strAccf);
    text('FontSize',13,'Position',[0 -23.5*1.1],'Interpreter','latex','String',strAccp);
    text('FontSize',13,'Position',[0 -25.5*1.1],'Interpreter','latex','String',strFfw);
    text('FontSize',13,'Position',[0 -27.5*1.1],'Interpreter','latex','String',strFpw);
    text('FontSize',13,'Position',[0 -29*1.1],'Interpreter','latex','String',strTotal);
end
    
end   