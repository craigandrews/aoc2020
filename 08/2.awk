function copy(a, b) {
    for (i in a) {
        b[i] = a[i]
    }
}
function exec(pc, acc, trace, changed, _opcode, _trace) {
    # If this address has been trace, we failed
    if (trace[pc] == 1) {
        return "error"
    }

    # If pc exceeds mem length, we're done!
    if (pc > length(mem)) {
        return acc
    }

    # Clone trace to _trace so as not to get issues with references being updated by both forks
    copy(trace, _trace)
    _trace[pc] = 1

    _opcode = mem[pc]["opcode"]

    # Just act on ACC directly
    if (_opcode == "acc") {
        return exec(pc + 1, acc + mem[pc]["operand"], _trace, changed)
    }

    # Fork a NOP only if nothing changed yet, or actually a NOP
    if (changed != 1 || _opcode == "nop") {
        r = exec(pc + 1, acc, _trace, _opcode == "nop" ? changed : 1)

        if (r != "error") {
            return r
        }
    }

    # Fork a JMP only if nothing changed yet, or actually a JMP
    if (changed != 1 ||_opcode == "jmp") {
        r = exec(pc + mem[pc]["operand"], acc, _trace, _opcode == "jmp" ? changed : 1)

        if (r != "error") {
            return r
        }
    }

    return "error"
}

{
    mem[NR]["opcode"] = $1
    mem[NR]["operand"] = $2
}
END {
    print exec(1, 0)
}
