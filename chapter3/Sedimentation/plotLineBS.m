function handle_Line_BS=plotLineBS(C,Ups)
%C=[CBmin CB CEmin CEmax CS];
m=Ups(2)/(C(2)-C(5));
c=Ups(2)-m*C(2);
hold on
handle_Line_BS=plot([C(2)-0.05 C(5)],[m*(C(2)-0.05)+c 0]);
hold off