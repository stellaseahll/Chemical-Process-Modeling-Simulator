function [flux_grad C Ups hasMinPoint isOverload]=parseInput_thickener(n,Ut,F,L,V,A,CF)
%flux_grad=[F/A L/A V/A]
%C=[CB  CF CL CV CT CFcrit] for  ~hasMinPoint
%C=[CB CF CL CV CT CFcrit CBmax   ] for hasMinPoint
%Ups=[UpsF UpsL UpsV] for  ~hasMinPoint
%Ups=[UpsF UpsL UpsV Upsmax]; for hasMinPoint

flux_grad(1)=F/A;
flux_grad(2)=L/A;
flux_grad(3)=-V/A;
CFcrit=getCFcrit(n,Ut,flux_grad(1),flux_grad(2));
UpsF=CF*flux_grad(1);
[CBmax ,Upsmax]=fminbnd(@(C) findMin(C,n,Ut,flux_grad(2)),CF,1);
if (abs(CF-CBmax)<10^-3)
    hasMinPoint=0;
else
    hasMinPoint=1;
    CFcrit=Upsmax/flux_grad(1);
end
if (CF>CFcrit)
    isOverload=1;
else
    isOverload=0;
end
if (~isOverload)
    if (hasMinPoint)
        CB=getCB(n,Ut,flux_grad(2),UpsF,CF);
        CL=UpsF/flux_grad(2);
        CT=0;
        CV=0;
        Ups=[UpsF UpsF 0 Upsmax];
        C=[CB  CF CL CV CT  CFcrit CBmax];
    else
        CB=getCB(n,Ut,flux_grad(2),UpsF,CF);
        CL=CF*flux_grad(1)/flux_grad(2);
        CV=0;
        CT=0;
        Ups=[UpsF UpsF 0 Upsmax];
        C=[CB CF CL CV CT CFcrit ];
    end
end
if (isOverload)
    if (~hasMinPoint)
        CB=CF;
        UpsL=Ut*CB.*(1-CB).^n+flux_grad(2)*CB;
    else
        CB=getCBOverload(n,Ut,flux_grad(2),Upsmax,CF,CBmax);
        UpsL=Upsmax;
    end
    CL=UpsL/flux_grad(2);
    excess=UpsF-UpsL;
    CT=fminbnd(@(C) solveCT(C,n,Ut,flux_grad(3),excess),0,CL);
    UpsV=Ut*CT.*(1-CT).^n+flux_grad(3)*CT;
    CV=UpsV/flux_grad(3);
    if (hasMinPoint)
        Ups=[UpsF UpsL UpsV Upsmax];
        C=[CB CF CL CV CT CFcrit CBmax ];
    else
        Ups=[UpsF UpsL UpsV ];
        C=[CB  CF CL CV CT CFcrit];
    end
    [Ctemp, Upsmax_bottom]=fminbnd(@(C) findMax(C,n,Ut,flux_grad(3)),0,1);
    Ups(end+1)=-Upsmax_bottom;
    if (~(isOverload&&hasMinPoint))
        C(7)=nan;
    end
end
end

function f=solveCFcrit(C,n,Ut,F_A,L_A)
Y1=Ut*C.*(1-C).^n+L_A*C;
Y2=F_A*C;
f=abs(Y1-Y2);
end

function f=solveCB(C,n,Ut,L_A,UpsF)
Y1=Ut*C.*(1-C).^n+L_A*C;
Y2=UpsF;
f=abs(Y1-Y2);
end

function f=solveCT(C,n,Ut,V_A,excess)
Y1=Ut*C.*(1-C).^n+V_A*C;
Y2=-excess;
f=abs(Y1-Y2);
end

function f=findMin(C,n,Ut,L_A)
f=Ut*C.*(1-C).^n+L_A*C;
end

function f=findMax(C,n,Ut,V_A)
f=-Ut*C.*(1-C).^n-V_A*C;
end

function CB=getCB(n,Ut,L_A,UpsF,CF)
X=0:0.1:(CF+0.1);
CB=zeros(1,length(X));
f=zeros(1,length(X));
for i=1:length(X)
    [CB(i),f(i)]=fminbnd(@(C) solveCB(C,n,Ut,L_A,UpsF),0,X(i));
end
CB=CB(f==min(f));
CB=CB(1);
end

function CFcrit=getCFcrit(n,Ut,F_A,L_A)
X=0:0.1:1;
CFcrit=zeros(1,length(X));
f=zeros(1,length(X));
for i=1:length(X)-1
    [CFcrit(i),f(i)]=fminbnd(@(C) solveCFcrit(C,n,Ut,F_A,L_A),0,X(i));
end
if (all(CFcrit<10^-6))
    CFcrit=0;
    return;
end
CFcrit(CFcrit<10^-6)=[];
CFcrit=max(CFcrit);
end

function f=solveCBOverload(C,n,Ut,Upsmax,L_A)
Y1=Ut*C.*(1-C).^n+L_A*C;
Y2=Upsmax;
f=abs(Y1-Y2);
end

function CB=getCBOverload(n,Ut,L_A,Upsmax,CF,CBmax)
X=0:0.1:(CF+0.1);
CB=zeros(1,length(X));
f=zeros(1,length(X));
for i=1:length(X)
    [CB(i),f(i)]=fminbnd(@(C) solveCBOverload(C,n,Ut,Upsmax,L_A),0,X(i));
end
f(CB<0.0001)=[];
CB(CB<0.0001)=[];
f(abs(CB-CBmax)<0.0001)=[];
CB(abs(CB-CBmax)<0.0001)=[];
CB=CB(f==min(f));

end