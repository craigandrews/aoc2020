function add_to_total() {
    t += length(g)
}

{
    if (length($1) == 0) {
        add_to_total()
        delete g
        next
    }

    for (i = 1; i <= length($1); i++) {
        g[substr($1, i, 1)] = 1
    }
}
END {
    add_to_total()
    print t
}
