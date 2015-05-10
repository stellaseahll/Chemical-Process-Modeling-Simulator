function handle_point_CT=plotPointCT(n,ut,C,flux_grad,Ups,isOverload)
%flux_grad=[F/A L/A V/A]
%C=[CB CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT CFcrit CBmax  ] for hasMinPoint
%Ups=[UpsF UpsL UpsV Umax] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Umax Upsmax]; for hasMinPoint
hold on
if (isOverload)
    minY=flux_grad(3)*C(5);
else
    minY=flux_grad(3)*C(6);
end
maxe=n/(n+1);
Upsmax=ut*(1-maxe)*maxe^n;
handle_point_CT=plot(C(5)*ones(1,15),linspace(1.5*minY,1.05*Upsmax,15));
%text(C(5),1.5*minY-(1.05*Ups(end)-1.5*minY)*0.05,'CT','horizontalalignment','center');
hold off