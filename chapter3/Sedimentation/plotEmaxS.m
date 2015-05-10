function ret=plotEmaxS(h,w,t,Ues)
dark=[181 83 23]/255;
hold on;
fill([-w/2 w/2 w/2 -w/2 -w/2],[-h/2-Ues*t -h/2-Ues*t -h/2 -h/2 -h/2-Ues*t ],dark,'EdgeColor','none');
hold off;
ret=-h/2-Ues*t;