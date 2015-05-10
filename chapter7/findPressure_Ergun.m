function p=findPressure_Ergun(vis,vel,size,por,denF)

p=150*vis*vel*(1-por)^2/size^2/por^3+1.75*denF*vel^2*(1-por)/size/por^3;