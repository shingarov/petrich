powerpc
testAddisEncoding
	"LBZ D-form (PPCArch, p.50):
	 lbz r2, 0x0001(r7) "

	| addis env grounded |
	addis := AcProcessorDescriptions powerpc instructionAt: #addis.
	env := Dictionary new
		at: #rt put: 2;
		at: #ra put: 7;
		at: #d put: 1;
		yourself.
	grounded := addis bind: env.
	self assert: grounded emit equals: 16r88470001