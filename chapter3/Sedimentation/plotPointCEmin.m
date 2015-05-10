function handle_point_CEmin=plotPointCEmin(C,Ups)
%C=[CBmin CB CEmin CEmax CS];
hold on;
handle_point_CEmin=plot(C(3)*ones(1,15),linspace(0,Ups(6)*1.1,15));
%text(C(3),-Ups(6)*0.08,'CE_m_i_n','horizontalalignment','center');
hold off;