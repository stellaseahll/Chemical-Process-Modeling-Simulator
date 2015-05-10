function handle_point_UpsCEmin=plotPointUpsCEmin(Ups)
%C=[CBmin CB CEmin CEmax CS];
hold on;
handle_point_UpsCEmin=plot(linspace(0,1,21),ones(1,21)*Ups(3));
%text(C(2),-Ups(6)*0.08,'CB','horizontalalignment','center');
hold off;