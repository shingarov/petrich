powerpc
testNegativeOffset

	| stw operands binary |
	stw := AcProcessorDescriptions powerpc instructionAt: #stw.
	operands := Dictionary new
		at: 'rs' put: 1;
		at: 'ra' put: 3;
		at: 'd' put: -1;
		yourself.
	stw := stw bind: operands.
	binary := stw emit. " 1001000000100011 0000000000000000 "
	self assert: binary equals: '10010000001000111111111111111111'