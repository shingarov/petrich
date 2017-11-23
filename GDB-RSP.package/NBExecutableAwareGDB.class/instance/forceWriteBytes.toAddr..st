access
forceWriteBytes: aByteArray  toAddr: addr
	| x |
	x := super writeBytes: aByteArray  toAddr: addr.
	tlb := self getTLB.
	^x
