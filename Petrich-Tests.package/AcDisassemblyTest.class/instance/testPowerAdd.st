tests - powerpc
testPowerAdd
	| instr |
	instr := AcProcessorDescriptions powerpc disassemble: 16r62830001.   "ori 3, 20, 0x1"
	self assert: (instr isKindOf: GroundedProcessorInstruction).
	self assert: instr name equals: 'ori'.