function ret=plotBS(h,w,t,Ubs)

hold on;
fill([-w/2 w/2 w/2 -w/2 -w/2],[-h/2-Ubs*t -h/2-Ubs*t -h/2 -h/2 -h/2-Ubs*t ],[181 83 23]/255,'EdgeColor','none');
hold off;
ret=-h/2-Ubs*t;