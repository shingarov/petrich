tests
testOneContainingPage
	| pm pages |
	pm := SimPagedMemory new.
	pages := pm _containing_pages: 1 _: 5.
	self assert: pages equals: #(0)