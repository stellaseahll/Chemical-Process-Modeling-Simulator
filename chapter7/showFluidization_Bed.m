function showFluidization_Bed(size,denF,denP,vis,massP,dia,height,Ufs,n,Ut)
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,12,-30,1]);
A=pi*dia*dia/4;
[e, Umf ,P]=findFluidizationCondition(denF, denP, massP, size, vis,height,dia);
[por hf Pfric Ptotal] =findBedCondition(denF,denP,massP,size,vis,height,dia,Ufs,e,Umf,P);
showValues(size,denF,denP,vis,massP,dia,height,Ufs,A);
showBedCondition(denF,height,e,Ufs,size,Pfric,Ptotal,Umf,vis,por,hf,n,Ut);


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

function showBedCondition(denF,height,e,Ufs,size,Pfric,Ptotal,Umf,vis,por,hf,n,Ut)
text('FontSize',14,'Position',[0 -9.8],'Interpreter','latex','String','$$\underline{Determining\hspace{2mm}Bed\hspace{2mm}Condition\hspace{9mm}}$$');
%Ufs
strSpeed=strcat('$$Minimum\hspace{2mm}Fluidization\hspace{2mm}Velocity\hspace{2mm}U_{mf}=',sprintf('%.5f',Umf),'\hspace{1mm}m/s$$');
text('FontSize',14,'Position',[0 -10.8],'Interpreter','latex','String',strSpeed);
if (round(Ufs*100000)<round(Umf*100000))
    str=strcat('$$Since\hspace{2mm}superficial\hspace{2mm}velocity\hspace{2mm}U_{fs}=\hspace{2mm}',...
        sprintf('%.5f\\hspace{2mm}m/s\\hspace{3mm}<\\hspace{2mm}U_{mf}',Ufs),'\hspace{2mm}\rightarrow\bf{\hspace{2mm}bed\hspace{2mm}is\hspace{2mm}not\hspace{2mm}fluidized}$$');
    text('FontSize',14,'Position',[0 -11.8],'Interpreter','latex','String',str);
    str2='$$Since\hspace{2mm}bed\hspace{2mm}is\hspace{2mm}not\hspace{2mm}fluidized,\hspace{2mm}bed\hspace{2mm}height\hspace{2mm}and\hspace{2mm}porosity\hspace{2mm}remains\hspace{2mm}unchanged$$';
    text('FontSize',14,'Position',[0 -12.8],'Interpreter','latex','String',str2);
    str3=strcat('$$\rightarrow\bf{\hspace{2mm}Final\hspace{2mm}Porosity\hspace{2mm}=\hspace{2mm}Initial\hspace{2mm}Porosity\hspace{2mm}=',...
        sprintf('%.6f}$$',e));
    text('FontSize',14,'Position',[0 -13.8],'Interpreter','latex','String',str3);
    str4=strcat('$$\rightarrow\bf{\hspace{2mm}Final\hspace{2mm}Bed\hspace{2mm}Height=\hspace{2mm}Initial\hspace{2mm}Bed\hspace{2mm}Height\hspace{2mm}=',...
        sprintf('%.3f\\hspace{1mm}m}$$',height));
    text('FontSize',14,'Position',[0 -14.8],'Interpreter','latex','String',str4);
    showPressure(denF,height,e,Ufs,size,Pfric,Ptotal,vis);
else
    str=strcat('$$Since\hspace{2mm}superficial\hspace{2mm}velocity\hspace{2mm}U_{fs}=\hspace{2mm}',...
        sprintf('%.5f\\hspace{2mm}m/s\\hspace{3mm}>=\\hspace{2mm}U_{mf}',Ufs),'\hspace{2mm}\rightarrow\bf{\hspace{2mm}bed\hspace{2mm}is\hspace{2mm}fluidized}$$');
    text('FontSize',14,'Position',[0 -11.8],'Interpreter','latex','String',str);
    str2='$$Since\hspace{2mm}bed\hspace{2mm}is\hspace{2mm}fluidized,\hspace{2mm}frictional\hspace{2mm}pressure\hspace{2mm}drop\hspace{2mm}=\hspace{2mm}Pressure\hspace{2mm}drop\hspace{2mm}at\hspace{2mm}U_{mf}$$';
    text('FontSize',14,'Position',[0 -13],'Interpreter','latex','String',str2);
    strPfric=strcat('$$\rightarrow\hspace{1mm}Frictional\hspace{2mm}pressure\hspace{2mm}drop\hspace{2mm}\bf{(-\Delta p)_{fric}\hspace{2mm}=',sprintf('%.4f\\hspace{1mm}Pa}$$',Pfric));
    text('FontSize',14,'Position',[0 -14],'Interpreter','latex','String',strPfric);
    %% Find total pressure drop
    str='$$From\hspace{2mm}Bernoulli\hspace{2mm}equation:\hspace{2mm}\frac{p_1-p_2}{\rho_fg}+\frac{U_1^2-U_2^2}{2g}+(z_1-z_2)=friction\hspace{2mm}head\hspace{2mm}loss=\hspace{1mm}\frac{(-\Delta p)_{fric}\hspace{2mm}}{\rho_fg}$$';
    str2='$$For\hspace{2mm}constant\hspace{2mm}bed\hspace{2mm}diameter\hspace{2mm}U_1=U_2$$';
    str3=sprintf('$$z_1-z_2=-H=%.3f\\hspace{1mm}m$$',-height);
    str4=strcat('$$Therefore,\hspace{2mm}(-\Delta p)_{total}\hspace{2mm}=\rho_fgH+(-\Delta p)_{fric}\hspace{2mm}=',...
        sprintf('(%.3f)(9.81)(%.3f)+(%.4f)\\hspace{1mm}=\\hspace{1mm}\\bf{%.4f\\hspace{1mm}Pa}$$',denF,height,Pfric,Ptotal));
    text('FontSize',14,'Position',[0 -15.5],'Interpreter','latex','String',str);
    text('FontSize',14,'Position',[0 -16.9],'Interpreter','latex','String',str2);
    text('FontSize',14,'Position',[0 -17.9],'Interpreter','latex','String',str3);
    text('FontSize',14,'Position',[0 -18.9],'Interpreter','latex','String',str4);
    showBedHeight(por,hf,e,height,Ufs,n,Ut);
end


function showPressure(denF,height,e,Ufs,size,Pfric,Ptotal,vis)
strTitle=strcat('$$\underline{Determining\hspace{2mm}frictional\hspace{2mm}pressure\hspace{2mm}drop\hspace{2mm}across\hspace{2mm}the\hspace{2mm}bed\hspace{2mm}when\hspace{2mm}U_{fs}=',...
    sprintf('%.5f',Ufs),'\hspace{23mm}}$$');
text('FontSize',14,'Position',[0 -16.3],'Interpreter','latex','String',strTitle);
%% Determine pressure drop
%% Ergun Equation
str='$$From\hspace{2mm}Ergun\hspace{2mm}equation:';
strErgun1='\frac{(-\Delta p)_{fric}}{H}=';
strErgun2='150\frac{(1-\epsilon)^2\mu U_{fs}\hspace{3mm}}{\epsilon ^3 x^2}+';
strErgun3='1.75\frac{(1-\epsilon)\rho_f U_{fs}^2\hspace{3mm}}{\epsilon ^3 x}$$';
strErgun=strcat(str,strErgun1,strErgun2,strErgun3);
text('FontSize',14,'Position',[0 -17.5],'Interpreter','latex','String',strErgun);
%% Substituting Values
str='$$Substituting\hspace{2mm}the\hspace{2mm}corresponding\hspace{2mm}values:$$';
text('FontSize',14,'Position',[0 -18.5],'Interpreter','latex','String',str);
strSub1=sprintf('$$\\frac{(-\\Delta p)}{%.3f}=',height);
strSub2=sprintf('\\frac{150(1-%.5f)^2(%.6f)(%.5f)\\hspace{7mm}}{(%.5f)^3(%.6f)^2}\\hspace{1mm}+',e,vis,Ufs,e,size);
strSub3=sprintf('\\frac{1.75(1-%.5f)(%.3f)(%.5f)^2\\hspace{7mm}}{(%.5f)^3(%.6f)}\\hspace{1mm}$$',e,denF,Ufs,e,size);
strSub=strcat(strSub1,strSub2,strSub3);
text('FontSize',14,'Position',[0 -19.7],'Interpreter','latex','String',strSub);
%% P
strPfric=strcat('$$\rightarrow\hspace{1mm}Frictional\hspace{2mm}pressure\hspace{2mm}drop\hspace{2mm}\bf{(-\Delta p)_{fric}\hspace{2mm}=',sprintf('%.4f\\hspace{1mm}Pa}$$',Pfric));
%% Find total pressure drop
str='$$From\hspace{2mm}Bernoulli\hspace{2mm}equation:\hspace{2mm}\frac{p_1-p_2}{\rho_fg}+\frac{U_1^2-U_2^2}{2g}+(z_1-z_2)=friction\hspace{2mm}head\hspace{2mm}loss=\hspace{1mm}\frac{(-\Delta p)_{fric}\hspace{2mm}}{\rho_fg}$$';
str2='$$For\hspace{2mm}constant\hspace{2mm}bed\hspace{2mm}diameter\hspace{2mm}U_1=U_2$$';
str3=sprintf('$$z_1-z_2=-H=%.3f\\hspace{1mm}m$$',-height);
str4=strcat('$$Therefore,\hspace{2mm}(-\Delta p)_{total}\hspace{2mm}=\rho_fgH+(-\Delta p)_{fric}\hspace{2mm}=',...
    sprintf('(%.3f)(9.81)(%.3f)+(%.4f)\\hspace{1mm}=\\hspace{1mm}\\bf{%.4f\\hspace{1mm}Pa}$$',denF,height,Pfric,Ptotal));
text('FontSize',14,'Position',[0 -21],'Interpreter','latex','String',strPfric);
text('FontSize',14,'Position',[0 -22.2],'Interpreter','latex','String',str);
text('FontSize',14,'Position',[0 -23.2],'Interpreter','latex','String',str2);
text('FontSize',14,'Position',[0 -24.2],'Interpreter','latex','String',str3);
text('FontSize',14,'Position',[0 -25.2],'Interpreter','latex','String',str4);

function showBedHeight(por,hf,e,height,Ufs,n,Ut)
strTitle=strcat('$$\underline{Determining\hspace{2mm}final\hspace{2mm}porosity\hspace{2mm}and\hspace{2mm}bed\hspace{2mm}height\hspace{12mm}}$$');
text('FontSize',14,'Position',[0 -20.4],'Interpreter','latex','String',strTitle);

%% get n and Ut
strN=strcat('$$From\hspace{2mm}Khan\hspace{2mm}and\hspace{2mm}Richardson\hspace{2mm}correlation,\hspace{2mm}n=',...
    sprintf('%.4f$$',n));
strUt=strcat('$$From\hspace{2mm}graphical\hspace{2mm}method,\hspace{2mm}single\hspace{2mm}particle\hspace{2mm}terminal\hspace{2mm}velocity,\hspace{2mm}U_T=',...
    sprintf('%.5f\\hspace{1mm}m/s$$',Ut));
text('FontSize',14,'Position',[0 -21.4],'Interpreter','latex','String',strN);
text('FontSize',14,'Position',[0 -22.4],'Interpreter','latex','String',strUt);
%% get porosity
str='$$Use\hspace{2mm}Richardson-Zaki\hspace{2mm}equation\hspace{2mm}U=U_T\epsilon^n\hspace{2mm}to\hspace{2mm}estimate\hspace{2mm}final\hspace{2mm}porosity:$$';
str2=sprintf('$$%.5f=%.5f\\epsilon^{%.4f}\\hspace{2mm}\\rightarrow\\hspace{2mm}\\bf{\\epsilon=%.6f}$$',Ufs,Ut,n,por);
text('FontSize',14,'Position',[0 -23.6],'Interpreter','latex','String',str);
text('FontSize',14,'Position',[0 -24.6],'Interpreter','latex','String',str2);
%% get depth
str3=strcat('$$Since\hspace{2mm}total\hspace{2mm}mass\hspace{2mm}of\hspace{2mm}particles\hspace{2mm}remain\hspace{2mm}unchanged,',...
    'M_p=(1-\epsilon_2)\rho_pAH_2=(1-\epsilon_1)\rho_pAH_1$$');
str4=strcat('$$Hence,\hspace{2mm}H_2=\frac{1-\epsilon_1}{1-\epsilon_2}\hspace{2mm}H_1=\frac',...
    sprintf('{1-%.6f\\hspace{2mm}}{1-.%.6f\\hspace{2mm}}\\hspace{2mm}(%.4f)=\\bf{%.4f\\hspace{1mm}m}$$',e,por,height,hf));
text('FontSize',14,'Position',[0 -25.8],'Interpreter','latex','String',str3);
text('FontSize',14,'Position',[0 -27],'Interpreter','latex','String',str4);

