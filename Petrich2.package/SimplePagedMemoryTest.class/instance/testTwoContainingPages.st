tests
testTwoContainingPages
	| pm pages |
	pm := SimPagedMemory new.
	pages := pm _containing_pages: 1 _: 5000.
	self assert: pages equals: #(0 4096)