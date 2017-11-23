access
writeBytes: aByteArray toAddr: addr
	| phys |
	phys := self virt2phys: addr.
	phys isNil ifTrue: [ ^ self forceWriteBytes: aByteArray  toAddr: addr ].
	NativeBoost forCurrentPlatform
		memCopy: aByteArray 
		to: self hostPtr + phys
		size: aByteArray size.
