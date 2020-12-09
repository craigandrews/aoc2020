{
    data[NR] = $1
}
NR > 25 && target == 0 {
    for (x = NR - 25; x < NR - 1; x++) {
        if (data[x] >= $1) continue

        for (y = x + 1; y < NR; y++) {
            if (data[y] >= $1) continue

            if (data[x] + data[y] == $1) next
        }
    }
    target = $1
}
END {
    for (x = 1; x < length(data); x++) {
        total = data[x]
        min = target
        max = total

        for (y = x + 1; y <= length(data); y++) {
            total = total + data[y]

            if (data[y] < min) min = data[y]
            if (data[y] > max) max = data[y]

            if (total == target) {
                print min+max
                exit
            }

            if (total > target) {
                break
            }
        }
    }
}
