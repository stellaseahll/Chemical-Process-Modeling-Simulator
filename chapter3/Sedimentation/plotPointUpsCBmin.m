function handle_point_UpsCBmin=plotPointUpsCBmin(Ups)
%C=[CBmin CB CEmin CEmax CS];
hold on;
handle_point_UpsCBmin=plot(linspace(0,1,21),ones(1,21)*Ups(1));
%text(C(2),-Ups(6)*0.08,'CB','horizontalalignment','center');
hold off;