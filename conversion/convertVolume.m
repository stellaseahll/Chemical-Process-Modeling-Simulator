function ret=convertVolume(value,str1,str2)
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
f(1,1:6)=[1 100 0.001 1000 3.28084  39.3701];
f(1,1:6)=f(1,1:6).^3;
f(1,7:8)=[1000 264.172];
f(:,1)=1./f(1,:)';
    for i=2:8
        f(i,:)=f(i,1)*f(1,:);
    end
end

function ret=convert(string)
    switch string
    case {'m3','m'}
        ret=1;return;
    case {'cm3','cm','ml','mL'}
        ret=2;return;
    case {'km3','km'}
        ret=3;return;
    case {'mm3','mm'}
        ret=4;return;
    case {'ft','ft3'}
        ret=5;return;
    case {'in3','in'}
        ret=6;return;
    case {'dm3','L','l','litre'}
        ret=7;return;
    case 'gal'
        ret=8;return;
    otherwise
        ret=0; return;
    end
end