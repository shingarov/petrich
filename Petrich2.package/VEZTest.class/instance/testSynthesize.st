tests
testSynthesize
	| instrs irsb specialSimulationState finalState r3 x y |
	specialSimulationState := SimState ensureArch: 'powerpc'. "order is important! but this is a bug!!"
	x := 'X' asBitVector: 16.
	y := 'Y' asBitVector: 16.
	instrs := self twoAlgebraicInstructionsX: x Y: y.
	irsb := instrs vezAt: 16r100.
	finalState := VEXEngine newEngine process: specialSimulationState irsb: irsb.
	r3 := finalState registers at: 'r3'.
	finalState solver add: r3 = 16r12345678.
	self assert: finalState solver isSatisfiable.
	self assert: (finalState solver eval: x) equals: 16r1234.
	self assert: (finalState solver eval: y) equals: 16r5678.