powerpc
testPowerOri

	| pdl disassembledOri |
	pdl := AcProcessorDescriptions powerpc.
	disassembledOri := pdl disassemble: 16r60631234.
	self assert: disassembledOri format name equals: 'D4'.
	self assert: disassembledOri name equals: 'ori'.