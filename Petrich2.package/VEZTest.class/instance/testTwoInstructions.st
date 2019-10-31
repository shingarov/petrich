tests
testTwoInstructions
	| instrs irsb specialSimulationState finalState r3 |
	instrs := AcProcessorDescriptions powerpc disassemble: #( 16r3c60ABCD 16r60631234 ).
	specialSimulationState := SimState  arch: 'powerpc'.
	specialSimulationState yourself.
	irsb := instrs vezAt: 16r100.
	finalState := VEXEngine newEngine process: specialSimulationState irsb: irsb.
	r3 := finalState @'regs' at: 'r3'.
	self assert: r3 equals: 16rABCD1234