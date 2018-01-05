powerpc
testCmpEncoding
	"Compare X-form (PPCArch, p.99):
	 cmp 1,r31,r0 "
	| cmp inst env |
	cmp := AcProcessorDescriptions powerpc instructionAt: #cmp.
	env := Dictionary new
		at: #bf put: 1;
		at: #l  put: 0; "Even L=0 always, the PDL leaves it variable in set_decoder"
		at: #ra put: 31;
		at: #rb put: 0;
		yourself.
	inst := cmp bind: env.
	self assert: inst emit32 equals: 16r7C9F0000