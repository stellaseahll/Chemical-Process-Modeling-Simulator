function showThickener_part1(n,Ut,C,Ups,flux_grad,F,L,V,A)
%flux_grad=[F/A L/A V/A]
%C=[CB  CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT CFcrit CBmax   ] for hasMinPoint
%Ups=[UpsF UpsL UpsV] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Upsmax]; for hasMinPoint

set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,20,-30,3]);

showValues(n,Ut,C,F,L,V,A);
showFlux(n,Ut,F,L,V,flux_grad,A);


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

function showFlux(n,Ut,F,L,V,flux_grad,A)
text('FontSize',15,'Position',[0 -8.5*1.2],'Interpreter','latex','String',...
    '$$\underline{Determining\hspace{2mm}flux\hspace{2mm}equations\hspace{9mm}}$$');
%Batch Settling Flux
strBatch=strcat('$$Batch\hspace{2mm}settling\hspace{2mm}flux=U_TC(1-C)^n=',sprintf('%.6fC(1-C)^{%.3f}$$',Ut,n));
text('FontSize',15,'Position',[0 -9.5*1.2],'Interpreter','latex','String',strBatch);
%Feed Flux
strFeed=strcat('$$Feed\hspace{2mm}flux=\frac{F}{A}\hspace{1mm}C=\frac',sprintf('{\\hspace{1mm}%.6f\\hspace{3mm}}{\\hspace{1mm}%.6f\\hspace{3mm}}\\hspace{1mm}C={%.6f}\\hspace{3mm}C$$',F,A,flux_grad(1)));
text('FontSize',15,'Position',[0 -10.5*1.2],'Interpreter','latex','String',strFeed);
%Underflow Flux
strUnder=strcat('$$Underflow\hspace{2mm}flux=\frac{L}{A}\hspace{1mm}C=\frac',sprintf('{\\hspace{1mm}%.6f\\hspace{3mm}}{\\hspace{1mm}%.6f\\hspace{3mm}}\\hspace{1mm}C={%.6f}\\hspace{3mm}C$$',L,A,flux_grad(2)));
text('FontSize',15,'Position',[0 -12*1.2],'Interpreter','latex','String',strUnder);
%Overflow Flux
strOver=strcat('$$Overflow\hspace{2mm}flux=-\frac{V}{A}\hspace{1mm}C=-\frac',sprintf('{\\hspace{1mm}%.6f\\hspace{3mm}}{\\hspace{1mm}%.6f\\hspace{3mm}}\\hspace{1mm}C={%.6f}\\hspace{3mm}C$$',V,A,flux_grad(3)));
text('FontSize',15,'Position',[0 -13.5*1.2],'Interpreter','latex','String',strOver);
%Dowmward flux below feed
strBottom1='$$Downward\hspace{2mm}flux\hspace{2mm}below\hspace{2mm}feed$$';
text('FontSize',15,'Position',[0 -15*1.2],'Interpreter','latex','String',strBottom1);
strBottom2='$$=Batch\hspace{2mm}Flux\hspace{1mm}+\hspace{1mm}Underflow\hspace{2mm}Flux$$';
text('FontSize',15,'Position',[0 -16*1.2],'Interpreter','latex','String',strBottom2);
strBottom3='$$=U_TC(1-C)^n+\frac{L}{A}\hspace{2mm}C$$';
text('FontSize',15,'Position',[0 -17*1.2],'Interpreter','latex','String',strBottom3);
strBottom4=sprintf('$$=%.6fC(1-C)^{%.3f}\\hspace{3mm}+{%.6f}\\hspace{4mm}C$$',Ut,n,flux_grad(2));
text('FontSize',15,'Position',[0 -18*1.2],'Interpreter','latex','String',strBottom4);
%Dowmward flux above feed
strTop1='$$Downward\hspace{2mm}flux\hspace{2mm}above\hspace{2mm}feed$$';
text('FontSize',15,'Position',[0 -19*1.2],'Interpreter','latex','String',strTop1);
strTop2='$$=Batch\hspace{2mm}Flux\hspace{1mm}+\hspace{1mm}Overflow\hspace{2mm}Flux$$';
text('FontSize',15,'Position',[0 -20*1.2],'Interpreter','latex','String',strTop2);
strTop3='$$=U_TC(1-C)^n-\frac{V}{A}\hspace{2mm}C$$';
text('FontSize',15,'Position',[0 -21*1.2],'Interpreter','latex','String',strTop3);
strTop4=sprintf('$$=%.6fC(1-C)^{%.3f}\\hspace{2mm}-{%.6f}\\hspace{4mm}C$$',Ut,n,abs(flux_grad(3)));
text('FontSize',15,'Position',[0 -22*1.2],'Interpreter','latex','String',strTop4);