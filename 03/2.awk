BEGIN {
    dx[1] = 1
    dx[2] = 3
    dx[3] = 5
    dx[4] = 7
    dx[5] = 1
}
{
    for (i in dx) {
        if (i < 5 || t < 1) {
            if (substr($1, x[i]+1, 1) == "#") count[i]++
            x[i] = (x[i] + dx[i]) % length($1)
        }
    }
    t = (t+1) % 2
}
END {
    total = 1
    for (i in count) {
        total *= count[i]
    }
    print total
}
