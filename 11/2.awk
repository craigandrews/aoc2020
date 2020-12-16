func occupied_direction(x, y, dx, dy, _i, _j, _c) {
    for (_i = x + dx; _i >= 1 && _i <= w; _i += dx) {
        for (_j = y + dy; _j >= 1 && _j <= NR; _j += dy) {
            if (rows[_i, _j] == "L") return 0
            if (rows[_i, _j] == "#") return 1

            if (dy == 0) break
        }

        if (dx == 0) break
    }

    return 0
}

func occupied(x, y, _i, _c) {
    _c = 0

    for (_i = 1; i <= NR && i <= w; i++) {
        _c = _c + occupied_direction(x, y, -1, -1)
        _c = _c + occupied_direction(x, y,  0, -1)
        _c = _c + occupied_direction(x, y,  1, -1)

        _c = _c + occupied_direction(x, y, -1,  0)
        _c = _c + occupied_direction(x, y,  1,  0)

        _c = _c + occupied_direction(x, y, -1,  1)
        _c = _c + occupied_direction(x, y,  0,  1)
        _c = _c + occupied_direction(x, y,  1,  1)
    }
    print _c
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
                v = rows[x,y]
                if (rows[x,y] == "L" && occupied(x,y) == 0) {
                    newrows[x,y] = "#"
                    changed++
                } else if (rows[x,y] == "#" && occupied(x,y) >= 5) {
                    newrows[x,y] = occupied(x,y) >= 4 ? "L" : "#"
                    changed++
                } else {
                    newrows[x,y] = rows[x,y]
                }
                printf("%s", newrows[x,y])
            }
            printf("\n")
        }

        print "---"
        for (i in newrows) {
            rows[i] = newrows[i]
        }
        print changed
        print "---"
    } while(changed > 0)

    t = 0
    for (i in rows) {
        if (rows[i] == "#") t++
    }
    print t
}
