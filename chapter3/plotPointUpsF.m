function handle_point_UpsF=plotPointUpsF(Ups,hasMinPoint,isOverload)
%flux_grad=[F/A L/A V/A]
%C=[CB CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT CFcrit CBmax  ] for hasMinPoint
%Ups=[UpsF UpsL UpsV] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Upsmax]; for hasMinPoint

hold on
handle_point_UpsF=plot(linspace(0,1,21),Ups(1)*ones(1,21));

if (~isOverload)
    x=sprintf('Ups\n=FC_F/A\n=LC_L/A');
    %text(-0.1,Ups(1),x);
else
    x=sprintf('Ups\n=FC_F/A');
    %text(-0.1,Ups(1),x);
end
hold off