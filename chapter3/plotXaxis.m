function handle_xaxis=plotXaxis(C,flux_grad,Ups,isOverload)

if (isOverload)
    minY=flux_grad(3)*C(5);
else
    minY=flux_grad(3)*C(6);
end

range=1.05*Ups(end)-minY;
hold on;
handle_xaxis=plot([0 1],[0 0]);
for (i=0.1:0.1:1)
    plot([i i],[-range*0.005 range*0.005],'k');
    text(i,-range*0.03,num2str(i),'horizontalalignment','center');
end
hold off;

