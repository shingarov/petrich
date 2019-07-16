powerpc
testPowerLbz
	"LBZ D-form (PPCArch, p.50):
	 lbz r2, 0x0001(r7).
	Test back and forth, i.e. assemble and then disassemble."

	| pdl lbz env grounded binary |
	pdl := AcProcessorDescriptions powerpc.
	lbz := pdl instructionAt: #lbz.
	env := Dictionary new
		at: #rt put: 2;
		at: #ra put: 7;
		at: #d put: 1;
		yourself.
	grounded := lbz inEnvironment: env.
	binary := grounded emit32.
	self assert: grounded equals: (pdl disassemble: binary)