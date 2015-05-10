function ret=plotBEmin(C,w,h,H1,H2,c)
%C=[CBmin CB CEmin CEmax CS Cmax];
%set color CB
light=[255 255 255]/255;
dark=[181 83 23]/255;
light=dark-(dark-light)/(C(5))*(C(5)-C(3));
h=H1:-0.005*h:H2-0.005*h;
c_space=linspace(c,C(5),length(h)+1);
c_space(1)=[];
c_space(end)=[];

for i=1:length(h)-1;
     color=dark-(dark-light)/(C(5)-C(2))*(C(5)-c_space(i));
     hold on;
     fill([-w/2 w/2 w/2 -w/2 -w/2],[h(i+1) h(i+1) h(i) h(i) h(i+1) ],color,'EdgeColor','none');
end
hold off;
