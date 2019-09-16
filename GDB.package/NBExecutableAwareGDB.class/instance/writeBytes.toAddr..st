access
writeBytes: aByteArray toAddr: addr
	| phys ptr |
	phys := self virt2phys: addr.
	phys isNil ifTrue: [ ^ self forceWriteBytes: aByteArray  toAddr: addr ].
	ptr := self hostPtr ptr getHandle + phys.
	aByteArray doWithIndex: [ :x :idx | ptr unsignedByteAt: idx put: x ]
