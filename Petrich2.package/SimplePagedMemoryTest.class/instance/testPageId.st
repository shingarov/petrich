tests
testPageId
	| pm |
	pm := SimPagedMemory new.
	self assert: (pm _page_id: 0) equals: 0.
	self assert: (pm _page_id: 1) equals: 0.
	self assert: (pm _page_id: 4095) equals: 0.
	self assert: (pm _page_id: 4096) equals: 1.