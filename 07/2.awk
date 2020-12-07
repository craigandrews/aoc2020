function count_bags(b, _c) {
    _c = 0
    if (length(bag_containers[b]) == 0) {
        return 0
    }

    for (i in bag_containers[b]) {
        n = bag_containers[b][i]
        _c = _c + n + n * count_bags(i)
    }
    return _c
}
{
    c=$1" "$2
    for (i = 5; i<NF; i+=4) {
        n=$i
        d=$(i+1)" "$(i+2)
        if (n != "no") {
            bag_containers[c][d] = n
        }
    }
}
END {
    print count_bags("shiny gold")
}

