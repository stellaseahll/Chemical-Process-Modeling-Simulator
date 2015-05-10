function setGraph_Thickener(h_main,h_pointX,h_pointY,h_line)
%set main handle
set(h_main(1),'color','k','linewidth',1.5);
set(h_main(2),'color','k','linestyle','--','Visible','Off');
if (length(h_main)==3)
    set(h_main(3),'color','k','linestyle','-');
end
%set pointsX
str='bmrgc';
str2='ho*xs';
for i=1:length(h_pointX)
    if (~isnan(h_pointX(i)))
        set(h_pointX(i),'color',str(i),'linestyle',str2(i),'linestyle','--','Visible','Off');
    end
end

%set pointsY
for i=1:length(h_pointY)
    if (~isnan(h_pointY(i)))
        set(h_pointY(i),'color','r','linestyle','d','linestyle','--','Visible','Off');
    end
end

%set line
for i=1:length(h_line)
    set(h_line,'color','b','Visible','Off');
end
