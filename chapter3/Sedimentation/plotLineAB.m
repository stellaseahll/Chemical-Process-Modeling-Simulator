function handle_Line_AB=plotLineAB(C,Ups)
%C=[CBmin CB CEmin CEmax CS];
m=Ups(2)/C(2);
hold on
handle_Line_AB=plot([0 C(2)+0.05],[0 m*(C(2)+0.05)]);
hold off