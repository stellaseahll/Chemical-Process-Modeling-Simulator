function pTotal=findPressureDrop(firstType,firstLength,horizontalLength,verticalLengthUp,verticalLengthDown,numBends,diameter,Mp,denP,denF,size,vis,Ufs)

if (firstType==1)
    pFirst=findVerticalPipeConditions(Mp,denP,denF,size,vis,diameter,firstLength,Ufs,1);
elseif (firstType==2)
    pFirst=findHorizontalPipeConditions(Mp,denP,denF,size,vis,diameter,firstLength,Ufs,1);
end 
pHorizontal=findHorizontalPipeConditions(Mp,denP,denF,size,vis,diameter,horizontalLength,Ufs,0);
pVerticalUp=findVerticalPipeConditions(Mp,denP,denF,size,vis,diameter,verticalLengthUp,Ufs,0);
pVerticalDown=findVerticalPipeConditions(Mp,denP,denF,size,vis,diameter,verticalLengthDown,Ufs,0);
pBend=findBendConditions(Mp,denP,denF,size,vis,diameter,Ufs)*numBends;
pTotal=pHorizontal+pVerticalUp+pVerticalDown+pBend+pFirst;


