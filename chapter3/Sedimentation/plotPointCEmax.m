function handle_point_CEmax=plotPointCEmax(C,Ups)
%C=[CBmin CB CEmin CEmax CS];
hold on;
handle_point_CEmax=plot(C(4)*ones(1,15),linspace(0,Ups(6)*1.1,15));
%text(C(4),-Ups(6)*0.08,'CE_m_a_x','horizontalalignment','center');
hold off;