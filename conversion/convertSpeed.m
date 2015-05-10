function ret=convertSpeed(value,str1,str2)
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
f=zeros(9,9);   
f(1,:)=[1 3.28084 100 1000 196.8504 60 6000 60000 3.6];
f(:,1)=1./f(1,:)';
    for i=2:9
        f(i,:)=f(i,1)*f(1,:);
    end
end

function ret=convert(string)
    switch string
    case 'm/s'
        ret=1;return;
    case 'ft/s'
        ret=2;return;
    case 'cm/s'
        ret=3;return;
    case 'mm/s'
        ret=4;return;
    case 'ft/min'
        ret=5;return;
    case 'm/min'
        ret=6;return;
    case 'cm/min'
        ret=7;return;
    case 'mm/min'
        ret=8;return;
    case 'km/h'
        ret=9;return;
    otherwise
        ret=0; return;
    end
end