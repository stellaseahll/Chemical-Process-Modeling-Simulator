function handle_line_UnderflowFlux=plotLineUnderflowFlux(flux_grad)

x=[0:0.01:1];
hold on
handle_line_UnderflowFlux=plot(x,x*flux_grad(2));
hold off