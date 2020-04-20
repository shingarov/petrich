tests
testListRepresentation
	| page storage |
	page := RAMPage startAddr: 10000 size: 32.
	storage := page @'_storage'.
	self assert: storage first isNil.
	self assert: storage last isNil.
	self assert: storage size equals: 32