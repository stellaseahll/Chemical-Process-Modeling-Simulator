function p=findPressure_CarmenKozeny(vis,vel,size,por)

p=180*vis*vel*(1-por)^2/size^2/por^3;