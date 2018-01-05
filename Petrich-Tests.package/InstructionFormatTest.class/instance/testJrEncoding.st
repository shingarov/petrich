mips
testJrEncoding
	" jr r3
	See MIPS Run, 1st Ed., p.217 et seq. "
	| mips jr inst env |
	mips := AcProcessorDescriptions mips.
	jr := mips instructionAt: #jr.
	env := Dictionary new
		at: #rd put: 0;  " unused, must be 0 "
		at: #rt put: 0;  " unused, must be 0 "
		at: #shamt put: 0;  " unused, must be 0 "
		at: #rs put: 3;
		yourself.
	inst := jr bind: env.
	self assert: inst emit32 = 16r00600008