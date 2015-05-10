function handle_point_CB=plotPointCB(C,Ups)
%C=[CBmin CB CEmin CEmax CS];
hold on;
handle_point_CB=plot(C(2)*ones(1,21),linspace(0,Ups(6)*1.1,21));
%text(C(2),-Ups(6)*0.08,'CB','horizontalalignment','center');
hold off;