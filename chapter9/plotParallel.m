function plotParallel(stepHorizontal,stepVertical,isEnd)
hold on;
x=-stepHorizontal*6;
y=stepVertical*1.5;
plot([0 -0.5 0.5 0]-x,[0 1 1 0]-y);
plot([-3 -0.25 NaN 0.25 3]-x,[0.5 0.5 NaN 0.5 0.5]-y);
if (isEnd)
    plot([-3 -3 NaN 3 3]-x,[0.5 2 NaN 0.5 2]-y);
else
    plot([-3 -3]-x,[0.5 2]-y);
end
hold off;

