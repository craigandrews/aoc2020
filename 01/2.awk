/^[0-9]+$/ {
    for (x = 1; x < c; x++) {
        for (y = x; y < c; y++) {
            z++
            if ($1 + i[x] + i[y] == 2020) {
                print $1*i[x]*i[y]" values="$1","i[x]","i[y]" comparisons="z" lines_read="c
                exit
            }
        }
    }
    i[c] = $1
    c++
}
