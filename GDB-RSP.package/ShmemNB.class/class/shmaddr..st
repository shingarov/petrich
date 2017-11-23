allocation
shmaddr: nBytes
"   NBExecutableAwareGDB shmaddr: 1024000   "
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^ self nbCallout function: #( void* shmaddr (int nBytes) )
		module: '/home/boris/ppc-hello/HelloNB.so'