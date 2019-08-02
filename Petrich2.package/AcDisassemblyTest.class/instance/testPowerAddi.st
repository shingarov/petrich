powerpc
testPowerAddi
	| instr |
	instr := AcProcessorDescriptions powerpc disassemble: 16r38000000.   "addi r0, r0, 0, aka li r0, 0"
	self assert: instr name equals: 'addi'.
	self assert: (instr fieldValue: 'rt') equals: 0.
	self assert: (instr fieldValue: 'ra') equals: 0.
	self assert: (instr fieldValue: 'd') equals: 0.
	