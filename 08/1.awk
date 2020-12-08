{
    mem[NR]["opcode"] = $1
    mem[NR]["operand"] = $2
}
END {
    pc = 1
    acc = 0

    while(1) {
        if (mem[pc]["seen"] == 1) {
            break
        }

        mem[pc]["seen"] = 1

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

    print acc
}
