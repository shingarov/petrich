tests
testStore
	| page mo moLoadedBack |
	page := RAMPage startAddr: 8192 size: 4096.
	mo := SimMemoryObject ast: 32 ones base: 8192+4.
	page store: mo.

	self assert: page @'_page_addr' equals: 8192.
	moLoadedBack := page load: 8192 + 5.
	self assert: (moLoadedBack @'object') value equals: 16rFFFFFFFF.
	self assert: (moLoadedBack @'last_addr') equals: 8192 + 4 + 3.
	
	self assert: (page load: 8192 + 0) isNil