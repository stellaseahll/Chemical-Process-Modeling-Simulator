function [h_main h_pointX h_pointY h_line]=getHandlesThickener_bottom(n,ut,flux_grad, C, Ups,hasMinPoint,isOverload)
%flux_grad=[F/A L/A V/A]
%C=[CB  CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT  CFcrit CBmax  ] for hasMinPoint
%Ups=[UpsF UpsL UpsV Umax] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Umax Upsmax]; for hasMinPoint

%set axis
if (isOverload)
    minY=flux_grad(3)*C(5);
else
    minY=flux_grad(3)*C(6);
end
maxe=n/(n+1);
Upsmax=ut*(1-maxe)*maxe^n;
set(gca,'XTick',[]);
axis([0 1 1.5*minY 1.05*Upsmax]);


%main flux curve
h_main(1)=plotLineDownwardFlux(flux_grad,n,ut); 
h_main(2)=plotLineFlux(n,ut);
h_main(3)=plotXaxis(C,flux_grad,Ups,isOverload);

%pointsX
h_pointX(1)=plotPointCV(n,ut,C,flux_grad);
if (isOverload)
    h_pointX(2)=plotPointCT(n,ut,C,flux_grad,Ups,isOverload);
end

%pointsY
h_pointY(1)=plotPointUpsV(Ups,isOverload);

%lines
h_line(1)=plotLineOverflowFlux(flux_grad); 
