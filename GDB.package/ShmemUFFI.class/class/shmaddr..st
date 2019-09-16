NB interface to SHM
shmaddr: size
"   ShmemUFFI shmaddr: 1024000   "
	
	^ self
		ffiCall: #( void* shmaddr (int size) )
		module: self soName