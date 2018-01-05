powerpc
testAddisEncoding
	"addis D-form (PPCArch, p.82):
	 addis r2, r7, 0x1 "

	| addis env grounded |
	addis := AcProcessorDescriptions powerpc instructionAt: #addis.
	env := Dictionary new
		at: #rt put: 2;
		at: #ra put: 7;
		at: #d put: 1;
		yourself.
	grounded := addis bind: env.
	"001111 00010 00111 0000000000000001"
	self assert: grounded emit equals: '00111100010001110000000000000001'