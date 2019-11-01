tests-powerpc
testRunConcat2
	| specialSimulationState irsb finalState regs finalPC |
	specialSimulationState := SimState ensureArch: 'powerpc'.
	irsb := self onePPCInst, self anotherPPCInst.
	finalState := VEXEngine newEngine process: specialSimulationState irsb: irsb.
	self assert: finalState ip equals: 16r108.
	regs := finalState registers.
	self assert: (regs isKindOf: SymbolicRegisterFile).
	finalPC := regs load: 1168.
	self assert: finalPC value equals: 16r108
