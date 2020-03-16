tests
testPageAlignDown
	| pm |
	pm := SimPagedMemory new.
	self assert: (pm _page_align_down: 0) equals: 0.
	self assert: (pm _page_align_down: 5) equals: 0.
	self assert: (pm _page_align_down: 4100) equals: 4096.
