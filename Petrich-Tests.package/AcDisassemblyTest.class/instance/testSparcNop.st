sparc
testSparcNop
	| instr |
	instr := AcProcessorDescriptions sparcv8 disassemble: 16r01000000.
	self assert: (instr isKindOf: GroundedProcessorInstruction).
	self assert: instr name equals: 'nop'.