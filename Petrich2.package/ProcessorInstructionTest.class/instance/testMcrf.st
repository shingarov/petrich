tests - powerpc
testMcrf
	"Some instruction formats, e.g. XL3 on the PowerPC,
	 include constant bitfields.
	 MCRF (PPCArch, p.46) is an example of XL3-encoded instruction:
	 opcd:6 = 2r01011;
	 bf:3;
	 0:2;
	 bfa:3;
	 0:2;
	 0:5;
	 xog:10 = 0;
	 0:1.
	 Some of these constants can appear more than once at different widths --
	 see '0:2' and '0:1' here.
	 "
	| instruction operands grounded |
	instruction := AcProcessorDescriptions powerpc instructionAt: #mcrf.
	operands := Dictionary new
		at: 'bf' put: 1;
		at: 'bfa' put: 3;
		yourself.
	grounded := instruction inEnvironment: operands.
	self assert: grounded binaryEncoding equals: 2r01001100100011000000000000000000