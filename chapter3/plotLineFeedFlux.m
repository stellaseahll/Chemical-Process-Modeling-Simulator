function handle_line_FeedFlux=plotLineFeedFlux(flux_grad)
%flux_grad=[F/A L/A V/A]
%C=[CB  CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT CBmax  CFcrit ] for hasMinPoint
%Ups=[UpsF UpsL UpsV Umax] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Umax Upsmax]; for hasMinPoint

x=0:0.001:1;
hold on
handle_line_FeedFlux=plot(x,x*flux_grad(1));
hold off