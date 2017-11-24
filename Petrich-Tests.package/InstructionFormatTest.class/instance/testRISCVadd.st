riscv-r32i
testRISCVadd
	| add operands binary |
	add := AcProcessorDescriptions riscv instructionAt: #ADD.
	operands := Dictionary new
		at: 'rs1' put: 1;
		at: 'rs2' put: 2;
		at: 'rd'  put: 3;
		yourself.
	add := add bind: operands.
	binary := add emit. "0000000,00010,00001,000,00011,0110011"
	self assert: binary equals: 2r00000000001000001000000110110011