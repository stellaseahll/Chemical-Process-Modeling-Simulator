function ret=convertVolumetricFlowRate(value,str1,str2)
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
f=zeros(12,12);   
f(1,:)=[1 60 3600 10^6 10^6*60  10^6*3600 1000 60000 3600000 3.28084^3 3.28084^3*60 3.28084^3*3600];
f(:,1)=1./f(1,:)';
    for i=2:12
        f(i,:)=f(i,1)*f(1,:);
    end
end

function ret=convert(string)
    switch string
    case {'m3/s'}
        ret=1;return;
    case {'m3/min'}
        ret=2;return;
    case {'m3/h'}
        ret=3;return;
    case {'cm3/s'}
        ret=4;return;
    case {'cm3/min'}
        ret=5;return;
    case {'cm3/h'}
        ret=6;return;
    case 'L/s'
        ret=7;return;
    case 'L/min'
        ret=8;return;
	case 'L/h'
        ret=9;return;
    case 'ft3/s'
        ret=10;return;
    case 'ft3/min'
        ret=11;return;
	case 'ft3/h'
        ret=12;return;
    otherwise
        ret=0; return;
    end
end