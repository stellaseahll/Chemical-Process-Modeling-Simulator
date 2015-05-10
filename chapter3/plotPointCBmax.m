function handle_point_CBmax=plotPointCBmax(n,ut,C,flux_grad,Ups)
%flux_grad=[F/A L/A V/A]
%C=[CB CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT CFcrit CBmax  ] for hasMinPoint
%Ups=[UpsF UpsL UpsV Umax] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Umax Upsmax]; for hasMinPoint
maxe=n/(n+1);
Upsmax=ut*(1-maxe)*maxe^n;
maxPt=max([flux_grad(2) 1.05*Ups(1) 1.2*Upsmax]);
hold on
handle_point_CBmax=plot(C(7)*ones(1,15),linspace(0,maxPt,15));
x=sprintf('CB=C_m_a_x');
%text(C(7),-maxPt*0.1,x,'horizontalalignment','center');
hold off