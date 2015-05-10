function handle_point_CS=plotPointCS(C,Ups)
%C=[CBmin CB CEmin CEmax CS];
hold on;
handle_point_CS=plot(C(5)*ones(1,21),linspace(0,Ups(6)*1.1,21));
%text(C(5),-Ups(6)*0.08,'CS','horizontalalignment','center');
hold off;