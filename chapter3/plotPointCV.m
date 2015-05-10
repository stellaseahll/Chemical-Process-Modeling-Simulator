function handle_point_CV=plotPointCV(n,ut,C,flux_grad)
%flux_grad=[F/A L/A V/A]
%C=[CB CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT CFcrit CBmax  ] for hasMinPoint
%Ups=[UpsF UpsL UpsV Umax] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Umax Upsmax]; for hasMinPoint
hold on
%if (isOverload)
maxe=n/(n+1);
Upsmax=ut*(1-maxe)*maxe^n;
minY=min(flux_grad(3)*C(5),flux_grad(3)*C(6));
handle_point_CV=plot(C(4)*ones(1,15),linspace(1.5*minY,1.05*Upsmax,15));
    %text(C(4),1.5*minY-(1.05*Ups(end)-1.5*minY)*0.05,'CV','horizontalalignment','center');
%else
    %x=sprintf('CV\n=CT\n=0');
    %minY=flux_grad(3)*C(6);
    %text(0,1.5*minY-(1.05*Ups(end)-1.5*minY)*0.05,x,'horizontalalignment','center');
%end
hold off