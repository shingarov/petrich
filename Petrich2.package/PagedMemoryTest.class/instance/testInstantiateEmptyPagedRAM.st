tests
testInstantiateEmptyPagedRAM
	| pagedMem page |
	pagedMem := SimPagedMemory withAll: nil state: (SimState ensureArch: 'powerpc').
	pagedMem map_region: 0 length: 256 permissions: 2r101 initZero: true.
	page := pagedMem @'_pages' at: 0.
	self assert: page @'concrete_permissions'  equals: 2r101.
	