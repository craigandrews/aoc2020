/^$/{
    print length(fields)
    if (length(fields) == 7) {
        count++
    }
    delete fields
}
{
    for (i=1; i <= NF; i++) {
        split($i, f, ":")
        if (f[1] != "cid") {
            fields[f[1]] = f[2]
        }
    }
}
END {
    if (length(fields) == 7) {
        count++
    }
    print count
}
