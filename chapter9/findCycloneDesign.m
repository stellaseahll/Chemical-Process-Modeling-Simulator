function [diameter numCyclone actualCutSize]=findCycloneDesign(reqCutSize,Q,denP,denF,vis,pDrop,Eu,Stk50)

% if (type==1) %Stairmand HR
%     Stk50=6*10^-3;
%     Eu=46;
% elseif (type==2) %Stairmand HE
%     Stk50=1.4*10^-4;
%     Eu=320;
% end

v=sqrt(2*pDrop/Eu/denF);
%D=k/sqrt(n)
%D=x50^2 *denP*v/18/vis/Stk50;
k=sqrt(4*Q/pi/v);
D=reqCutSize^2*denP*v/18/vis/Stk50;
numCyclone=ceil((k/D)^2);
diameter=k/sqrt(numCyclone);
actualCutSize=sqrt(Stk50*18*vis*diameter/denP/v);


