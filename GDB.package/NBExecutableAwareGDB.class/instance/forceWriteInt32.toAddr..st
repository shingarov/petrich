access
forceWriteInt32: int toAddr: addr
	| x |
	x := super writeInt32: int toAddr: addr.
	tlb := self getTLB.
	^x
