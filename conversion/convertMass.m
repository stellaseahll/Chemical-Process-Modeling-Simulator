function ret=convertMass(value,str1,str2)
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
f=zeros(5,5);   
f(1,:)=[1 1000 10^6 0.001 2.20462 ];
f(:,1)=1./f(1,:)';
    for i=2:5
        f(i,:)=f(i,1)*f(1,:);
    end
end

function ret=convert(string)
    switch string
    case 'kg'
        ret=1;return;
    case 'g'
        ret=2;return;
    case 'mg'
        ret=3;return;
    case {'ton','tonne'}
        ret=4;return;
    case {'lb','pound','lbm'}
        ret=5;return;
    otherwise
        ret=0; return;
    end
end