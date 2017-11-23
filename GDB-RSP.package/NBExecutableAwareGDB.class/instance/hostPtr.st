shmem
hostPtr
	hostPtr isNil ifTrue: [ hostPtr := self class shmaddr: 536870912 ].
	^hostPtr 