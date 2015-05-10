function handle_Line_Flux=plotLineFlux(n,ut)
    e=0:0.001:1;
    Ups=ut*(1-e).*e.^n;
    hold on
    handle_Line_Flux=plot(1-e,Ups);
    hold off
end