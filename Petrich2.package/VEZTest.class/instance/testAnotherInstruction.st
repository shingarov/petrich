tests
testAnotherInstruction
	| instr irsb specialSimulationState finalState r3 operands registers |
	specialSimulationState := SimState ensureArch: 'powerpc'.
	specialSimulationState regs at: 'r4' put: 0.
	instr := AcProcessorDescriptions powerpc instructionAt: 'ori'.
	operands := Dictionary new
		at: 'rs' put: 4;
		at: 'ra' put: 3;
		at: 'ui' put: 16r1;
		yourself.
	irsb := (instr inEnvironment: operands) vezAt: 16r100.
	finalState := VEXEngine newEngine process: specialSimulationState irsb: irsb.
	registers := finalState registers.
	r3 := registers at: 'r3'.
	self assert: r3 equals: 1