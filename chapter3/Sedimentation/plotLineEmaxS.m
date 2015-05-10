function handle_Line_EmaxS=plotLineEmaxS(C,Ups)
%C=[CBmin CB CEmin CEmax CS];
m=Ups(4)/(C(4)-C(5));
c=Ups(4)-m*C(4);
hold on
handle_Line_EmaxS=plot([0 C(5)],[c 0]);
hold off