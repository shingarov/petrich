tests
testInstantiatePagedMemory
	| pm |
	pm := SimPagedMemory new.
	self assert: pm @'_page_size' equals: 4096