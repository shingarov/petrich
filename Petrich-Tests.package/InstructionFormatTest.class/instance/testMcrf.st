tests-powerpc
testMcrf
	"Some instruction formats, e.g. XL3 on the PowerPC,
	 include constant bitfields.
	 MCRF is an example of XL3-encoded instruction:
	 opcd:6 = 2r01011;
	 bf:3;
	 0:2;
	 bfa:3;
	 0:2;
	 0:5;
	 xog:10 = 0;
	 0:1.
	  "
	| instruction operands binary |
	instruction := AcProcessorDescriptions powerpc instructionAt: #mcrf.
	operands := Dictionary new
		at: 'bf' put: 1;
		at: 'bfa' put: 3;
		yourself.
	instruction := instruction bind: operands.
	binary := instruction emit. " 010011 001 00 011 00 00000 0000000000 0 "
	self assert: binary = 2r01001100100011000000000000000000
