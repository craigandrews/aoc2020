{
    if (substr($1, x+1, 1) == "#") {
        count++
    }
    x = (x + 3) % length($1)
}
END {
    print count
}
