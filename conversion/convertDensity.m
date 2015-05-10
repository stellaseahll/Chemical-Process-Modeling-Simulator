function ret=convertDensity(value,str1,str2)
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
f=zeros(3,3);   
f(1,:)=[1 0.0624279606 10^-3];
f(:,1)=1./f(1,:)';
    for i=2:3
        f(i,:)=f(i,1)*f(1,:);
    end
end

function ret=convert(string)
    switch string
    case {'kg/m3', 'SI','g/L'}
        ret=1;return;
    case {'lb/ft3','lbm/ft3','english'}
        ret=2;return;
    case {'g/cm3','g/mL'}
        ret=3;return;
    otherwise
        ret=0; return;
    end
end