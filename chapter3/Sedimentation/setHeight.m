function setHeight(h,w,C)
%C=[CBmin CB CEmin CEmax CS Cmax];
light=[255 255 255]/255;
dark=[181 83 23]/255;
color=dark-(dark-light)/(C(5))*(C(5)-C(2));
hold on;
set(gca,'Xtick',[],'Ytick',[]);
fill([-w/2 -w/2 w/2 w/2 -w/2],[-h/2 h/2 h/2 -h/2 -h/2],color,'EdgeColor','none');
axis image
hold off;