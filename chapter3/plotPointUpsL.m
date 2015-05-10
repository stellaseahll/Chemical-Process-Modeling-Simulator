function handle_point_UpsL=plotPointUpsL(Ups,hasMinPoint,isOverload)
%flux_grad=[F/A L/A V/A]
%C=[CB CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT CFcrit CBmax  ] for hasMinPoint
%Ups=[UpsF UpsL UpsV] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Upsmax]; for hasMinPoint
if (~isOverload)
    handle_point_UpsL=NaN;
    return;
end
hold on
handle_point_UpsL=plot(linspace(0,1,21),Ups(2)*ones(1,21));
if (hasMinPoint)
    x=sprintf('Ups\n=LC_L/A\n=U_p_s_m_a_x');
    %text(-0.1,Ups(2),x);
else
    x=sprintf('Ups\n=LC_L/A');
    %text(-0.1,Ups(2),x);
end
hold off