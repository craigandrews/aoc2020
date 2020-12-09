{
    data[NR] = $1
}
NR > 25 {
    for (x = NR - 25; x < NR - 1; x++) {
        if (data[x] >= $1) continue

        for (y = x + 1; y < NR; y++) {
            if (data[y] >= $1) continue

            if (data[x] + data[y] == $1) {
                next
            }
        }
    }
    print $1
    exit
}
