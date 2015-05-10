function showBend(size,denF,denP,vis,massP,dia,Ufs,numBends,step)
addpath(genpath('../chapter2'));
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,12,-45,1]);
A=pi*dia*dia/4;
G=massP/A;
Ufs=round(Ufs*100000)/100000;
Ut=calcTermV(denF,denP,size,vis);
[Ptotal ,Pcomponent ,ev, U, f, ReCd]=findVerticalPipeConditions(massP,denP,denF,size,vis,dia,7.5,0,Ufs,0);
Ptotal=findBendConditions(massP,denP,denF,size,vis,dia,Ufs);
showValues(size,denF,denP,vis,massP,dia,numBends,Ufs,A,G);
if (step==1)
    showVoidFraction(Ufs,U,denP,G,ev,Ut,ReCd,f,denF,dia,vis);
elseif (step==2)
   showPressure(U,ev,f,denF,denP,Ufs,G,dia,Pcomponent,Ptotal,numBends);
end
end

function showValues(size,denF,denP,vis,massP,dia,numBends,Ufs,A,G)
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
strLength=strcat('$$Vertical\hspace{2mm}Number\hspace{2mm}of\hspace{2mm}Bends\hspace{2mm}n=',sprintf('%.5f',numBends),'\hspace{1mm}$$');
text('FontSize',13,'Position',[0 -8*1.1],'Interpreter','latex','String',strLength);
%Area
strArea=strcat('$$Cross-sectional\hspace{2mm}Area\hspace{2mm}A=\frac{\pi D^2}{4}=\frac',...
    sprintf('{%.4f(%.5f)^2\\hspace{4mm}}{4}\\hspace{2mm}=%.6f\\hspace{1mm}m^2$$',pi,dia,A));
text('FontSize',13,'Position',[0 -9.5*1.1],'Interpreter','latex','String',strArea);
%mass flux
strArea=strcat('$$Mass\hspace{2mm}Flux\hspace{2mm}G=\frac{M_p}{A}=\frac',...
    sprintf('{%.6f}{%.6f\\hspace{2mm}}\\hspace{2mm}=%.6f\\hspace{1mm}kg/(m^2 \\cdot s)$$',massP,A,G));
text('FontSize',13,'Position',[0 -11.5*1.1],'Interpreter','latex','String',strArea);
end

function showVoidFraction(Ufs,U,denP,G,ev,Ut,ReCd,f,denF,dia,vis)
text('FontSize',13,'Position',[0 -13.5*1.1],'Interpreter','latex','String','$$\underline{Determining\hspace{2mm}other\hspace{2mm}parameters\hspace{12mm}}$$');
%ev
text('FontSize',13,'Position',[0 -15*1.1],'Interpreter','latex','String','$$\bf{To\hspace{2mm}find\hspace{2mm}void\hspace{2mm}fraction\hspace{2mm}\epsilon_{H}:\hspace{10mm}}$$');
strUpv='$$U_{pv}=\frac{U}{\epsilon_v}-U_T\hspace{54mm}(1)$$';
strUpv2='$$From\hspace{2mm}continuity,\hspace{2mm}G=\rho_p(1-\epsilon_v)U_{pv}\hspace{10mm}(2)$$';
strUpv3='$$Substituting\hspace{2mm}equations\hspace{2mm}(1)\hspace{2mm}and\hspace{2mm}(2),\hspace{2mm}\epsilon_v^2U_T-\left(U_T+U+\frac{G}{\rho_p}\right)\hspace{1mm}\epsilon_v+U=0$$';
strUt=sprintf('$$From\\hspace{2mm}graph,\\hspace{2mm}U_T=%.5f\\hspace{2mm}m/s$$',Ut);
b=Ut+Ufs+G/denP;
streh=sprintf('$$Therefore,\\hspace{2mm}%.5f\\epsilon_v^2-%.5f\\epsilon_v+%.5f=0,\\hspace{2mm}\\rightarrow\\hspace{2mm}\\bf{\\epsilon_v=%.4f}$$',Ut,b,Ufs,ev);
text('FontSize',13,'Position',[0 -16.5*1.1],'Interpreter','latex','String',strUpv);
text('FontSize',13,'Position',[0 -18*1.1],'Interpreter','latex','String',strUpv2);
text('FontSize',13,'Position',[0 -19.5*1.1],'Interpreter','latex','String',strUpv3);
text('FontSize',13,'Position',[0 -21*1.1],'Interpreter','latex','String',strUt);
text('FontSize',13,'Position',[0 -22.5*1.1],'Interpreter','latex','String',streh);
%Upv
text('FontSize',13,'Position',[0 -24.5*1.1],'Interpreter','latex','String','$$\bf{To\hspace{2mm}find\hspace{2mm}actual\hspace{2mm}particle\hspace{2mm}velocity\hspace{2mm}U_{pv}:\hspace{10mm}}$$');
streH1=strcat('$$U_{pv}=\frac{G}{\rho_p(1-\epsilon_v}=',...
    sprintf('\\frac{%.6f}{(%.3f)(1-%.4f)\\hspace{3mm}}=\\bf{%.4f\\hspace{1mm}m/s}$$',G,denP,ev,U(2)));
text('FontSize',13,'Position',[0 -26*1.1],'Interpreter','latex','String',streH1);
%Uf
text('FontSize',13,'Position',[0 -27.5*1.1],'Interpreter','latex','String','$$\bf{To\hspace{2mm}find\hspace{2mm}actual\hspace{2mm}fluid\hspace{2mm}velocity\hspace{2mm}U_{fH}:\hspace{10mm}}$$');
strUfv=strcat('$$U_{fv}=\frac{U}{\epsilon_v}=',...
    sprintf('\\frac{%.5f\\hspace{1mm}}{%.4f}=\\bf{%.5f\\hspace{1mm}m/s}$$',Ufs,ev,U(1)));
text('FontSize',13,'Position',[0 -29*1.1],'Interpreter','latex','String',strUfv);
%ff
text('FontSize',13,'Position',[0 -31*1.1],'Interpreter','latex','String','$$\bf{To\hspace{2mm}find\hspace{2mm}fluid\hspace{2mm}friction\hspace{2mm}factor\hspace{2mm}f_g:\hspace{10mm}}$$');
strFg1='$$From\hspace{2mm}Colebrooke\hspace{2mm}equation,\hspace{2mm}\frac{1}{\sqrt{f_g}}=-4.0log_{10}\left(\frac{e/D}{3.7}+\frac{1.256}{Re\sqrt{f_g}}\right)$$';
strFg2='$$Assuming\hspace{2mm}smooth\hspace{2mm}pipe,\hspace{2mm}e=0\hspace{2mm}\rightarrow\hspace{2mm}\frac{1}{\sqrt{f_g}}=-4.0log_{10}\left(\frac{1.256}{Re\sqrt{f_g}}\right)$$';
strRe=sprintf('$$Re=\\frac{\\rho_fUD\\hspace{2mm}}{\\mu}=\\frac{%.3f(%.5f)(%.3f)\\hspace{5mm}}{%.6f}=%.4f$$',denF,Ufs,dia,vis,ReCd);
strFg3=sprintf('$$Substituting\\hspace{2mm}Re=%.4f\\hspace{2mm}and\\hspace{2mm}using\\hspace{2mm}trial\\hspace{2mm}and\\hspace{2mm}error,\\hspace{2mm}\\bf{f_g=%.5f}$$',...
    ReCd,f);
text('FontSize',13,'Position',[0 -33*1.1],'Interpreter','latex','String',strFg1);
text('FontSize',13,'Position',[0 -36*1.1],'Interpreter','latex','String',strFg2);
text('FontSize',13,'Position',[0 -38*1.1],'Interpreter','latex','String',strRe);
text('FontSize',13,'Position',[0 -40*1.1],'Interpreter','latex','String',strFg3);
end


function showPressure(U,ev,f,denF,denP,Ufs,G,diameter,Pcomponent,Ptotal,numBends)
text('FontSize',13,'Position',[0 -13.5*1.1],'Interpreter','latex','String','$$\underline{Parameters\hspace{2mm}calculated\hspace{8mm}}$$');
%% State Values
%Ufv
strUfv=strcat('$$Actual\hspace{2mm}Fluid\hspace{2mm}Velocity\hspace{2mm}U_{fv}=',sprintf('%.5f',U(1)),'\hspace{1mm}m/s$$');
text('FontSize',13,'Position',[0 -15*1.1],'Interpreter','latex','String',strUfv);
%Upv
strUpv=strcat('$$Actual\hspace{2mm}Particle\hspace{2mm}Velocity\hspace{2mm}U_{pv}=',sprintf('%.5f',U(2)),'\hspace{1mm}m/s$$');
text('FontSize',13,'Position',[0 -16*1.1],'Interpreter','latex','String',strUpv);
%ev
strev=strcat('$$Void\hspace{2mm}Fraction\hspace{2mm}\epsilon_H=',sprintf('%.4f',ev),'$$');
text('FontSize',13,'Position',[0 -17*1.1],'Interpreter','latex','String',strev);
%fv
strfg=strcat('$$Fluid\hspace{2mm}Friction\hspace{2mm}Factor\hspace{2mm}f_g=',sprintf('%.5f',f),'$$');
text('FontSize',13,'Position',[0 -18*1.1],'Interpreter','latex','String',strfg);
%% title
text('FontSize',13,'Position',[0 -19.5*1.1],'Interpreter','latex','String','$$\underline{Determining\hspace{2mm}Pressure\hspace{2mm}Drop\hspace{8mm}}$$');
%%
strFfw=strcat('$$F_{fw}\hspace{1mm}(7.5)=\frac{2f_g\rho_fU^2(7.5)\hspace{1mm}}{D}\hspace{1mm}=\hspace{1mm}\frac',...
    sprintf('{2(%.5f)(%.3f)(%.5f)^2\\hspace{1mm}(7.5)\\hspace{14mm}}{%.5f}\\hspace{1mm}=\\hspace{1mm}\\bf{%.5f\\hspace{1mm}Pa}$$',...
    f,denF,Ufs,diameter,Pcomponent(3)));
strFpw=strcat('$$F_{pw}\hspace{1mm}(7.5)=0.057G(7.5)\sqrt{\frac{g}{D}}=',...
    sprintf('0.057(%.6f)(7.5)\\sqrt{\\frac{9.81}{%.5f\\hspace{2mm}}}\\hspace{1mm}=\\hspace{1mm}\\bf{%.5f\\hspace{1mm}Pa}$$',...
    G,diameter,Pcomponent(4)));
strGp=sprintf('$$(-\\Delta p)_{grav,p}\\hspace{1mm}=\\rho_p(1-\\epsilon_v)g(7.5)=%.3f(1-%.4f)(9.81)(7.5)\\hspace{1mm}=\\hspace{1mm}\\bf{%.5f\\hspace{1mm}Pa}$$',...
    denP,ev,Pcomponent(5));
strGf=sprintf('$$(-\\Delta p)_{grav,f}\\hspace{1mm}=\\rho_f(epsilon_v)g(7.5)=%.3f(%.4f)(9.81)(7.5)\\hspace{1mm}=\\hspace{1mm}\\bf{%.5f\\hspace{1mm}Pa}$$',...
    denF,ev,Pcomponent(6));
%% pressure drop
str='$$(-\Delta p)_{one\hspace{2mm}bend}\hspace{3mm}=Pressure\hspace{2mm}drop\hspace{2mm}across\hspace{2mm}7.5m\hspace{2mm}vertical\hspace{2mm}pipe$$';
str2='$$\hspace{27mm}=F_{fw}\hspace{1mm}(7.5)+F_{pw}\hspace{1mm}(7.5)+(-\Delta p)_{grav,f}\hspace{1mm}+\hspace{1mm}(-\Delta p)_{grav,p}$$';
strTotal=sprintf('$$Hence,\\hspace{2mm}(-\\Delta p)_{one\\hspace{2mm}bend}\\hspace{3mm}=%.5f\\hspace{1mm}+\\hspace{1mm}%.5f+%.5f\\hspace{1mm}+\\hspace{1mm}%.5f\\hspace{1mm}=\\hspace{1mm}\\bf{%.4f\\hspace{1mm}Pa}$$',...
    Pcomponent(3),Pcomponent(4),Pcomponent(5),Pcomponent(6),Ptotal);
text('FontSize',13,'Position',[0 -20.5*1.1],'Interpreter','latex','String',str);
text('FontSize',13,'Position',[0 -22.5*1.1],'Interpreter','latex','String',str2);
text('FontSize',13,'Position',[0 -24.5*1.1],'Interpreter','latex','String',strFfw);
text('FontSize',13,'Position',[0 -26.5*1.1],'Interpreter','latex','String',strFpw);
text('FontSize',13,'Position',[0 -28.5*1.1],'Interpreter','latex','String',strGp);
text('FontSize',13,'Position',[0 -30.5*1.1],'Interpreter','latex','String',strGf);
text('FontSize',13,'Position',[0 -32.5*1.1],'Interpreter','latex','String',strTotal);
str3=strcat('$$(-\Delta p)=(-\Delta p)_{one\hspace{2mm}bend} \hspace{3mm}\times \hspace{2mm}number\hspace{2mm}of\hspace{2mm}bends =',...
    sprintf('%.4f \\times %d=\\bf{%.4f\\hspace{1mm}Pa}$$',Ptotal,numBends,numBends*Ptotal));
text('FontSize',13,'Position',[0 -34*1.1],'Interpreter','latex','String',str3);
end   