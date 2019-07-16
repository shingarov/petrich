powerpc
testFormatFieldPosition
	| d1 |
	d1 := AcProcessorDescriptions powerpc instructionFormats at: 'D1'.
	self assert: (d1 positionOf: 'opcd') equals: 31.
	self assert: (d1 positionOf: 'd')    equals: 15