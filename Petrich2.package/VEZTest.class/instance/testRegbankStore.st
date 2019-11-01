tests
testRegbankStore
	| specialSimulationState r5 |
	specialSimulationState := SimState ensureArch: 'powerpc'.
	specialSimulationState @'regs' at: 'r5' put: 16r12345678.
	r5 := specialSimulationState @'regs' at: 'r5'.
	self assert: r5 value equals: 16r12345678
	