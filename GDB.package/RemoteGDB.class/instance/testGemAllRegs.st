tests
testGemAllRegs
	| regs    |
self halt.
	self prepareSession.
	regs := self getRegisters.
	self setThread: 'c' t: 0. "future step operations on any thread"

	0 to: 31 do: [ :r |
		| rName |
		rName := 'r', r printString.
		regs at: rName put: 100+r
	].
self halt.
	self setRegisters: regs.
	
	regs := self getRegisters.
	self s.
	regs := self getRegisters.
	self halt.
	