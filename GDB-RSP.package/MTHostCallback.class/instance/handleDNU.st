surgery
handleDNU
	| regs receiver selector className |
	regs := gdb getRegisters.
	receiver := regs at: 'r1'.
	receiver := MTRemoteObject gdb: gdb pointer: receiver.
	className := receiver mdObject definingClass name symbol.
	selector := regs at: 'r7'.
	selector := MTRemoteSymbol gdb: gdb pointer: selector.
	selector := selector symbol.
	self halt