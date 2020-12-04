function check_passport() {
    if (length(fields) == 7) {
        count++
    }
}
/^$/{
    check_passport()
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
    check_passport()
    print count
}
