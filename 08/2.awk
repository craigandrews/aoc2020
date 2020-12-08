function copy(a, b) {
    for (i in a) {
        b[i] = a[i]
    }
}
function exec(pc, acc, seen, changed, _l, _r, _opcode, _seen) {
    # If this address has been seen, we failed
    if (seen[pc] == 1) {
        return "error"
    }

    # If pc exceeds mem length, we're done!
    if (pc > length(mem)) {
        return acc
    }

    # Clone seen to _seen so as not to get issues with references being updated by both forks
    copy(seen, _seen)
    _seen[pc] = 1

    _opcode = mem[pc]["opcode"]

    if (_opcode == "acc") {
        return exec(pc + 1, acc + mem[pc]["operand"], _seen, changed, indent)
    }

    # Fork a NOP only if nothing changed yet, or actually a NOP
    if (changed != 1 || _opcode == "nop") {
        _l = exec(pc + 1, acc, _seen, _opcode == "nop" ? changed : 1, indent + 1)
    } else {
        _l = "error"
    }

    # Fork a JMP only if nothing changed yet, or actually a JMP
    if (changed != 1 ||_opcode == "jmp") {
        _r = exec(pc + mem[pc]["operand"], acc, _seen, _opcode == "jmp" ? changed : 1, indent + 1)
    } else {
        _r = "error"
    }

    if (_l != "error") {
        return _l
    }

    return _r
}

{
    mem[NR]["opcode"] = $1
    mem[NR]["operand"] = $2
}
END {
    print exec(1, 0)
}
