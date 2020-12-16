{
    split($1,n,",")
    for (i = 1; i <= length(n); i++) {
        c++
        numbers[n[i]] = c
        last = n[i]
    }
}
END {
    for(; c < 30000000; c++) {
        p = numbers[last]
        numbers[last] = c
        last = p == 0 ? 0 : c - p
    }

    print "the answer is",last
}
