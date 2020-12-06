{
    n = 0
    for (i = 1; i <= length($1); i++) {
        c = substr($1, i, 1)
        if (c == "B" || c == "R") {
            n += 2 ** (length($1) - i)
        }
    }

    s[n] = 1
}
END {
    f = 0
    for (i = 1; i < length(s); i++) {
        if (s[i] == 0 && f == 1) {
            print i
            break
        } else if (s[i] == 1) {
            f = 1
        }
    }
}
