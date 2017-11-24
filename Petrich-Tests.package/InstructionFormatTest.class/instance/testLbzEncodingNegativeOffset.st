powerpc
testLbzEncodingNegativeOffset
	"LBZ D-form (PPCArch, p.50):
	 lbz r2, -1(r7) "

	| lbz env grounded |
	lbz := AcProcessorDescriptions powerpc instructionAt: #lbz.
	env := Dictionary new
		at: #rt put: 2;
		at: #ra put: 7;
		at: #d put: -1;
		yourself.
	grounded := lbz bind: env.
	self assert: grounded emit equals: 16r8847FFFF