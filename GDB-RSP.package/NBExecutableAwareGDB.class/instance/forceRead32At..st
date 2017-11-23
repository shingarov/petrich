access
forceRead32At: addr
	| x |
	x := super read32At: addr.
	tlb := self getTLB.
	^x
