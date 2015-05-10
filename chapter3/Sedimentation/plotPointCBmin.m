function handle_point_CBmin= plotPointCBmin(C,Ups)
%C=[CBmin CB CEmin CEmax CS];
hold on;
handle_point_CBmin=plot(C(1)*ones(1,33),linspace(0,Ups(6)*1.1,33));
%text(C(1),-Ups(6)*0.08,'CB_m_i_n','horizontalalignment','center');
hold off;
