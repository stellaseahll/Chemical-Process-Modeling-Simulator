function ret=errCodeSphericity(sphericity)
    if (sphericity>0&&sphericity<=1)
        ret=0;
    else
        ret=6;
    end
end