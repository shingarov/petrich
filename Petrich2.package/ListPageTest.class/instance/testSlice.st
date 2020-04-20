tests
testSlice
	| page mo0 mo1 slices |
	page := RAMPage startAddr: 8192 size: 4096.
	mo0 := SimMemoryObject ast: 32 zeros base: 8192.
	mo1 := SimMemoryObject ast: 32 ones  base: 8192+4.
	page store: mo0; store: mo1.

	slices := page loadSlice: 8195 end: 8197.
	self assert: slices size equals: 2.
	self assert: slices first first equals: 8195.
	self assert: slices second first equals: 8196.
	self assert: (slices first second @'object') value equals: 0.
	self assert: (slices second second @'object') value equals: 16rFFFFFFFF.
