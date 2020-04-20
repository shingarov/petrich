tests
testOverwriteRepresentation
	| page storage ast mo |
	page := RAMPage startAddr: 10000 size: 16.
	
	ast := 32 ones.
	mo := SimMemoryObject ast: ast base: 10012.
	page store_overwrite: nil _: mo start: 10012 end: 10016.

	storage := page @'_storage'.
	self assert: storage first isNil.
	self assert: storage last notNil.
	self assert: (storage last @'base') equals: 10012.
	self assert: (storage last @'object') value equals: 16rFFFFFFFF.
	self assert: (storage last @'object') length equals: 32	