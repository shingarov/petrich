tests - riscv
testRISCVadd
"	| add operands grounded |
	add := AcProcessorDescriptions riscv instructionAt: #ADD.
	operands := Dictionary new
		at: 'rs1' put: 1;
		at: 'rs2' put: 2;
		at: 'rd'  put: 3;
		yourself.
	grounded := add inEnvironment: operands.
	self assert: grounded emit32 equals: 2r00000000001000001000000110110011
"