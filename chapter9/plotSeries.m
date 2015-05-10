function plotSeries(stepHorizontal,stepVertical)
hold on;
x=-stepHorizontal*6;
y=stepVertical*1.5;
plot([0 -0.5 0.5 0]-x,[0 1 1 0]-y);
plot([-4 -0.25 NaN 0.25 4]-x,[0.5 0.5 NaN 0.5 0.5]-y);

hold off;

