function fg=findGasFrictionFactor(Re,e)
if (nargin==1)
    e=0; %smooth pipe
end
for i=1:10
    [fg(i) f(i)]=fsolve(@(x) solveF(x,Re,e),10^(i-3));
    if (imag(fg(i))<10^-6)
        fg(i)=real(fg(i));
    end
end
f(fg<0)=[];
fg(fg<0)=[];
fg=fg(f==min(f));
end
    



function f=solveF(x,Re,e)
f=1/sqrt(x)+4*log10(e/3.7+1.257/Re/sqrt(x));
end