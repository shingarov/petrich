tests - mips
testSllEncoding
	" sll r1, r2, 2
	See MIPS Run, 1st Ed., p.217 et seq. "
	| mips sll env grounded |
	mips := AcProcessorDescriptions mips.
	sll := mips instructionAt: #sll.
	env := Dictionary new
		at: #rd put: 1;
		at: #rt put: 2;
		at: #shamt put: 2;
		at: #rs put: 0;  "Unused and must be set to 0"
		yourself.
	grounded := sll inEnvironment: env.
	self assert: grounded emit32 equals: 16r00020880