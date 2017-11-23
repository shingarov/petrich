address translation
virt2phys: anAddress
	" Answer the physical address for the given virtual address,
	 if it is mapped, nil otherwise. "
	| pageVirt pagePhys |
	pageVirt := anAddress bitAnd: self class pageMask.
	pagePhys := self tlb at: pageVirt ifAbsent: [ ^nil ].
	^pagePhys bitOr: (anAddress bitAnd: self class offsetMask)