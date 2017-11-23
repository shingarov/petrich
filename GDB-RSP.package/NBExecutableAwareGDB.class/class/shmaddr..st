NB interface to SHM
shmaddr: size
"   NBExecutableAwareGDB shmaddr: 1024000   "
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^ self nbCallout function: #( void* shmaddr (int size) )
		module: '/home/boris/ppc-hello/HelloNB.so'