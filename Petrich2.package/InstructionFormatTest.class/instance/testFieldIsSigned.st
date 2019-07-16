powerpc
testFieldIsSigned
	| d1 |
	d1 := AcProcessorDescriptions powerpc instructionFormats at: 'D1'.
	self assert: (d1 isSigned: 'd').
	self deny: (d1 isSigned: 'opcd').