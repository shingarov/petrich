tests - powerpc
testAddiFigure2
	| instruction operands grounded |
	instruction := AcProcessorDescriptions powerpc instructionAt: #addi.
	operands := Dictionary new
		at: 'd' put: 1;
		at: 'rt' put: 3;
		at: 'ra' put: 3;
		yourself.
	grounded := instruction inEnvironment: operands.
	self assert: grounded binaryEncoding equals: 16r38630001