access
writeInt32: int toAddr: addr
	| phys b |
	phys := self virt2phys: addr.
	phys isNil ifTrue: [ ^ self forceWriteInt32: int toAddr: addr ].
	b := processorDescription endian = #big ifTrue: [ ByteArray
			with: (int bitAnd: 16rFF000000) >> 24
			with: (int bitAnd: 16r00FF0000) >> 16
			with: (int bitAnd: 16r0000FF00) >> 8
			with: (int bitAnd: 16r000000FF)
		] ifFalse: [ ByteArray
			with: (int bitAnd: 16r000000FF)
			with: (int bitAnd: 16r0000FF00) >> 8
			with: (int bitAnd: 16r00FF0000) >> 16
			with: (int bitAnd: 16rFF000000) >> 24 ].
	NativeBoost forCurrentPlatform
		memCopy: b
		to: self hostPtr + phys
		size: 4.
