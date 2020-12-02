{
    split($1, range, "-")
    letter = substr($2, 1, 1)
    split($3, password, "")

    count = 0
    for (i in password) {
        print password[i]" "l
        if (password[i] == letter) {
            count++
        }
    }

    if (count >= range[1] && count <= range[2]) {
        valid++
    }
}
END {
    print valid
}
