function vol = getCuboidVolume(wid,len,hei,thi)
    vol = prod([wid - 2*thi, len - 2*thi, hei - 2*thi]);
end