{
    n = 0
    for (i = 1; i <= length($1); i++) {
        c = substr($1, i, 1)
        if (c == "B" || c == "R") {
            n += 2 ** (length($1) - i)
        }
    }

    if (n > h) {
        h = n
    }
}
END {
    print h
}
