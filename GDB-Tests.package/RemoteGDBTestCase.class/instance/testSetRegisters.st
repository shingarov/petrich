as yet unclassified
testSetRegisters

	| regs1 regs2 |
	self halt.
	regs1 := gdb getRegisters.
	gdb setRegisters: regs1.
	regs2 := gdb getRegisters.
	self assert: regs1 = regs2.