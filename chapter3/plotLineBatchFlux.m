function handle_line_BatchFlux=plotLineBatchFlux(flux_grad,C,n,Ut)

c=[0:0.001:1];
Y=Ut*c.*(1-c).^n+flux_grad(2)*c;
hold on
handle_line_BatchFlux=plot(c,Y);
hold off