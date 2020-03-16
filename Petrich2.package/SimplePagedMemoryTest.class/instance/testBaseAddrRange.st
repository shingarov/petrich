tests
testBaseAddrRange
	| pm range |
	pm := SimPagedMemory new.
	range := pm _page_base_addrs: 1 _: 5000.
	
	self assert: range @'start' equals: 0.
	self assert: range @'stop'  equals: 5000.	
	self assert: range @'step'  equals: 4096.