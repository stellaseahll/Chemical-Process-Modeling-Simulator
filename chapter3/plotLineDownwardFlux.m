function handle_line_DownwardFlux=plotLineDownwardFlux(flux_grad,n,Ut)

c=[0:0.001:1];
Y=Ut*c.*(1-c).^n+flux_grad(3)*c;
hold on
handle_line_DownwardFlux=plot(c,Y);
hold off