func occupied(x, y, _i, _j, _c) {
    _c = 0
    for (_j = -1; _j <= 1; _j++) {
        for (_i = -1; _i <= 1; _i++) {
            if (_i == 0 && _j == 0) continue
            if (rows[x + _i, y + _j] == "#") _c++
        }
    }
    return _c
}
{
    split($1, r, "")
    for (i = 1; i <= length(r); i++) {
        rows[i,NR] = r[i]
    }
    w = length($1)
}
END {
    do {
        changed = 0
        delete newrows

        for (y = 1; y <= NR; y++) {
            for (x = 1; x <= w; x++) {
                c = occupied(x,y)
                v = rows[x,y]
                if (rows[x,y] == "L" && occupied(x,y) == 0) {
                    newrows[x,y] = "#"
                    changed++
                } else if (rows[x,y] == "#" && occupied(x,y) >= 4) {
                    newrows[x,y] = occupied(x,y) >= 4 ? "L" : "#"
                    changed++
                } else {
                    newrows[x,y] = rows[x,y]
                }
            }
        }

        for (i in newrows) {
            rows[i] = newrows[i]
        }
    } while(changed > 0)

    t = 0
    for (i in rows) {
        if (rows[i] == "#") t++
    }
    print t
}
