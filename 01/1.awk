/^[0-9]+$/ {
    for (x in i) {
        if ($1 + i[x] == 2020) {
            print $1*i[x]
            exit
        }
    }
    i[c] = $1
    c++
}
