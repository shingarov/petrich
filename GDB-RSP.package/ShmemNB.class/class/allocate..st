allocation
allocate: nBytes
	| ptr |
	ptr := self shmaddr: nBytes.
	^self new 
		ptr: ptr;
		yourself 