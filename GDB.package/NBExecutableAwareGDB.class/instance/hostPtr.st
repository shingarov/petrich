shmem
hostPtr
	hostPtr isNil ifTrue: [ hostPtr := ShmemUFFI allocate: 536870912 ].
	^hostPtr 