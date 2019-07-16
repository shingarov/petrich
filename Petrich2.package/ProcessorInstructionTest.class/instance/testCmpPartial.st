tests - powerpc
testCmpPartial
	"Compare X-form (PPCArch, p.99):
	 cmp 1,r27,r0 "
	| pdl cmp env grounded bf ra |
	pdl := AcProcessorDescriptions powerpc.
	cmp := pdl instructionAt: #cmp.
	env := Dictionary new
		at: #l  put: 0; "Even L=0 always, the PDL leaves it variable in set_decoder"
		at: #ra put: 27;
		at: #rb put: 0;
		yourself.
	"bf is still unknown!"
	grounded := cmp inEnvironment: env.
	bf := grounded field: 'bf'.
	self assert: bf sym equals: 'bf'.
	ra := grounded field: 'ra'.
	self assert: ra value equals: 27.
