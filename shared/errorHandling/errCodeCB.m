function ret=errCodeCB(CB)
    if (CB>0&&CB<=1)
        ret=0;
    else
        ret=9;
    end
end
