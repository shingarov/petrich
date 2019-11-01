tests
testOneInstruction
	| instr irsb specialSimulationState finalState r3 operands registers |
	specialSimulationState := SimState ensureArch: 'powerpc'.
	instr := AcProcessorDescriptions powerpc instructionAt: 'addis'.
	operands := Dictionary new
		at: 'ra' put: 0;
		at: 'rt' put: 3;
		at: 'd' put: 16rABCD;
		yourself.
	irsb := (instr inEnvironment: operands) vezAt: 16r100.
	finalState := VEXEngine newEngine process: specialSimulationState irsb: irsb.
	registers := finalState @'regs'.
	r3 := registers at: 'r3'.
	self assert: r3 value equals: 16rABCD0000
	