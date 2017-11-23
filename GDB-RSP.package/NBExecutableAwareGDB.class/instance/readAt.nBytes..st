address translation
readAt: addr nBytes: n
	| phys buf |
	phys := self virt2phys: addr.
	phys isNil ifTrue: [ ^ self forceReadAt: addr nBytes: n ].
	buf := ByteArray new: n.
	NativeBoost forCurrentPlatform
		memCopy: self hostPtr + phys
		to: buf
		size: n.
	^buf