function ret=convertMassFlowRate(value,str1,str2)
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
f(1,:)=[1 1/60 1/3600 1000 1000/60 1000/3600 2.20462 2.20462/60 2.20462/3600 ];
f(:,1)=1./f(1,:)';
    for i=2:9
        f(i,:)=f(i,1)*f(1,:);
    end
end

function ret=convert(string)
    switch string
    case 'kg/h'
        ret=1;return;
    case 'kg/min'
        ret=2;return;
    case 'kg/s'
        ret=3;return;
    case 'g/h'
        ret=4;return;
    case 'g/min'
        ret=5;return;
    case 'g/s'
        ret=6;return;
    case 'lb/h'
        ret=7;return;
    case 'lb/min'
        ret=8;return;
    case 'lb/s'
        ret=9;return;
    otherwise
        ret=0; return;
    end
end