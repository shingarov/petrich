tests
testAligned
	| pagedMem |
	pagedMem := SimPagedMemory withAll: nil state: (SimState ensureArch: 'powerpc').
	self
		assert: (pagedMem _is_page_aligned: 4096);
		deny:   (pagedMem _is_page_aligned: 4097);
		assert: (pagedMem _is_page_aligned: 4096*3)
		