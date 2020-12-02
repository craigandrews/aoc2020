{
    split($1, position, "-")
    letter = substr($2, 1, 1)
    split($3, password, "")

    if (password[position[1]] != password[position[2]]) {
        if (password[position[1]] == letter || password[position[2]] == letter) {
            valid++
        }
    }
}
END {
    print valid
}
