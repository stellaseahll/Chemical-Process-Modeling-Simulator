function ret=convertArea(value,str1,str2)
%convertArea Converts area from one unit to another
%   ret= convertArea(VALUE,STR1,STR2) converts the area of unit specified
%   by str1 to the corresponding value specified by str2. The format
%   allowed are square metre (m2), square centimetres (cm2), square
%   kilometres (km2), square millimetres (mm2), square inch (in2) and
%   square feet (ft2)
%
%   ret= convertArea(VALUE,STR1) converts the area of unit specified by
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
f=zeros(6,6);   
f(1,:)=[1 100 0.001 1000 3.28084  39.3701];
f(1,:)=f(1,:).^2;
f(:,1)=1./f(1,:)';
    for i=2:6
        f(i,:)=f(i,1)*f(1,:);
    end
end

function ret=convert(string)
    switch string
    case {'m2','m'}
        ret=1;return;
    case {'cm2','cm'}
        ret=2;return;
    case {'km2','km'}
        ret=3;return;
    case {'mm2','mm'}
        ret=4;return;
    case {'ft','ft2'}
        ret=5;return;
    case {'in2','in'}
        ret=6;return;
    otherwise
        ret=0; return;
    end
    
end