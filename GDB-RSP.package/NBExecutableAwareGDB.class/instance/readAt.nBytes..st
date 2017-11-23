address translation
readAt: addr nBytes: n
	| phys ptr |
	phys := self virt2phys: addr.
	phys isNil ifTrue: [ ^ self forceReadAt: addr nBytes: n ].
	ptr := self hostPtr ptr getHandle + phys.
	^ptr copyFrom: 1 to: n