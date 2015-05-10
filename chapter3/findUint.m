function Uint=findUint(C,Ups,type)
%C=[CBmin CB CEmin CEmax CS];
if (type==1)
    Uint_AB=Ups(2)/C(2);
    Uint_BS=(Ups(5)-Ups(2))/(C(5)-C(2));
    Uint=[Uint_AB Uint_BS];
elseif (type==2)
    Uint_AB=Ups(2)/C(2);
    Uint_BEmin=(Ups(3)-Ups(2))/(C(3)-C(2));
    Uint_EmaxS=(Ups(5)-Ups(4))/(C(5)-C(4));
    Uint=[Uint_AB Uint_BEmin Uint_EmaxS];
end