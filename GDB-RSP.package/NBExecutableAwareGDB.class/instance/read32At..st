access
read32At: addr
	| phys bytes |
	phys := self virt2phys: addr.
	phys isNil ifTrue: [ ^ self forceRead32At: addr ].
	bytes := self hostPtr ptr getHandle + phys unsignedLongAt: 1.
	processorDescription endian = #big ifTrue: [ bytes := bytes swapEndian].
	^bytes