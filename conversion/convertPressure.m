function ret=convertPressure(value,str1,str2)
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
f=zeros(10,10);   
f(:,1)=[1; 1000; 101325; 10^5; 47.8802; 6894.75729; 133.322368 ; 9.80665 ;2989.0669 ;47.8802*32.174];
f(1,:)=1./f(:,1)';
    for i=2:10
        f(i,:)=f(i,1)*f(1,:);
    end
end

function ret=convert(string)
    switch string
    case {'Pa','pa'}
        ret=1;return;
    case {'kpa','kPa'}
        ret=2;return;
    case 'atm'
        ret=3;return;
    case 'bar'
        ret=4;return;
    case 'psf'
        ret=5;return;
    case 'psi'
        ret=6;return;
    case {'mmHg','mmhg','mmMercury','mm Mercury','mm Hg','mm hg','mm mercury'}
        ret=7;return;
    case {'mmh2o','mmH2O','mmWater','mm H2O','mm Water','mm h2o'}
        ret=8;return;
    case {'fth2o','ftH2O','ftWater','ft H2O','ft h2o','ft water','ft Water'}
        ret=9;return;
    case {'lb/(fts2)','english','English','lb/f/s2'}
        ret=10;return;
    otherwise
        ret=0; return;
    end
end

