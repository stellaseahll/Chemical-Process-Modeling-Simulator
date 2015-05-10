function showSedimentation3(n,Ut,C,Uint,Ups)
% C=[CBmin CB CEmin CEmax CS Cmax];

set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,20,-37,2]);

showValues(n,Ut,C);
showType(C);
showSettlingFlux(n,Ut,C,Ups);
showInterfaceVelocity(n,Ut,C,Uint,Ups);

function showValues(n,Ut,C)
text('FontSize',15,'Position',[0 0],'Interpreter','latex','String','$$\underline{Parameters\hspace{2mm}given\hspace{5mm}}$$');
%n
strn=strcat('$$Exponent\hspace{2mm}n=',sprintf('%.3f',n),'$$');
text('FontSize',15,'Position',[0 -1*1.2],'Interpreter','latex','String',strn);
%Ut
strUt=strcat('$$Particle\hspace{2mm}Terminal\hspace{2mm}Velocity\hspace{2mm}U_T=',sprintf('%.5f',Ut),'\hspace{1mm}m/s$$');
text('FontSize',15,'Position',[0 -2*1.2],'Interpreter','latex','String',strUt);
%CS
strCS=strcat('$$Sediment\hspace{2mm}Concentration\hspace{2mm}C_S=',sprintf('%.4f',C(5)),'$$');
text('FontSize',15,'Position',[0 -5*1.2],'Interpreter','latex','String',strCS);
%CB
strCB=strcat('$$Initial\hspace{2mm}Suspension\hspace{2mm}Concentration\hspace{2mm}C_B=',sprintf('%.4f',C(2)),'$$');
text('FontSize',15,'Position',[0 -4*1.2],'Interpreter','latex','String',strCB);
%CA
strCA='$$Clear\hspace{2mm}Liquid\hspace{2mm}Concentration\hspace{2mm}C_A=0$$';
text('FontSize',15,'Position',[0 -3*1.2],'Interpreter','latex','String',strCA);

function showType(C)
text('FontSize',15,'Position',[0 -6.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}sedimentation\hspace{2mm}type\hspace{9mm}}$$');
str=strcat('$$From\hspace{2mm}the\hspace{2mm}graph,\hspace{2mm}C_{Bmax}\hspace{2mm}=',...
    sprintf('%.4f,\\hspace{2mm}C_{Bmin}\\hspace{2mm}=%.4f$$',C(4),C(1)));
text('FontSize',15,'Position',[0 -7.5*1.2],'Interpreter','latex','String',str);
str2=strcat('$$Since\hspace{2mm}CB=',sprintf('%.4f',C(2)),'\hspace{2mm}is\hspace{2mm}between\hspace{2mm}',...
    sprintf('C_{Bmin}\\hspace{1mm}=%.4f\\hspace{2mm}and\\hspace{2mm}C_{Bmax}\\hspace{1mm}=%.4f$$',C(1),C(4)));
text('FontSize',15,'Position',[0 -8.5*1.2],'Interpreter','latex','String',str2);
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String',...
    '$$\rightarrow \hspace{3mm} \bf{Type\hspace{2mm}2\hspace{2mm}Sedimentation}$$');

function showSettlingFlux(n,Ut,C,Ups)
text('FontSize',15,'Position',[0 -11*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}settling\hspace{2mm}flux\hspace{2mm}U_{ps}\hspace{9mm}}$$');
str=strcat('$$From\hspace{2mm}the\hspace{2mm}graph,\hspace{2mm}C_{Emax}\hspace{2mm}=C_{Bmax}\hspace{2mm}=',...
    sprintf('%.4f,\\hspace{2mm}C_{Emin}\\hspace{2mm}=%.4f$$',C(4),C(3)));
text('FontSize',15,'Position',[0 -12*1.2],'Interpreter','latex','String',str);
%A
strUpsA='$$Settling\hspace{2mm}flux\hspace{2mm}of\hspace{2mm}clear\hspace{2mm}liquid\hspace{2mm}A,\hspace{2mm}U_{ps,A}=\bf{0}$$';
text('FontSize',15,'Position',[0 -13*1.2],'Interpreter','latex','String',strUpsA);
%B
strUpsB1='$$Settling\hspace{2mm}flux\hspace{2mm}of\hspace{2mm}initial\hspace{2mm}suspension\hspace{2mm}B,\hspace{2mm}U_{ps,B}$$';
strUpsB2=sprintf('$$=U_TC_B(1-C_B)^n=%.5f(%.4f)(1-%.4f)^{%.3f}\\hspace{2mm}=\\bf{%.5f\\hspace{1mm}m/s}$$',Ut,C(2),C(2),n,Ups(2));
text('FontSize',15,'Position',[0 -14*1.2],'Interpreter','latex','String',strUpsB1);
text('FontSize',15,'Position',[0 -15*1.2],'Interpreter','latex','String',strUpsB2);
%S
strUpsS='$$Settling\hspace{2mm}flux\hspace{2mm}of\hspace{2mm}sediment\hspace{2mm}\hspace{2mm}S,\hspace{2mm}U_{ps,S}=\bf{0}$$';
text('FontSize',15,'Position',[0 -16*1.2],'Interpreter','latex','String',strUpsS);
%Bmin
strUpsBmin1='$$Settling\hspace{2mm}flux\hspace{2mm}of\hspace{2mm}suspension\hspace{2mm}B_{min}\hspace{1mm},\hspace{2mm}U_{ps,B_{min}}$$';
strUpsBmin2=sprintf('$$=U_TC_{B_{min}\\hspace{2mm}}(1-C_{B_{min}\\hspace{2mm}})^n=%.5f(%.4f)(1-%.4f)^{%.3f}\\hspace{2mm}=\\bf{%.5f\\hspace{1mm}m/s}$$',Ut,C(1),C(1),n,Ups(1));
text('FontSize',15,'Position',[0 -17*1.2],'Interpreter','latex','String',strUpsBmin1);
text('FontSize',15,'Position',[0 -18*1.2],'Interpreter','latex','String',strUpsBmin2);
%Bmax
strUpsBmax1='$$Settling\hspace{2mm}flux\hspace{2mm}of\hspace{2mm}suspension\hspace{2mm}E_{max}\hspace{2mm}or\hspace{2mm}B_{max}\hspace{1mm},\hspace{2mm}U_{ps,E_{max}}$$';
strUpsBmax2=sprintf('$$=U_TC_{E_{max}\\hspace{2mm}}(1-C_{E_{max}\\hspace{2mm}})^n=%.5f(%.4f)(1-%.4f)^{%.3f}\\hspace{2mm}=\\bf{%.5f\\hspace{1mm}m/s}$$',Ut,C(4),C(4),n,Ups(4));
text('FontSize',15,'Position',[0 -19*1.2],'Interpreter','latex','String',strUpsBmax1);
text('FontSize',15,'Position',[0 -20*1.2],'Interpreter','latex','String',strUpsBmax2);
%Emin
strUpsEmin1='$$Settling\hspace{2mm}flux\hspace{2mm}of\hspace{2mm}suspension\hspace{2mm}E_{min}\hspace{1mm},\hspace{2mm}U_{ps,E_{min}}$$';
strUpsEmin2=sprintf('$$=U_TC_{E_{min}\\hspace{2mm}}(1-C_{E_{min}\\hspace{2mm}})^n=%.5f(%.4f)(1-%.4f)^{%.3f}\\hspace{2mm}=\\bf{%.5f\\hspace{1mm}m/s}$$',Ut,C(3),C(3),n,Ups(3));
text('FontSize',15,'Position',[0 -21*1.2],'Interpreter','latex','String',strUpsEmin1);
text('FontSize',15,'Position',[0 -22*1.2],'Interpreter','latex','String',strUpsEmin2);

function showInterfaceVelocity(n,Ut,C,Uint,Ups)
text('FontSize',15,'Position',[0 -23.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{3mm}interface\hspace{2mm}velocity\hspace{9mm}}$$');
%%
strUab=strcat('$$U_{int,AB}\hspace{2mm}=\frac{dU_{ps}}{dC}=\frac{U_{ps,B}-U_{ps,A}\hspace{3mm}}{C_B-C_A}=\frac',...
    sprintf('{%.6f-0\\hspace{5mm}}{%.4f-0}=\\bf{%.6f\\hspace{1mm}m/s}$$',Ups(2),C(2),Uint(1)));
text('FontSize',15,'Position',[0 -25*1.2],'Interpreter','latex','String',strUab);
%%
strUbemin=strcat('$$U_{int,BE_{min}}\hspace{3mm}=\frac{dU_{ps}}{dC}=\frac{U_{ps,E_{min}}-U_{ps,B}\hspace{3mm}}{C_{E_{min}}-C_B}=\frac',...
    sprintf('{%.6f-%.6f\\hspace{5mm}}{%.4f-%.4f}=\\bf{%.6f\\hspace{1mm}m/s}$$',Ups(3),Ups(2),C(3),C(2),Uint(2)));
text('FontSize',15,'Position',[0 -26.5*1.2],'Interpreter','latex','String',strUbemin);
%%
strUEmaxS=strcat('$$U_{int,E_{max}\hspace{1mm}S}\hspace{3mm}=\frac{dU_{ps}}{dC}=\frac{U_{ps,S}-U_{ps,E_{max}}\hspace{3mm}}{C_S-C_{E_{max}}}=\frac',...
    sprintf('{0-%.6f}{%.4f-%.4f\\hspace{5mm}}=\\bf{%.6f\\hspace{1mm}m/s}$$',Ups(4),C(4),C(2),Uint(3)));
text('FontSize',15,'Position',[0 -28*1.2],'Interpreter','latex','String',strUEmaxS);