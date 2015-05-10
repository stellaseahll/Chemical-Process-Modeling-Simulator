function ret=plotAB(h,w,t,Uab)

hold on;
fill([-w/2 w/2 w/2 -w/2],[h/2-Uab*t h/2-Uab*t h/2 h/2],[255 255 255]/255,'EdgeColor','none');
hold off;
ret=h/2-Uab*t;