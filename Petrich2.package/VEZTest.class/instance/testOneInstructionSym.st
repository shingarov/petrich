tests
testOneInstructionSym
	| instr irsb specialSimulationState finalState r22 operands registers |
	specialSimulationState := SimState ensureArch: 'powerpc'.
	instr := AcProcessorDescriptions powerpc instructionAt: 'addis'.
	operands := Dictionary new
		at: 'ra' put: 0;
		at: 'rt' put: 22;
		at: 'd' put: ('X' asBitVector: 16);
		yourself.
	irsb := (instr inEnvironment: operands) vezAt: 16r100.
	finalState := VEXEngine newEngine process: specialSimulationState irsb: irsb.
	registers := finalState @'regs'.
	r22 := registers at: 'r22'.
	self assert: r22 isSymbolic.
	self deny: r22 isLeaf