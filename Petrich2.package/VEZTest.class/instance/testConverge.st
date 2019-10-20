tests
testConverge
	| instrs irsb specialSimulationState finalState r3 x |
	x := 'X' asBitVector: 32.
	instrs := self twoAlgebraicInstructionsX: (x copyFrom: 31 to: 16) Y: (x copyFrom: 15 to: 0).
	specialSimulationState := SimState ensureArch: instrs first isa architectureName. "order is important! but this is a bug!!"
	specialSimulationState ref size. "Due to a VM deoptimization bug, specialSimulationState is nil unless we send it a message"
	irsb := instrs vezAt: 16r100.
	finalState := VEXEngine newEngine process: specialSimulationState irsb: irsb.
	r3 := finalState registers at: 'r3'.
	self assert: r3 equals: x