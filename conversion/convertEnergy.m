function ret=convertEnergy(value,str1,str2)
%convertVolume Converts area from one unit to another
%   ret= convertVolume(VALUE,STR1,STR2) converts the volume of unit 
%   specified by str1 to the corresponding value specified by str2. The
%   format allowed are cubic metre (m3), cubic centimetres (cm3), cubic
%   kilometres (km3), cubic millimetres (mm3), gallons (gal), litres (L),
%   cubic inch (in3) and cubic feet (ft3)
%
%   ret= convertVolume(VALUE,STR1) converts the volume of unit specified by
%   str1 to SI unit.

t=table;
r=convert(str1);
if (r==0)
    error('Format of Conversion not Recognized');
end
if (nargin==2)
    ret=value*t(r,1);
    return;
end
c=convert(str2);
if (c==0)
    error('Format of Conversion not Recognized');
end
ret=value*t(r,c);
end

function f=table()
f=zeros(8,8);
f(1,:)=[1 1/1000 0.00094781707775 0.239005736 2.7777777778e-7   0.73756217557  23.730360457 1.6*10^-19];
f(:,1)=1./f(1,:)';
    for i=2:8
        f(i,:)=f(i,1)*f(1,:);
    end
end

function ret=convert(string)
    switch string
    case {'J','j'}
        ret=1;return;
    case {'kJ','kj','KJ'}
        ret=2;return;
    case {'Btu','btu'}
        ret=3;return;
    case {'cal'}
        ret=4;return;
    case {'kwh','kWh'}
        ret=5;return;
    case {'lb ft','lb.ft','lbf.ft'}
        ret=6;return;
    case {'english','lbm ft2/s2','lb ft2/s2'}
        ret=7;return;
    case {'eV','ev'}
        ret=8;return;
    otherwise
        ret=0; return;
    end
end