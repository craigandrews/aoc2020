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
            # Memoize the 5th to 7th terms of the Tribonacci sequence
            switch(x) {
                case 2:
                    t = t * 2
                    break
                case 3:
                    t = t * 4
                    break
                case 4:
                    t = t * 7
                    break
            }
            x = 0
        }
    }
    print t
}
