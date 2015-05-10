function ret=convertViscosity(value,str1,str2)
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
f=zeros(4,4);   
f(1,:)=[1 1000  0.020885434225 0.020885434225*32.174];
f(:,1)=1./f(1,:)';
    for i=2:4
        f(i,:)=f(i,1)*f(1,:);
    end
end

function ret=convert(string)
    switch string
    case {'Pas','Pa.s','pa.s','pas','pa s','SI'}
        ret=1;return;
    case 'cp'
        ret=2;return;
    case {'psfs','psf.s','psf s'}
        ret=3;return;
    case {'fps','english','lb/(fts)','lb/ft/s','lbm/ft/s'}
        ret=4;return;
    otherwise
        ret=0; return;
    end
end