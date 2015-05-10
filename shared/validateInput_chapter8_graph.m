function errCode=validateInput_chapter8_graph(length,curType,prevType)

errCode(1)=errCodeLength(length);
errCode=errCode(errCode~=0);
prev=sortType(prevType);
cur=sortType(curType);
if (prevType==0 && (cur=='B'))
    errCode=[errCode 25];
    return;
elseif (prevType==0)
    return;
end

if ((prev=='H'&&cur=='V')||(prev=='V'&&cur=='H'))
    errCode=[errCode 19];
    sort(errCode);
    return;
end
if (prev=='B'&&cur=='B')
    if (((prevType==7||prevType==8)&&(curType==7||curType==8))||((prevType==9||prevType==10)&&(curType==9||curType==10))...
        ||((prevType==11||prevType==12)&&(curType==11||curType==12)))
        errCode=[errCode 21];
        sort(errCode);
        return;
    else
        return;
    end
end
if (prev=='B'&&cur=='H')
    if (prevType-curType~=6)
        errCode=[errCode 20];
        sort(errCode);
        return;
    else
        return;
    end
end
if (prev=='B'&&cur=='V')
    if (prevType-curType~=6)
        errCode=[errCode 22];
        sort(errCode);
        return;
    else
        return;
    end
end
if (prev=='V'&&cur=='B')
    if (curType==11||curType==12)
        errCode=[errCode 26];
        sort(errCode);
        return;
    else
        return;
    end
end
if (prev=='H'&&cur=='B')
    if (((prevType==1||prevType==2)&&(curType==7||curType==8))...
            ||((prevType==3||prevType==4)&&(curType==9||curType==10)))
        errCode=[errCode 27];
        sort(errCode);
        return;
    else
        return;
    end
end
if ((prev=='H'&&cur=='H')||(prev=='V'&&cur=='V'))
    if (prevType~=curType)
        errCode=[errCode 19];
        sort(errCode);
        return;
    else
        return;
    end
end
end

function ret=sortType(type)
if (type>0&&type<=4)
    ret='H';
elseif (type<=6)
    ret='V';
elseif (type<=12)
    ret='B';
else
    ret=0;
end
end