tests - decoding
testSTWNegativeOffset
	| stw operands |
	stw := AcProcessorDescriptions powerpc instructionAt: #stw.
	operands := Dictionary new
		at: 'rs' put: 1;
		at: 'ra' put: 3;
		at: 'd' put: -1;
		yourself.
	self assert: (stw inEnvironment: operands) binaryEncoding equals: 2r10010000001000111111111111111111