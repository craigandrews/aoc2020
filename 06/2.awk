function add_to_total() {
    for (i in g) {
        if (g[i] == n) {
            t++
        }
    }
}

{
    if (length($1) == 0) {
        add_to_total()
        delete g
        n = 0
        next
    }

    n++
    for (i = 1; i <= length($1); i++) {
        g[substr($1, i, 1)] += 1
    }
}
END {
    add_to_total()
    print t
}
