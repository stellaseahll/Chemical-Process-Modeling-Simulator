function showThickener_part4(n,Ut,C,Ups,flux_grad,F,L,V,A,type)
%flux_grad=[F/A L/A V/A]
%C=[CB  CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT CFcrit CBmax   ] for hasMinPoint
%Ups=[UpsF UpsL UpsV] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Upsmax]; for hasMinPoint

set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,20,-30,3]);
showValues(n,Ut,C,F,L,V,A);
if ((type==1)||(type==3)||(type==4)||(type==6))
    showTopSettlingFluxUnderload(type);
else
    showTopSettlingFluxOverload(n,Ut,C,Ups,flux_grad,F,L,V,A,type);
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


function showTopSettlingFluxUnderload(type)
if ((type==1)||(type==4))
    strState='critically\hspace{2mm}loaded';
else
    strState='underloaded';
end
text('FontSize',15,'Position',[0 -8.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}Top\hspace{2mm}Section\hspace{2mm}Concentration\hspace{12mm}}$$');
str=strcat('$$Since\hspace{2mm}thickener\hspace{2mm}is\hspace{2mm}',strState,'\hspace{2mm}all\hspace{2mm}particles\hspace{2mm}are\hspace{2mm}carried\hspace{2mm}to\hspace{2mm}the\hspace{2mm}bottom\hspace{2mm}feed$$');
str2='$$\rightarrow\hspace{3mm}\bf{C_T=C_V=0}$$';
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String',str);
text('FontSize',15,'Position',[0 -10.5*1.2],'Interpreter','latex','String',str2);

function showTopSettlingFluxOverload(n,Ut,C,Ups,flux_grad,F,L,V,A,type)
text('FontSize',15,'Position',[0 -8.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}Top\hspace{2mm}Section\hspace{2mm}Concentration\hspace{12mm}}$$');
str='$$Excess\hspace{2mm}flux$$';
str2='$$=Feed\hspace{2mm}flux-Downward\hspace{2mm}at\hspace{2mm}bottom$$';
str3='$$=\frac{FC_F}{A}-\frac{LC_L}{A}$$';
str4=sprintf('$$=\\frac{(%.6f)(%.4f)\\hspace{6mm}}{%.6f}-\\frac{(%.6f)(%.4f)\\hspace{6mm}}{%.6f}$$',F,C(2),A,L,C(3),A);
str5=sprintf('$$=%.6f\\hspace{1mm}m/s$$',abs(Ups(3)));
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String',str);
text('FontSize',15,'Position',[0 -10.5*1.2],'Interpreter','latex','String',str2);
text('FontSize',15,'Position',[0 -11.7*1.2],'Interpreter','latex','String',str3);
text('FontSize',15,'Position',[0 -12.9*1.2],'Interpreter','latex','String',str4);
text('FontSize',15,'Position',[0 -14.1*1.2],'Interpreter','latex','String',str5);
%CV
strCV='$$Overflow\hspace{2mm}Flux\hspace{2mm}=\hspace{2mm}Excess\hspace{2mm}Flux$$';
text('FontSize',15,'Position',[0 -16*1.2],'Interpreter','latex','String',strCV);
strCV2=strcat('$$\frac{VC_V}{A}=',sprintf('%.6fC_V=%.6f$$',abs(flux_grad(3)),abs(Ups(3))));
text('FontSize',15,'Position',[0 -17*1.2],'Interpreter','latex','String',strCV2);
strCV3=strcat('$$\rightarrow\hspace{3mm}\bf{C_V=',sprintf('%.4f}$$',C(4)));
text('FontSize',15,'Position',[0 -18*1.2],'Interpreter','latex','String',strCV3);
%CT
strCT='$$Similarly, Downward\hspace{2mm}Flux\hspace{2mm}at\hspace{2mm}Bottom\hspace{2mm}=\hspace{2mm}Excess\hspace{2mm}Flux$$';
text('FontSize',15,'Position',[0 -19.5*1.2],'Interpreter','latex','String',strCT);
strCT2=strcat('$$U_TC_T(1-C_T)^n-\frac{V}{A}\hspace{2mm}C_T=',sprintf('%.6f$$',-abs(Ups(3))));
text('FontSize',15,'Position',[0 -20.5*1.2],'Interpreter','latex','String',strCT2);
strCT3=strcat('$$\rightarrow\hspace{3mm}\bf{C_T=',sprintf('%.4f}$$',C(5)));
text('FontSize',15,'Position',[0 -21.5*1.2],'Interpreter','latex','String',strCT3);

