tests-powerpc
anLbz
	" lbz r2, 0xABCD(r7) "
	| powerpc lbz env  |
	powerpc := AcProcessorDescriptions powerpc.
	lbz := powerpc instructionAt: #lbz.
	env := Dictionary new
		at: #rt put: 2;
		at: #ra put: 7;
		at: #d put: 16rABCD;
		yourself.
	^lbz bind: env