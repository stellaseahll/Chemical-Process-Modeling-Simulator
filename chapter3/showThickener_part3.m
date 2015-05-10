function showThickener_part3(n,Ut,C,Ups,flux_grad,F,L,V,A,type)
%flux_grad=[F/A L/A V/A]
%C=[CB  CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT CFcrit CBmax   ] for hasMinPoint
%Ups=[UpsF UpsL UpsV] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Upsmax]; for hasMinPoint

set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,20,-30,3]);

showValues(n,Ut,C,F,L,V,A);
if (type==1)
    showBottomSettlingFluxType1(n,Ut,C,F,flux_grad,A,Ups);
elseif (type==2)
    showBottomSettlingFluxType2(n,Ut,C,F,flux_grad,A,Ups);
elseif ((type==3)||(type==6))
    showBottomSettlingFluxType3(n,Ut,C,F,flux_grad,A,Ups);
elseif (type==4)
    showBottomSettlingFluxType4(n,Ut,C,F,flux_grad,A,Ups);
elseif (type==5)
    showBottomSettlingFluxType5(n,Ut,C,F,flux_grad,A,Ups);
end 

function showValues(n,Ut,C,F,L,V,A)
text('FontSize',15,'Position',[0 0],'Interpreter','latex','String','$$\underline{Parameters\hspace{2mm}given\hspace{5mm}}$$');
%n
strn=strcat('$$Exponent\hspace{2mm}n=',sprintf('%.3f',n),'$$');
text('FontSize',15,'Position',[0 -1*1.2],'Interpreter','latex','String',strn);
%Ut
strUt=strcat('$$Particle\hspace{2mm}Terminal\hspace{2mm}Velocity\hspace{2mm}U_T=',sprintf('%.5f',Ut),'\hspace{1mm}m/s$$');
text('FontSize',15,'Position',[0 -2*1.2],'Interpreter','latex','String',strUt);
%F
strF=strcat('$$Feed\hspace{2mm}Flow\hspace{2mm}Rate\hspace{2mm}F=',sprintf('%.6f',F),'\hspace{1mm}m^3/s$$');
text('FontSize',15,'Position',[0 -3*1.2],'Interpreter','latex','String',strF);
%L
strL=strcat('$$Underflow\hspace{2mm}Rate\hspace{2mm}L=',sprintf('%.6f',L),'\hspace{1mm}m^3/s$$');
text('FontSize',15,'Position',[0 -4*1.2],'Interpreter','latex','String',strL);
%V
strV=strcat('$$Overflow\hspace{2mm}Rate\hspace{2mm}V=',sprintf('%.6f',V),'\hspace{1mm}m^3/s$$');
text('FontSize',15,'Position',[0 -5*1.2],'Interpreter','latex','String',strV);
%CF
strCF=strcat('$$Feed\hspace{2mm}Concentration\hspace{2mm}C_F=',sprintf('%.4f',C(2)),'$$');
text('FontSize',15,'Position',[0 -6*1.2],'Interpreter','latex','String',strCF);
%CF
strA=strcat('$$Cross-sectional\hspace{2mm}Area\hspace{2mm}of\hspace{2mm}Thickener\hspace{2mm}A=',sprintf('%.6f',A),'\hspace{1mm}m^2$$');
text('FontSize',15,'Position',[0 -7*1.2],'Interpreter','latex','String',strA);

function showBottomSettlingFluxType1(n,Ut,C,F,flux_grad,A,Ups)
text('FontSize',15,'Position',[0 -8.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}Bottom\hspace{2mm}Section\hspace{2mm}Concentration\hspace{13mm}}$$');
%UpsF
strUpsF=strcat('$$Feed\hspace{2mm}flux\hspace{2mm}at\hspace{2mm}feed\hspace{2mm}concentration\hspace{2mm}C_F,\hspace{2mm}U_{ps}=',...
    '\frac{FC_F}{A}=\frac',sprintf('{(%.6f)(%.4f)\\hspace{5mm}}{%.6f}=%.6f\\hspace{1mm}m/s$$',F,C(2),A,Ups(1)));
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String',strUpsF);
%
str='$$For\hspace{2mm}critically\hspace{2mm}loaded\hspace{2mm}system,\hspace{2mm}the\hspace{2mm}bottom\hspace{2mm}section\hspace{2mm}carries\hspace{2mm}all\hspace{2mm}the\hspace{2mm}flux$$';
text('FontSize',15,'Position',[0 -11*1.2],'Interpreter','latex','String',str);
%CB
strCB='$$Therefore,\hspace{2mm}Feed\hspace{2mm}Flux\hspace{2mm}=\hspace{2mm}Downward\hspace{2mm}Flux\hspace{2mm}at\hspace{2mm}Bottom$$';
text('FontSize',15,'Position',[0 -12*1.2],'Interpreter','latex','String',strCB);
strCB2=strcat('$$Under\hspace{2mm}critically\hspace{2mm}loaded\hspace{2mm}conditions,\hspace{2mm}\bf{C_F=C_B=\hspace{2mm}',sprintf('%.4f}$$',C(1)));
text('FontSize',15,'Position',[0 -13*1.2],'Interpreter','latex','String',strCB2);
%CL
strCL='$$By\hspace{2mm}material\hspace{2mm}balance,\hspace{2mm}Underflow\hspace{2mm}Flux\hspace{2mm}=\hspace{2mm}Downward\hspace{2mm}Flux\hspace{2mm}at\hspace{2mm}Bottom$$';
text('FontSize',15,'Position',[0 -14.5*1.2],'Interpreter','latex','String',strCL);
strCL2=strcat('$$\frac{LC_L}{A}=',sprintf('%.6fC_L=%.6f$$',flux_grad(2),Ups(1)));
text('FontSize',15,'Position',[0 -15.5*1.2],'Interpreter','latex','String',strCL2);
strCL3=strcat('$$\rightarrow\hspace{3mm}\bf{C_L=',sprintf('%.4f}$$',C(3)));
text('FontSize',15,'Position',[0 -16.5*1.2],'Interpreter','latex','String',strCL3);


function showBottomSettlingFluxType2(n,Ut,C,F,flux_grad,A,Ups)
text('FontSize',15,'Position',[0 -8.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}Bottom\hspace{2mm}Section\hspace{2mm}Concentration\hspace{13mm}}$$');
%UpsF
strUpsF=strcat('$$Feed\hspace{2mm}flux\hspace{2mm}at\hspace{2mm}feed\hspace{2mm}concentration\hspace{2mm}C_F,\hspace{2mm}U_{ps}=',...
    '\frac{FC_F}{A}=\frac',sprintf('{(%.6f)(%.4f)\\hspace{5mm}}{%.6f}=%.6f\\hspace{1mm}m/s$$',F,C(2),A,Ups(1)));
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String',strUpsF);
%CB
strCB1=strcat('$$Under\hspace{2mm}overloaded\hspace{2mm}conditions,\hspace{2mm}\bf{C_F=C_B\hspace{2mm}=',sprintf('%.4f}$$',C(1)));
text('FontSize',15,'Position',[0 -11*1.2],'Interpreter','latex','String',strCB1);
%UpsBatch
strUpsBatch1='$$Maximum\hspace{2mm}Downward\hspace{2mm}flux\hspace{2mm}at\hspace{2mm}C=C_B,\hspace{2mm}U_{ps,bottom}$$';
strUpsBatch2='$$=U_TC_F(1-C_F)^n+\frac{L}{A}\hspace{2mm}C_F$$';
strUpsBatch3=sprintf('$$=%.6f(%.4f)(1-%.4f)^{%.3f}\\hspace{3mm}+{%.6f}\\hspace{4mm}(%.4f)=\\hspace{2mm}%.6f\\hspace{1mm}m/s$$',Ut,C(2),C(2),n,flux_grad(2),C(2),Ups(2));
text('FontSize',15,'Position',[0 -12.5*1.2],'Interpreter','latex','String',strUpsBatch1);
text('FontSize',15,'Position',[0 -13.5*1.2],'Interpreter','latex','String',strUpsBatch2);
text('FontSize',15,'Position',[0 -14.5*1.2],'Interpreter','latex','String',strUpsBatch3);
%CL
strCL='$$By\hspace{2mm}material\hspace{2mm}balance,\hspace{2mm}Underflow\hspace{2mm}Flux\hspace{2mm}=\hspace{2mm}Maximum\hspace{2mm}Downward\hspace{2mm}Flux\hspace{2mm}$$';
text('FontSize',15,'Position',[0 -16*1.2],'Interpreter','latex','String',strCL);
strCL2=strcat('$$\frac{LC_L}{A}=',sprintf('%.6fC_L=%.6f$$',flux_grad(2),Ups(2)));
text('FontSize',15,'Position',[0 -17*1.2],'Interpreter','latex','String',strCL2);
strCL3=strcat('$$\rightarrow\hspace{3mm}\bf{C_L=',sprintf('%.4f}$$',C(3)));
text('FontSize',15,'Position',[0 -18*1.2],'Interpreter','latex','String',strCL3);


function showBottomSettlingFluxType3(n,Ut,C,F,flux_grad,A,Ups)
text('FontSize',15,'Position',[0 -8.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}Bottom\hspace{2mm}Section\hspace{2mm}Concentration\hspace{13mm}}$$');
%UpsF
strUpsF=strcat('$$Feed\hspace{2mm}flux\hspace{2mm}at\hspace{2mm}feed\hspace{2mm}concentration\hspace{2mm}C_F,\hspace{2mm}U_{ps}=',...
    '\frac{FC_F}{A}=\frac',sprintf('{(%.6f)(%.4f)\\hspace{5mm}}{%.6f}=%.6f\\hspace{1mm}m/s$$',F,C(2),A,Ups(1)));
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String',strUpsF);
%
str='$$For\hspace{2mm}underloaded\hspace{2mm}system,\hspace{2mm}the\hspace{2mm}bottom\hspace{2mm}section\hspace{2mm}carries\hspace{2mm}all\hspace{2mm}the\hspace{2mm}flux$$';
text('FontSize',15,'Position',[0 -11*1.2],'Interpreter','latex','String',str);
%CB
strCB='$$Therefore,\hspace{2mm}Feed\hspace{2mm}Flux\hspace{2mm}=\hspace{2mm}Downward\hspace{2mm}Flux\hspace{2mm}at\hspace{2mm}Bottom$$';
text('FontSize',15,'Position',[0 -12*1.2],'Interpreter','latex','String',strCB);
strCB2=strcat('$$U_{ps}=',sprintf('%.6f=',Ups(1)),'U_TC_B(1-C_B)^n+\frac{L}{A}C_B=',sprintf('%.6fC_B(1-C_B)^{%.3f}\\hspace{2mm}+{%.6f}\\hspace{3mm}C_B$$',Ut,n,flux_grad(2)));
text('FontSize',15,'Position',[0 -13*1.2],'Interpreter','latex','String',strCB2);
strCB3=strcat('$$\rightarrow\hspace{3mm}\bf{C_B=',sprintf('%.4f}$$',C(1)));
text('FontSize',15,'Position',[0 -14*1.2],'Interpreter','latex','String',strCB3);
%CL
strCL='$$By\hspace{2mm}material\hspace{2mm}balance,\hspace{2mm}Underflow\hspace{2mm}Flux\hspace{2mm}=\hspace{2mm}Downward\hspace{2mm}Flux\hspace{2mm}at\hspace{2mm}Bottom$$';
text('FontSize',15,'Position',[0 -15.5*1.2],'Interpreter','latex','String',strCL);
strCL2=strcat('$$\frac{LC_L}{A}=',sprintf('%.6fC_L=%.6f$$',flux_grad(2),Ups(1)));
text('FontSize',15,'Position',[0 -16.5*1.2],'Interpreter','latex','String',strCL2);
strCL3=strcat('$$\rightarrow\hspace{3mm}\bf{C_L=',sprintf('%.4f}$$',C(3)));
text('FontSize',15,'Position',[0 -17.5*1.2],'Interpreter','latex','String',strCL3);

function showBottomSettlingFluxType4(n,Ut,C,F,flux_grad,A,Ups)
text('FontSize',15,'Position',[0 -8.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}Bottom\hspace{2mm}Section\hspace{2mm}Concentration\hspace{13mm}}$$');
%
str='$$For\hspace{2mm}critically\hspace{2mm}loaded\hspace{2mm}system,\hspace{2mm}the\hspace{2mm}bottom\hspace{2mm}section\hspace{2mm}carries\hspace{2mm}all\hspace{2mm}the\hspace{2mm}flux$$';
str2=strcat('$$Therefore,\hspace{2mm}Feed\hspace{2mm}Flux\hspace{2mm}=\hspace{2mm}Downward\hspace{2mm}Flux\hspace{2mm}at\hspace{2mm}Bottom=U_{ps_{max}}\hspace{2mm}=',sprintf('%.6f\\hspace{1mm}m/s$$',Ups(4)));
str3='$$Since\hspace{2mm}thickener\hspace{2mm}has\hspace{2mm}a\hspace{2mm}turning\hspace{2mm}point,\hspace{2mm}there\hspace{2mm}should\hspace{2mm}be\hspace{2mm}2\hspace{2mm}C_B\hspace{2mm}values$$';
str4=strcat('$$where\hspace{2mm}the\hspace{2mm}first\hspace{2mm}\bf{C_B=\hspace{2mm}C_{max}=',sprintf('%.4f}$$',C(7)));
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String',str);
text('FontSize',15,'Position',[0 -10.5*1.2],'Interpreter','latex','String',str2);
text('FontSize',15,'Position',[0 -12*1.2],'Interpreter','latex','String',str3);
text('FontSize',15,'Position',[0 -13*1.2],'Interpreter','latex','String',str4);
%CB
strCB='$$Solve\hspace{2mm}U_TC_B(1-C_B)^n+\frac{L}{A}\hspace{2mm}C_B=U_{ps_{max}}\hspace{4mm}to\hspace{2mm}get\hspace{2mm}the\hspace{2mm}other\hspace{2mm}C_B:$$';
text('FontSize',15,'Position',[0 -14.5*1.2],'Interpreter','latex','String',strCB);
strCB2=sprintf('$$%.6fC_B(1-C_B)^{%.3f}\\hspace{3mm}+{%.6f}\\hspace{4mm}C_B=%.6f$$',Ut,n,flux_grad(2),Ups(4));
text('FontSize',15,'Position',[0 -15.5*1.2],'Interpreter','latex','String',strCB2);
strCB3=strcat('$$\rightarrow\hspace{3mm}\bf{C_B=',sprintf('%.4f}$$',C(1)));
text('FontSize',15,'Position',[0 -16.5*1.2],'Interpreter','latex','String',strCB3);
%CL
strCL='$$By\hspace{2mm}material\hspace{2mm}balance,\hspace{2mm}Underflow\hspace{2mm}Flux\hspace{2mm}=\hspace{2mm}Downward\hspace{2mm}Flux\hspace{2mm}at\hspace{2mm}Bottom=U_{ps_{max}}$$';
text('FontSize',15,'Position',[0 -18*1.2],'Interpreter','latex','String',strCL);
strCL2=strcat('$$\frac{LC_L}{A}=',sprintf('%.6fC_L=%.6f$$',flux_grad(2),Ups(4)));
text('FontSize',15,'Position',[0 -19*1.2],'Interpreter','latex','String',strCL2);
strCL3=strcat('$$\rightarrow\hspace{3mm}\bf{C_L=',sprintf('%.4f}$$',C(3)));
text('FontSize',15,'Position',[0 -20*1.2],'Interpreter','latex','String',strCL3);

function showBottomSettlingFluxType5(n,Ut,C,F,flux_grad,A,Ups)
text('FontSize',15,'Position',[0 -8.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}Bottom\hspace{2mm}Section\hspace{2mm}Concentration\hspace{13mm}}$$');
str=strcat('$$For\hspace{2mm}overloaded\hspace{2mm}system,\hspace{2mm}Downward\hspace{2mm}Flux\hspace{2mm}at\hspace{2mm}Bottom=U_{ps_{max}}\hspace{3mm}=',sprintf('%.6f\\hspace{1mm}m/s$$',Ups(4)));
str3='$$Since\hspace{2mm}this\hspace{2mm}thickener\hspace{2mm}has\hspace{2mm}a\hspace{2mm}turning\hspace{2mm}point,\hspace{2mm}there\hspace{2mm}should\hspace{2mm}be\hspace{2mm}2\hspace{2mm}C_B\hspace{2mm}values$$';
str4=strcat('$$where\hspace{2mm}the\hspace{2mm}first\hspace{2mm}\bf{C_B=\hspace{2mm}C_{max}=',sprintf('%.4f}$$',C(7)));
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String',str);
text('FontSize',15,'Position',[0 -10.5*1.2],'Interpreter','latex','String',str3);
text('FontSize',15,'Position',[0 -11.5*1.2],'Interpreter','latex','String',str4);
%CB
strCB='$$Solve\hspace{2mm}U_TC_B(1-C_B)^n+\frac{L}{A}\hspace{2mm}C_B=U_{ps_{max}}\hspace{4mm}to\hspace{2mm}get\hspace{2mm}the\hspace{2mm}other\hspace{2mm}C_B:$$';
text('FontSize',15,'Position',[0 -13*1.2],'Interpreter','latex','String',strCB);
strCB2=sprintf('$$%.6fC_B(1-C_B)^{%.3f}\\hspace{3mm}+{%.6f}\\hspace{4mm}C_B=%.6f$$',Ut,n,flux_grad(2),Ups(4));
text('FontSize',15,'Position',[0 -14*1.2],'Interpreter','latex','String',strCB2);
strCB3=strcat('$$\rightarrow\hspace{3mm}\bf{C_B=',sprintf('%.4f}$$',C(1)));
text('FontSize',15,'Position',[0 -15*1.2],'Interpreter','latex','String',strCB3);
%CL
strCL='$$By\hspace{2mm}material\hspace{2mm}balance,\hspace{2mm}Underflow\hspace{2mm}Flux\hspace{2mm}=\hspace{2mm}Downward\hspace{2mm}Flux\hspace{2mm}at\hspace{2mm}Bottom=U_{ps_{max}}$$';
text('FontSize',15,'Position',[0 -16.5*1.2],'Interpreter','latex','String',strCL);
strCL2=strcat('$$\frac{LC_L}{A}=',sprintf('%.6fC_L=%.6f$$',flux_grad(2),Ups(4)));
text('FontSize',15,'Position',[0 -17.5*1.2],'Interpreter','latex','String',strCL2);
strCL3=strcat('$$\rightarrow\hspace{3mm}\bf{C_L=',sprintf('%.4f}$$',C(3)));
text('FontSize',15,'Position',[0 -18.5*1.2],'Interpreter','latex','String',strCL3);
