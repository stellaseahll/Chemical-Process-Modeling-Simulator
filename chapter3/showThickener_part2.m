function showThickener_part2(n,Ut,C,Ups,flux_grad,F,L,V,A,type)
%flux_grad=[F/A L/A V/A]
%C=[CB  CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT CFcrit CBmax   ] for hasMinPoint
%Ups=[UpsF UpsL UpsV] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Upsmax]; for hasMinPoint

set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,20,-30,3]);
showValues(n,Ut,C,F,L,V,A);
if (type<=3)
    showType(C,type);
else
    showTypeMinPoint(n,Ut,C,Ups,flux_grad,type);
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

function showType(C,type)
text('FontSize',15,'Position',[0 -8.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}thickener\hspace{2mm}conditions\hspace{9mm}}$$');
%CFcritical
strCrit1=strcat('$$Since\hspace{2mm}there\hspace{2mm}is\hspace{2mm}no\hspace{2mm}minimum\hspace{2mm}point',...
    '\hspace{2mm}on\hspace{2mm}graph\hspace{2mm}for\hspace{2mm}C\hspace{2mm}greater\hspace{2mm}than\hspace{2mm}C_F$$');
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String',strCrit1);
strCrit2=strcat('$$C_{F_{crit}}\hspace{2mm}=Intersection\hspace{2mm}between\hspace{2mm}feed\hspace{2mm}flux\hspace{2mm}and\hspace{2mm}downward\hspace{2mm}flux\hspace{2mm}above\hspace{2mm}feed',...
    sprintf('=%.4f$$',C(6)));
text('FontSize',15,'Position',[0 -10.5*1.2],'Interpreter','latex','String',strCrit2);
if (type==1)
    strCrit3=sprintf('$$C_F=C_{F_{crit}}\\hspace{2mm}=%.4f\\hspace{3mm}\\rightarrow \\hspace{3mm} \\bf{Thickener\\hspace{2mm}is\\hspace{2mm}Critically\\hspace{2mm}Loaded}$$',C(2));
elseif (type==2)
    strCrit3=sprintf('$$C_F=%.4f\\hspace{2mm}>C_{F_{crit}}\\hspace{2mm}=%.4f\\hspace{3mm}\\rightarrow \\hspace{3mm} \\bf{Thickener\\hspace{2mm}is\\hspace{2mm}Overloaded}$$',C(2),C(6));
elseif (type==3)
    strCrit3=sprintf('$$C_F=%.4f\\hspace{2mm}<C_{F_{crit}}\\hspace{2mm}=%.4f\\hspace{3mm}\\rightarrow \\hspace{3mm} \\bf{Thickener\\hspace{2mm}is\\hspace{2mm}Underloaded}$$',C(2),C(6));
end
text('FontSize',15,'Position',[0 -11.5*1.2],'Interpreter','latex','String',strCrit3);

function showTypeMinPoint(n,Ut,C,Ups,flux_grad,type)
text('FontSize',15,'Position',[0 -8.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}thickener\hspace{2mm}conditions\hspace{9mm}}$$');
%CBmax
strCBmax=strcat('$$From\hspace{2mm}the\hspace{2mm}graph\hspace{2mm},there\hspace{2mm}is\hspace{2mm}a\hspace{2mm}minimum\hspace{2mm}point',...
    '\hspace{2mm}at\hspace{2mm}\bf{C=C_{max}\hspace{2mm}=',sprintf('%.4f}$$',C(7)));
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String',strCBmax);
%Upsmax
strUpsmax1='$$U_{ps_{max}\hspace{2mm}}=Downward\hspace{2mm}Flux\hspace{2mm}at\hspace{2mm}bottom\hspace{2mm}section\hspace{2mm}at\hspace{2mm}C=C_{max}$$';
strUpsmax2='$$=U_TC_{max}\hspace{2mm}(1-C_{max}\hspace{1mm})\hspace{1mm}^n+\frac{L}{A}\hspace{2mm}C_{max}$$';
strUpsmax3=sprintf('$$=%.6f(%.4f)(1-%.4f)^{%.3f}\\hspace{3mm}+{%.6f}\\hspace{4mm}(%.4f)=\\hspace{2mm}%.6f\\hspace{1mm}m/s$$',Ut,C(7),C(7),n,flux_grad(2),C(7),Ups(4));
text('FontSize',15,'Position',[0 -10.5*1.2],'Interpreter','latex','String',strUpsmax1);
text('FontSize',15,'Position',[0 -11.5*1.2],'Interpreter','latex','String',strUpsmax2);
text('FontSize',15,'Position',[0 -12.5*1.2],'Interpreter','latex','String',strUpsmax3);
%CFcrit
strCFcrit=strcat('$$Critical\hspace{2mm}loading\hspace{2mm}condition\hspace{2mm}occurs\hspace{2mm}when\hspace{2mm}feed\hspace{2mm}concentration',...
    '\hspace{2mm}gives\hspace{2mm}rise\hspace{2mm}to\hspace{2mm}a\hspace{2mm}flux\hspace{2mm}equal\hspace{2mm}to\hspace{2mm}Ups_{max}$$');
strCFcrit2=strcat('$$\frac{FC_{F_{crit}}\hspace{2mm}}{A}=',sprintf('%.6fC_{F_{crit}}\\hspace{2mm}=%.6f$$',flux_grad(1),Ups(4)));
strCFcrit3=strcat('$$\rightarrow\hspace{3mm}\bf{C_{F_{crit}\hspace{2mm}}=',sprintf('%.4f}$$',C(6)));
text('FontSize',15,'Position',[0 -14*1.2],'Interpreter','latex','String',strCFcrit);
text('FontSize',15,'Position',[0 -15.2*1.2],'Interpreter','latex','String',strCFcrit2);
text('FontSize',15,'Position',[0 -16.2*1.2],'Interpreter','latex','String',strCFcrit3);
%Display type
if (type==4)
    strCrit=sprintf('$$C_F=C_{F_{crit}}=%.4f\\hspace{3mm}\\rightarrow \\hspace{3mm} \\bf{Thickener\\hspace{2mm}is\\hspace{2mm}Critically\\hspace{2mm}Loaded}$$',C(2));
elseif (type==5)
    strCrit=sprintf('$$C_F=%.4f\\hspace{2mm}>C_{F_{crit}}\\hspace{2mm}=%.4f\\hspace{3mm}\\rightarrow \\hspace{3mm} \\bf{Thickener\\hspace{2mm}is\\hspace{2mm}Overloaded}$$',C(2),C(6));
elseif (type==6)
    strCrit=sprintf('$$C_F=%.4f\\hspace{2mm}<C_{F_{crit}}\\hspace{2mm}=%.4f\\hspace{3mm}\\rightarrow \\hspace{3mm} \\bf{Thickener\\hspace{2mm}is\\hspace{2mm}Underloaded}$$',C(2),C(6));
end
text('FontSize',15,'Position',[0 -18*1.2],'Interpreter','latex','String',strCrit);