access
read32At: addr
	| phys bytes |
	phys := self virt2phys: addr.
	phys isNil ifTrue: [ ^ self forceRead32At: addr ].
	bytes := NativeBoost forCurrentPlatform ulongAt: (self hostPtr + phys) value.
	processorDescription endian = #big ifTrue: [ bytes := bytes swapEndian].
	^bytes