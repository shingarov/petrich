tests - mips
testJrEncoding
	" jr r3
	See MIPS Run, 1st Ed., p.217 et seq. "
	| mips jr grounded env |
	mips := AcProcessorDescriptions mips.
	jr := mips instructionAt: #jr.
	env := Dictionary new
		at: #rd put: 0;  " unused, must be 0 "
		at: #rt put: 0;  " unused, must be 0 "
		at: #shamt put: 0;  " unused, must be 0 "
		at: #rs put: 3;
		yourself.
	grounded := jr inEnvironment: env.
	self assert: grounded emit32 equals: 16r00600008