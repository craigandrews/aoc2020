function tribonacci(x, _t, _r, _i) {
    split("001", _t, "")
    _r = 1

    for (_i = 0; _i < x; _i++) {
        _r = _t[1] + _t[2] + _t[3]

        _t[1] = _t[2]
        _t[2] = _t[3]
        _t[3] = _r
    }

    return _r
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
            t = t * tribonacci(x)
            x = 0
        }
    }
    print t
}
