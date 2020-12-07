function get_containers(b) {
    if (length(bag_containers[b]) == 0) {
        return length(containers)
    }

    for (i in bag_containers[b]) {
        containers[i] = 1
        get_containers(i)
    }
    return length(containers)
}
{
    c=$1" "$2
    for (i = 5; i<NF; i+=4) {
        n=$i
        d=$(i+1)" "$(i+2)
        bag_containers[d][c] = 1
    }
}
END {
    print get_containers("shiny gold")
}
