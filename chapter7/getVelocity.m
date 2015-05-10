function vel=getVelocity(flowrate,area,denF)
%Calculates the superficial velocity given the flow rate
if (nargin==2)
    vel=flowrate/area;
else
    vel=flowrate/denF/area;
end