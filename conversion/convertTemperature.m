function ret=convertTemperature(value,str1,str2)

switch str1
    case {'C','degC','oC','c'}
        ret=value+273.15;
    case {'F','degF','oF','f'}
        ret=5*(value+459.67)/9;
    case {'R','degR','oR','r'}
        ret=5*value/9;
    case {'K','degK','oK','k'}
        ret=value;
    otherwise
        error('Format of Conversion not Recognized');
end

if (nargin==2)
    return;
end

switch str2
    case {'C','degC','oC','c'}
        ret=ret-273.15;return;
    case {'F','degF','oF','f'}
        ret=ret*9/5-459.67;return;
    case {'R','degR','oR','r'}
        ret=9*ret/5;return;
    case {'K','degK','oK','k'}
        return;
    otherwise
        error('Format of Conversion not Recognized');
end

end