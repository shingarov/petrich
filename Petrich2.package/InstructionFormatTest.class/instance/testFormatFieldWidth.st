powerpc
testFormatFieldWidth
	| d1 |
	d1 := AcProcessorDescriptions powerpc instructionFormats at: 'D1'.
	self assert: (d1 widthOf: 'opcd') equals: 6.
	self assert: (d1 widthOf: 'd')    equals: 16. "not -16!"