tests
testAlignDown
	| pagedMem |
	pagedMem := SimPagedMemory withAll: nil state: (SimState ensureArch: 'powerpc').
	self assert: (pagedMem _page_align_down: 4097) equals: 4096