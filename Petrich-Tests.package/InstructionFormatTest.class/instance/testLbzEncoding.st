powerpc
testLbzEncoding
	"LBZ D-form (PPCArch, p.50):
	 lbz r2, 0x0001(r7) "

	| lbz env grounded |
	lbz := AcProcessorDescriptions powerpc instructionAt: #lbz.
	env := Dictionary new
		at: #rt put: 2;
		at: #ra put: 7;
		at: #d put: 1;
		yourself.
	grounded := lbz bind: env.
	self assert: grounded emit32 equals: 16r88470001