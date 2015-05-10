function showSedimentation1(n,Ut,C,Uint,Ups)
% C=[CBmin CB CEmin CEmax CS Cmax];

set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,20,-30,3]);

showValues(n,Ut,C);
showType;
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

function showType()
text('FontSize',15,'Position',[0 -6.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}sedimentation\hspace{2mm}type\hspace{9mm}}$$');
text('FontSize',15,'Position',[0 -7.5*1.2],'Interpreter','latex','String',...
    '$$From\hspace{2mm}the\hspace{2mm}graph,\hspace{2mm}there\hspace{2mm}is\hspace{2mm}no\hspace{2mm}CB_{max}.$$');
text('FontSize',15,'Position',[0 -8.5*1.2],'Interpreter','latex','String',...
    '$$\rightarrow \hspace{3mm} \bf{Type\hspace{2mm}1\hspace{2mm}Sedimentation}$$');

function showSettlingFlux(n,Ut,C,Ups)
text('FontSize',15,'Position',[0 -10*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}settling\hspace{2mm}flux\hspace{2mm}U_{ps}\hspace{9mm}}$$');
%A
strUpsA='$$Settling\hspace{2mm}flux\hspace{2mm}of\hspace{2mm}clear\hspace{2mm}liquid\hspace{2mm}A,\hspace{2mm}U_{ps,A}=\bf{0}$$';
text('FontSize',15,'Position',[0 -11*1.2],'Interpreter','latex','String',strUpsA);
%B
strUpsB1='$$Settling\hspace{2mm}flux\hspace{2mm}of\hspace{2mm}initial\hspace{2mm}suspension\hspace{2mm}B,\hspace{2mm}U_{ps,B}$$';
strUpsB2=sprintf('$$=U_TC_B(1-C_B)^n=%.5f(%.4f)(1-%.4f)^{%.3f}\\hspace{2mm}=\\bf{%.5f\\hspace{1mm}m/s}$$',Ut,C(2),C(2),n,Ups(2));
text('FontSize',15,'Position',[0 -12*1.2],'Interpreter','latex','String',strUpsB1);
text('FontSize',15,'Position',[0 -13*1.2],'Interpreter','latex','String',strUpsB2);
%S
strUpsS='$$Settling\hspace{2mm}flux\hspace{2mm}of\hspace{2mm}sediment\hspace{2mm}\hspace{2mm}S,\hspace{2mm}U_{ps,S}=\bf{0}$$';
text('FontSize',15,'Position',[0 -14*1.2],'Interpreter','latex','String',strUpsS);

function showInterfaceVelocity(n,Ut,C,Uint,Ups)
text('FontSize',15,'Position',[0 -15.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{3mm}interface\hspace{2mm}velocity\hspace{9mm}}$$');
strUab=strcat('$$U_{int,AB}\hspace{2mm}=\frac{dU_{ps}}{dC}=\frac{U_{ps,B}-U_{ps,A}\hspace{3mm}}{C_B-C_A}=\frac',...
    sprintf('{%.6f-0\\hspace{5mm}}{%.4f-0}=\\bf{%.6f\\hspace{1mm}m/s}$$',Ups(2),C(2),Uint(1)));
text('FontSize',15,'Position',[0 -17*1.2],'Interpreter','latex','String',strUab);
strUbs=strcat('$$U_{int,BS}\hspace{3mm}=\frac{dU_{ps}}{dC}=\frac{U_{ps,S}-U_{ps,B}\hspace{3mm}}{C_S-C_B}=\frac',...
    sprintf('{0-%.6f}{%.4f-%.4f\\hspace{5mm}}=\\bf{%.6f\\hspace{1mm}m/s}$$',Ups(2),C(5),C(2),Uint(2)));
text('FontSize',15,'Position',[0 -18.5*1.2],'Interpreter','latex','String',strUbs);