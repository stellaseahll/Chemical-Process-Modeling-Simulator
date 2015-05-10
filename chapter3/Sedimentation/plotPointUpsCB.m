function handle_point_UpsCB=plotPointUpsCB(Ups)
%C=[CBmin CB CEmin CEmax CS];
hold on;
handle_point_UpsCB=plot(linspace(0,1,21),ones(1,21)*Ups(2));
%text(C(2),-Ups(6)*0.08,'CB','horizontalalignment','center');
hold off;