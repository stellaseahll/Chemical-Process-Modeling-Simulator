function showTotal(pBend,pVertical,pHorizontal,pTotal)
set(gca,'xtick',[]);
set(gca,'ytick',[]);
axis([-1,12,-45,1]);
showValues(pBend,pVertical,pHorizontal,pTotal);
end

function showValues(pBend,pVertical,pHorizontal,pTotal)
text('FontSize',13,'Position',[0 0],'Interpreter','latex','String','$$\underline{Pressure\hspace{2mm}drop\hspace{2mm}calculated\hspace{12mm}}$$');
%pHor
strPhor=strcat('$$Pressure\hspace{2mm}Drop\hspace{2mm}Drop\hspace{2mm}across\hspace{2mm}horizontal\hspace{2mm}pipes\hspace{2mm}(-\Delta p)_{h}=',sprintf('%.4f',pHorizontal),'\hspace{1mm}Pa$$');
text('FontSize',13,'Position',[0 -1.5*1.1],'Interpreter','latex','String',strPhor);
%pVer
strPver=strcat('$$Pressure\hspace{2mm}Drop\hspace{2mm}Drop\hspace{2mm}across\hspace{2mm}vertical\hspace{2mm}pipes\hspace{2mm}(-\Delta p)_{v}=',sprintf('%.4f',pVertical),'\hspace{1mm}Pa$$');
text('FontSize',13,'Position',[0 -3*1.1],'Interpreter','latex','String',strPver);
%pBend
strPbend=strcat('$$Pressure\hspace{2mm}Drop\hspace{2mm}Drop\hspace{2mm}across\hspace{2mm}bends\hspace{2mm}(-\Delta p)_{bend}\hspace{1mm}=',sprintf('%.4f',pVertical),'\hspace{1mm}Pa$$');
text('FontSize',13,'Position',[0 -4.5*1.1],'Interpreter','latex','String',strPbend);
%pTotal
strPtotal='$$Total\hspace{2mm}Pressure\hspace{2mm}Drop\hspace{2mm}(-\Delta p)\hspace{2mm}=(-\Delta p)_{h}+(-\Delta p)_{v}+(-\Delta p)_{bend}$$';
strPtotal2=sprintf('$$\\hspace{60mm}=%.4f+%.4f+%.4f$$',pHorizontal,pVertical,pBend);
strPtotal3=sprintf('$$\\hspace{60mm}=\\bf{%.4f\\hspace{1mm}Pa}$$',pTotal);
text('FontSize',13,'Position',[0 -6*1.1],'Interpreter','latex','String',strPtotal);
text('FontSize',13,'Position',[0 -7.5*1.1],'Interpreter','latex','String',strPtotal2);
text('FontSize',13,'Position',[0 -9*1.1],'Interpreter','latex','String',strPtotal3);
end