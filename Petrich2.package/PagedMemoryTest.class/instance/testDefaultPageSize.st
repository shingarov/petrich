tests
testDefaultPageSize
	| pagedMem |
	pagedMem := SimPagedMemory withAll: nil state: (SimState ensureArch: 'powerpc').
	self assert: pagedMem @'_page_size' equals: 4096