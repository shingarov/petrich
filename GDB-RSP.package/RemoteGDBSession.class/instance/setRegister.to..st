accessing
setRegister: r to: x
	| regs |
	regs := self getRegisters.
	regs at: 'r', r printString put: x.
	self setRegisters: regs