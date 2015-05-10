function handle_line_OverflowFlux=plotLineOverflowFlux(flux_grad)

x=[0:0.001:1];
hold on
handle_line_OverflowFlux=plot(x,x*flux_grad(3));
hold off