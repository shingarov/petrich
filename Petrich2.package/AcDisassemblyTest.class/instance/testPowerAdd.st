powerpc
testPowerAdd
	| instr |
	instr := AcProcessorDescriptions powerpc disassemble: 16r62830001.   "ori 3, 20, 0x1"
	self assert: instr name equals: 'ori'.
	self assert: (instr fieldValue: 'rs') equals: 20.
	self assert: (instr fieldValue: 'ra') equals: 3.
	self assert: (instr fieldValue: 'ui') equals: 1.
	