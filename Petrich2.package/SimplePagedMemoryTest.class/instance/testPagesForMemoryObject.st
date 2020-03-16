tests
testPagesForMemoryObject
	| ast mo pm |
	ast := 32 zeros.
	mo := SimMemoryObject ast: ast base: 5000.
	pm := SimPagedMemory new.
	self assert: (pm _containing_pages_mo: mo) equals: #(4096)