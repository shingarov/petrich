tests-x86
testLi1234Symbolic
	| x specialSimulationState irsb finalState |
	specialSimulationState := SimState ensureArch: 'powerpc'.
	x := IntSymbol sym: 'X' length: 32.
	specialSimulationState @'regs' at: 'r3' put: x.
	irsb := self li1234.
	finalState := VEXEngine newEngine process: specialSimulationState irsb: irsb.
	
	self assert: (finalState @'regs' at: 'r3') value equals: 16r1234.
	self assert: finalState ip equals: 16r104
