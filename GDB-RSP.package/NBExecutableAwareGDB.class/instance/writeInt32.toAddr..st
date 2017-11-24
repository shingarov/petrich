access
writeInt32: int toAddr: addr
	| phys |
	phys := self virt2phys: addr.
	phys isNil ifTrue: [ ^ self forceWriteInt32: int toAddr: addr ].
	processorDescription endian = #big ifTrue: [
		self hostPtr ptr getHandle + phys
			byteAt: 1 put: ((int bitAnd: 16rFF000000) >> 24);
			byteAt: 2 put: ((int bitAnd: 16r00FF0000) >> 16);
			byteAt: 3 put: ((int bitAnd: 16r0000FF00) >> 8);
			byteAt: 4 put:  (int bitAnd: 16r000000FF)
		] ifFalse: [
		self hostPtr ptr getHandle + phys
			byteAt: 4 put: ((int bitAnd: 16rFF000000) >> 24);
			byteAt: 3 put: ((int bitAnd: 16r00FF0000) >> 16);
			byteAt: 2 put: ((int bitAnd: 16r0000FF00) >> 8);
			byteAt: 1 put:  (int bitAnd: 16r000000FF)
		]
