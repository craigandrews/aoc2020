func exec() {
    pc = 1
    acc = 0
    delete seen

    while(pc <= length(mem)) {
        if (seen[pc] == 1) {
            return "error"
        }

        seen[pc] = 1

        switch(mem[pc]["opcode"]) {
            case "acc":
                acc = acc + mem[pc]["operand"]
                pc++
                break
            case "jmp":
                pc = pc + mem[pc]["operand"]
                break
            case "nop":
                pc++
                break
        }
    }

    return acc
}


{
    mem[NR]["opcode"] = $1
    mem[NR]["operand"] = $2
}
END {
    for (i=1; i<=length(mem); i++) {
        if (mem[i]["opcode"] == "acc") {
            continue
        }

        o = mem[i]["opcode"]
        mem[i]["opcode"] = mem[i]["opcode"] == "jmp" ? "nop" : "jmp"

        a = exec()
        if (a != "error") {
            print a
            break
        }

        mem[i]["opcode"] = o
    }
}
