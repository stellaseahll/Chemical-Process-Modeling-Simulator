function handle_Line_BEmin=plotLineBEmin(C,Ups)
%C=[CBmin CB CEmin CEmax CS];
m=(Ups(2)-Ups(3))/(C(2)-C(3));
c=Ups(2)-m*C(2);
hold on;
handle_Line_BEmin=plot([C(2)-0.05 C(3)+0.2],[m*(C(2)-0.05)+c m*(C(3)+0.2)+c],'b');
hold off;
