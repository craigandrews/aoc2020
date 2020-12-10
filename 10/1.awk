{
    data[NR] = $1
}
END {
    data[length(data) + 1] = 0

    n = asort(data)

    data[n+1] = data[n] + 3
    n++

    x = 0
    y = 0
    for (i = 2; i <= n; i++) {
        d = data[i] - data[i-1]

        if (d == 1) {
            x++
        } else if (d == 3) {
            y++
        }
    }
    print x * y
}
