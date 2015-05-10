function [h_main h_pointX h_pointY h_line]=getHandlesThickener_top(n,ut,flux_grad, C, Ups,hasMinPoint,isOverload)
%flux_grad=[F/A L/A V/A]
%C=[CB  CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT  CFcrit CBmax  ] for hasMinPoint
%Ups=[UpsF UpsL UpsV Umax] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Umax Upsmax]; for hasMinPoint

%set axis
set(gca,'XTick',0:0.1:1);
maxe=n/(n+1);
Upsmax=ut*(1-maxe)*maxe^n;
axis([0 1 0 max([flux_grad(2) 1.05*Ups(1) 1.2*Upsmax])]);


%main flux curve
h_main(1)=plotLineBatchFlux(flux_grad,C,n,ut); 
h_main(2)=plotLineFlux(n,ut);

%pointsX
h_pointX(1)=plotPointCB(n,ut,C,flux_grad,Ups);
h_pointX(2)=plotPointCF(n,ut,C,flux_grad,Ups);
h_pointX(3)=plotPointCL(n,ut,C,flux_grad,Ups);
h_pointX(4)=plotPointCFcrit(n,ut,C,flux_grad,Ups);
if (hasMinPoint)
    h_pointX(5)=plotPointCBmax(n,ut,C,flux_grad,Ups);
end

%pointsY
h_pointY(1)=plotPointUpsF(Ups,hasMinPoint,isOverload);
h_pointY(2)=plotPointUpsL(Ups,hasMinPoint,isOverload);
h_pointY(3)=plotPointUpsmax(Ups,hasMinPoint,isOverload);

%lines
h_line(1)=plotLineFeedFlux(flux_grad); 
h_line(2)=plotLineUnderflowFlux(flux_grad); 
