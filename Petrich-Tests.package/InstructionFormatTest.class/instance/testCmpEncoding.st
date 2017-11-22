tests-powerpc
testCmpEncoding
	" cmp 1,r31,r0 "
	| powerpc cmp inst env |
	powerpc := AcProcessorDescriptions powerpc.
	cmp := powerpc instructionAt: #cmp.
	env := Dictionary new
		at: #bf put: 1;
		at: #ra put: 31;
		at: #rb put: 0;
		yourself.
	inst := cmp bind: env.
	self assert: inst emit = 16r7C9F0000