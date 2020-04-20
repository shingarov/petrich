tests
testGlue
	| page storage x y mo |
	page := RAMPage startAddr: 0 size: 16.
	
	x := 16r1234 asBitVector: 16.
	y := 16r5678 asBitVector: 16.
	

	page store_overwrite: nil _: mo start: 10012 end: 10016.

	storage := page @'_storage'.
	self assert: storage first isNil.
	self assert: storage last notNil.
	self assert: (storage last @'base') equals: 10012.
	self assert: (storage last @'object') value equals: 16rFFFFFFFF.
	self assert: (storage last @'object') length equals: 32	