tests
testRegbankStoreSym
	| specialSimulationState r |
	specialSimulationState := SimState ensureArch: 'powerpc'.
	specialSimulationState @'regs' at: 'r15' put: ('x' asBitVector: 32).
	r := specialSimulationState @'regs' at: 'r15'.
	self assert: r sym equals: 'x'
	