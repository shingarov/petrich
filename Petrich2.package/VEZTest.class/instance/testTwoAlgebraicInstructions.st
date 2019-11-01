tests
testTwoAlgebraicInstructions
	| instrs irsb specialSimulationState finalState r3 x y |
	x := 'X' asBitVector: 16.
	y := 'Y' asBitVector: 16.
	instrs := self twoAlgebraicInstructionsX: x Y: y.
	specialSimulationState := SimState ensureArch: 'powerpc'. "order is important! but this is a bug!!"
	irsb := instrs vezAt: 16r100.
	finalState := VEXEngine newEngine process: specialSimulationState irsb: irsb.
	r3 := finalState @'regs' at: 'r3'.
	self assert: r3 equals: x,y