function handle_point_UpsV=plotPointUpsV(Ups,isOverload)
%flux_grad=[F/A L/A V/A]
%C=[CB CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT CFcrit CBmax  ] for hasMinPoint
%Ups=[UpsF UpsL UpsV] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Upsmax]; for hasMinPoint

hold on
handle_point_UpsV=plot(linspace(0,1,21),Ups(3)*ones(1,21));

if (isOverload)
    x=sprintf('Ups\n=-VC_V/A');
    %text(-0.1,Ups(3),x);
else
    x=sprintf('Ups\n=-VC_V/A\n=0');
    %text(-0.1,Ups(3),x);
end
hold off