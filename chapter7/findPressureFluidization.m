function p=findPressureFluidization(massP,denP,denF,bedDiameter)

area=pi*(bedDiameter/2)^2;
p=massP*9.81/area*(1-denF/denP);