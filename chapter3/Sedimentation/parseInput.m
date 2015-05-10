function [C Ups type Uint]=parseInput(n,ut,CS,CB)
Cmax=1-n/(n+1);
if (Cmax-CS>0.0001)
    CEmax=NaN;
else
    CEmax=getCEmax(n,Cmax,CS);
end
if (isnan(CEmax))
    type=1;
    CEmin=NaN;
    CBmin=NaN;
    C=[CBmin CB CEmin CEmax CS Cmax];
    Ups=ut*C.*(1-C).^n;
    Uint(1)=Ups(2)/C(2);
    Uint(2)=Ups(2)/(C(2)-C(5)); 
    return;
end 
upsb=CB.*(1-CB).^n;
m=(CEmax)*(1-CEmax)^n/(CEmax-CS);
c=-m*CS;
CBmin=getCBmin(n,m,c,CEmax);
if (CB-CEmax>0.0001)
    type=1;
    CEmin=NaN;
    C=[CBmin CB CEmin CEmax CS Cmax];
    Ups=ut*C.*(1-C).^n;
    Uint(1)=Ups(2)/C(2);
    Uint(2)=Ups(2)/(C(2)-C(5)); 
    return;
end
    
CEmin=fminbnd(@(C) solveCEmin(C,CB,upsb,n),CB,CEmax);

C=[CBmin CB CEmin CEmax CS Cmax];
Ups=ut*C.*(1-C).^n;
Ups(7)=Ups(5);
Ups(5)=0;
Uint(1)=Ups(2)/C(2);
if (CB<=CBmin-0.001)
    type=1;
    Uint(2)=Ups(2)/(C(2)-C(5));    
else
    type=2;
    Uint(2)=(Ups(2)-Ups(3))/(C(2)-C(3));
    Uint(3)=Ups(4)/(C(4)-C(5));
end
C=[CBmin CB CEmin CEmax CS Cmax];

end

function f=solveCEmax(C,CS,n)
    Ups2=(C)*(1-C)^n;
    m=Ups2/(C-CS);
    mtan=-C*n*(1-C)^(n-1)+(1-C)^n;
    f=abs(m-mtan);
end

function f=solveCBmin(C,n,m,c)
    Y=m*C+c;
    Y2=(C)*(1-C)^n;
    f=abs(Y-Y2);
end

function f=solveCEmin(C,CB,upsb,n)
    Ups2=(C)*(1-C)^n;
    m=(Ups2-upsb)/(C-CB);
    mtan=-C*n*(1-C)^(n-1)+(1-C)^n;
    f=abs(m-mtan);
end

function C=getCBmin(n,m,c,CEmax)
    X=0.1:0.1:CEmax;
    for i=1:length(X)
        [C(i), f(i)]=fminbnd(@(C) solveCBmin(C,n,m,c),0,X(i));
    end
    f(abs(C-CEmax)<0.0001)=[];
    C(abs(C-CEmax)<0.0001)=[];
    C=C(f==min(f));
end

function C=getCEmax(n,Cmax,CS)
    X=linspace(Cmax,CS,8);
    for i=1:length(X)-1
        [C(i), f(i)]=fminbnd(@(C) solveCEmax(C,CS,n),X(i),X(i+1));
        Ctest=[C(i)-0.01 C(i) C(i)+0.01];
        Ups=Ctest.*(1-Ctest).^n;
        mtest=Ups(2)/(Ctest(2)-CS);
        ctest=-mtest*CS;
        testLine=mtest*Ctest+ctest;
        if (Ups(1)<testLine(1))
            C(i)=0;
            f(i)=1000;
        end
    end
    C=C(f==min(f));
    if (C==0)
        C=nan;
    end
end
    
    
    

