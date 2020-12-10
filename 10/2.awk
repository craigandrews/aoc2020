function combinations(l) {
    if (l <= 0) return 1
    if (l == 1) return 2
    return combinations(l-1) + combinations(l - 2) + combinations(l - 3)
}
{
    data[NR] = $1
}
END {
    data[length(data) + 1] = 0

    n = asort(data)

    data[n+1] = data[n] + 3
    n++

    x = 0
    t = 1
    for (i = 2; i <= n; i++) {
        d = data[i] - data[i-1]

        if (d == 1) {
            x++
        } else if (d == 3) {
            t = t * combinations(x - 1)
            x = 0
        }
    }
    print t
}
