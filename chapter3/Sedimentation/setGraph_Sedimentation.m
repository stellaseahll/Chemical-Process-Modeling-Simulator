function setGraph_Sedimentation(h_main,h_pointX,h_pointY,h_line)

str='gbmry';
str2='ho*^s';
%set main handle
set(h_main,'color','k','linewidth',1);

%set points

for i=1:length(h_pointX)
    set(h_pointX(i),'color',str(i),'marker',str2(i),'linestyle','--','Visible','Off');
end

%set points
for i=1:length(h_pointY)
    set(h_pointY(i),'color',str(i),'marker',str2(i),'linestyle','--','Visible','Off');
end

%set line
for i=1:length(h_line)
    set(h_line(i),'color','b','Visible','Off');
end
