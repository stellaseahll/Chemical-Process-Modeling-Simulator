function ret=convertLength(value,str1,str2)
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
f(1,:)=[1 100 0.001 1000 10^6 3.28084  39.3701  0.000621371];
f(:,1)=1./f(1,:)';
    for i=2:8
        f(i,:)=f(i,1)*f(1,:);
    end
end

function ret=convert(string)
    switch string
    case 'm'
        ret=1;return;
    case 'cm'
        ret=2;return;
    case 'km'
        ret=3;return;
    case 'mm'
        ret=4;return;
    case 'um'
        ret=5; return;
    case 'ft'
        ret=6;return;
    case 'in'
        ret=7;return;
    case {'mile','mi'}
        ret=8;return;
    otherwise
        ret=0; return;
    end
end