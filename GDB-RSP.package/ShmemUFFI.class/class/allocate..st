NB interface to SHM
allocate: nBytes
	| ptr |
	ptr := self shmaddr: nBytes.
	^ShmemUFFI new 
		ptr: ptr;
		yourself 