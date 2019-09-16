RSP commands
stepUntil: aBlock
	[ self s.
	Transcript show: ((self getRegisters at: 'r19') printString); cr.
	] doWhileFalse: aBlock