function handle_point_UpsCEmax=plotPointUpsCEmax(Ups)
%C=[CBmin CB CEmin CEmax CS];
hold on;
handle_point_UpsCEmax=plot(linspace(0,1,21),ones(1,21)*Ups(4));
%text(C(2),-Ups(6)*0.08,'CB','horizontalalignment','center');
hold off;