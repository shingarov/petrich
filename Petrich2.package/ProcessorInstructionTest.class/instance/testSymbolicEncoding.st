tests - powerpc
testSymbolicEncoding
	"Compare X-form (PPCArch, p.99):
	 cmp 1,r27,r0 "
	| pdl cmp env binary rangeBF rangeRA |
	pdl := AcProcessorDescriptions powerpc.
	cmp := pdl instructionAt: #cmp.
	env := Dictionary new
		at: #l  put: 0; "Even L=0 always, the PDL leaves it variable in set_decoder"
		at: #ra put: 27;
		at: #rb put: 0;
		yourself.
	"bf is still unknown!"
	binary := (cmp inEnvironment: env) binaryEncoding.
	
	rangeBF := cmp rangeOf: 'bf'.
	self assert: rangeBF first equals: 25.
	self assert: rangeBF last  equals: 23.
	self assert: (binary subrange: rangeBF) isLeaf.
	self assert: (binary subrange: rangeBF) isSymbolic.
	
	rangeRA := cmp rangeOf: 'ra'.
	self assert: rangeRA first equals: 20.
	self assert: rangeRA last  equals: 16.
	self assert: (binary subrange: rangeRA) isLeaf.
	self deny: (binary subrange: rangeRA) isSymbolic.
	self assert: (binary subrange: rangeRA) equals: 27
