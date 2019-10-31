tests-powerpc
testLWZ
	| specialSimulationState irsb finalState |
	specialSimulationState := SimState ensureArch: 'powerpc'.
self shouldBeImplemented .
	specialSimulationState @'memory' @ 'regs' at: 'eax' put: 5.
	irsb := self incEAX.
	finalState := VEXEngine newEngine process: specialSimulationState irsb: irsb.
	self assert: (finalState @ 'regs' at: 'eax') equals: 6.
	self assert: finalState ip equals: 16r101
