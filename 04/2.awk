function check_passport() {
    if (length(fields) != 7) {
        return
    }

    if (fields["byr"] < 1920 || fields["byr"] > 2002) return
    if (fields["iyr"] < 2010 || fields["iyr"] > 2020) return
    if (fields["eyr"] < 2020 || fields["eyr"] > 2030) return
    if (fields["hcl"] !~ /^#[0-9a-f]{6}$/) return
    if (fields["ecl"] !~ /^(amb|blu|brn|gry|grn|hzl|oth)/) return
    if (fields["pid"] !~ /^[0-9]{9}$/) return
    if (fields["hgt"] !~ /^[0-9]+(cm|in)$/) return

    hgt = fields["hgt"]
    unit = substr(hgt, length(hgt) - 1)
    value = substr(hgt, 1, length(hgt) - 2)
    switch (unit) {
        case "in":
            if (value < 59 || value > 76) return
            break
        case "cm":
            if (value < 150 || value > 193) return
            break
        default:
            return
    }

    count++
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
